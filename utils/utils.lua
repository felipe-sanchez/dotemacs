-- Convenience math functions
mx = mx or {}

-- Returns sum over a. If x is supplied, then 
-- returns v = \sum_i a[i] * x^(i-1) with i = 1..#a

function mx.sum(a, x)
	local v = a[1]
	if x then
		for i = 2, #a do
			v = a[i] * x^(i-1)
		end
	else
		for i = 2, #a do
			v = v + a[i]
		end
	end

	return v
end

-- Returns the index such that a[i] < x < a[i+1]. a[] should be
-- a sorted lua table. 
function mx.bfsearch(a, x, imin, imax)
	imin = imin or 1
	imax = imax or #a
	while imax - imin > 1 do
		local imid = math.round(0.5 * (imin+imax))
		
		if a[imid] < x then
			imin = imid + 1
		elseif a[imid] > x then
			imax = imax - 1
		else
			return imid
		end
	end
	return imin
end

-- Returns an linear piecewise interpolator function over the two -- Lua lists x and y. 
function mx.pw(x, y)
	return function(v)
		local i = mx.bfsearch(x, v)
		return (v-x[i])/(x[i+1]-x[i])*(y[i+1]-y[i]) + y[i]
	end
end

-- Buffers
buf = buf or {}

function buf.buffer()
	local b = {}
	setmetatable(b, buf)
	return b
end

function buf.append(buf, ...)
	for i = 1, select('#', ...) do
		buf[#buf+1] = tostring(select(i, ...))
	end
	return buf
end

function buf.appendf(buf, fmt, ...)
	buf[#buf+1] = string.format(fmt, ...)
	return buf
end

function buf.read(buf, f, what, mode)
	what = what or "*l"
	local fid = f
	if type(f) == "string" then
		fid = io.open(f)
	end
	
	assert(fid)
	
	local c = fid:read(what)
	while c do
		if mode == "lower" then
			buf:append(c:lower())
		elseif mode == "upper" then
			buf:append(c:upper())
		elseif type(mode) == "function" then
			local ret = mode(c)
			if ret then buf:append(ret) end
		else
			buf:append(c)
		end
		c = fid:read(what)
	end
	
	if type(f) == "string" then
		fid:close()
	end
	
	return buf
end

function buf.tostring(buf, fmt, ...)
	return table.concat(buf)
end

function buf.clear(buf)
	for i = 1, #buf do buf[i] = nil end
end

function buf.__index(b, n)
	return buf[n]
end

function buf.save(buf, fn)
	local fid = io.open(fn, "w")
	if not fid then return  end
	fid:write(buf:tostring())
	fid:close()
	return fn
end

-- Extended I/O library
ex = ex or {}
function ex.capture(cmd)
	local pipe = io.popen(cmd, "r")
	local str = pipe:read("*a")
  pipe:close()
	return str
end

function ex.capturelines(cmd)
	local pipe = io.popen(cmd, "r")
  local ret = {}
  for l in pipe:lines() do
     ret[#ret+1] = l
  end
  
  pipe:close()
	return ret
end

function ex.exists(fn)
	local fid = io.open(fn)
	if not fid then return false end
	fid:close()
	return true
end	

function ex.findfile(fn, paths) 
	if ex.exists(fn) then
		return fn
	elseif paths then
		for i = 1, #paths do
			local lfn = paths[i] .. ex.basename(fn)
			print(lfn, fn)
			if ex.exists(lfn) then return lfn end
		end
	end
end

function ex.basename(fn)
	if not fn:find("/") then
		return fn
	else
		return fn:match(".-([^/]+)$")
	end
end

function ex.trim(str)
	return (string.gsub(str, "^%s*(.-)%s*$", "%1"))
end

function ex.loadfile(fn)
	local fid = io.open(fn)
	if not fid then return nil end
	local ret = fid:read("*a")
	fid:close()
	return ret
end

function ex.tic()
	local time = os.time()
	ex.__tic = time
	return time
end

function ex.toc(ticid, silent)
	ticid = ticid or ex.__tic
	local now = os.time()
	if not silent then
		print(os.difftime(now, ticid))
	end
	return os.difftime(now, ticid)
end

function ex.fprintf(fid, ...)
   fid:write(string.format(...))
end

function ex.printf(...)
   io.write(string.format(...))
end

function ex.sandbox(...)
	local ts = {...}
	local fns = {}
	for i = 1, #ts do
		fns[ts] = {}
		for k, v in pairs(ts[i]) do
			if type(v) == "function" then
				fn[ts][k] = v
				ts[k] = function() error(string.format("Function %s not permitted.", tostring(k))) end
			end
		end
	end

	return function()
		for i = 1, #ts do
			for k, v in pairs(ts[i]) do
				if type(v) == "function" then
					ts[k] = fn[ts][k]
				end
			end
		end
	end
end

local function str_rep(v)
	if type(v) == "string" then
		return string.format("[==[%s]==]", v)
	else
		return tostring(v)
	end
end

function ex.save_table(t, sf, b, ks, depth)
	local b = b or buf.buffer()
	local ks = ks or {}
	local sf = sf or function() return false end
	local depth = depth or 0
	if depth == 0 then
		b:append("return function()\nlocal _0 = {}\n")
	end
	local up = up or "_"
	
	for k, v in pairs(t) do
		local ret = sf(v, k, depth+1)
		if ret then
			b:append(ret)
		elseif type(v) == "table" and not ks[v] then
			ks[v] = true
			if v.__serialize then
				sf(v, k, parent)
			else
				b:appendf("local _%d = {}\n", depth+1)
				ex.save_table(v, sf, b, ks, depth+1)
				b:appendf("_%d[ %s ] = _%d\n", depth, str_rep(k), depth + 1)
			end
		elseif type(v) == "string" or type(v) == "number" or type(v) == "boolean" then
			b:appendf("_%d[ %s ] = %s\n",
				depth, str_rep(k), str_rep(v))
		end
	end
	
	if depth == 0 then
		b:append("return _0\nend\n")
	end
	return b:tostring()
end
