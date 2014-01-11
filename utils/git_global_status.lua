-- (c) 2014, Stefano Meschiari
--
-- Simple "daemon" that scans all git repositories and checks whether
-- (a) there are repositories that have changes to be committed, and
-- (b) there are repositories whose remote is ahead of the current version.
--
-- A repository statistics in the form [total/needs_commit/needs_pull] and a detailed
-- report is saved in ~/.git_global_stats and ~/.git_global_report, respectively.
--
-- For convenience, I put "[`cat ~/.git_global_stats`]" as part of my bash prompt to
-- check the status of my git repositories, and an alias git_global="cat ~/.git_global_report | less" to
-- see a list of repos and their status.
--
-- By default, check every minute.
require 'utils'

local capture = ex.capture
local capturelines = ex.capturelines
local fprintf = ex.fprintf
local home = os.getenv("HOME")
local defaultdir = home .. "/Projects/"
local dirs = arg
local dry_run = false

if arg[1] == "--dry-run" then
   dry_run = true
   table.remove(dirs, 1)
end
if not dirs[1] then
   dirs[1] = defaultdir
end


local git = {}
git.clean = {}
git.needscommit = {}
git.uptodate = {}
git.needspull = {}

function git.repos(dir)
   return capturelines("cd " .. dir .. "; find . -name .git -print")
end

function git.status(dir)
   local st = capture("cd " .. dir .. "; git status 2>&1 -s")

   if (dry_run) then
      print(dir, st)
   end
   
   if (st == "") then
      return git.clean, st
   else
      return git.needscommit, st
   end
end

function git.remotestatus(dir)
   local st = capture("cd " .. dir .. "; git pull 2>&1 -v --dry-run")
   if (dry_run) then
      print(dir, st)
   end
   
   if (st:find("up to date")) then
      return git.clean, st
   else
      return git.needspull, st
   end
end

while true do
   local b = buf.buffer()
   local n = 0
   local nneedscommit = 0
   local nneedspull = 0
   
   for _, dir in ipairs(dirs) do
      for _, repo in ipairs(git.repos(dir)) do
         local name = repo:match("([^%./]+)/.git$")
         local repodir = dir .. "/" .. repo:match("^(.+).git$")
         local st, stret = git.status(repodir)
         local rst, rstret = git.remotestatus(repodir)
         n = n + 1
         if st == git.needscommit then
            nneedscommit = nneedscommit + 1
         end
         if rst == git.needspull then
            nneedspull = nneedspull + 1
         end

         if st == git.needscommit or rst == git.needspull then
            b:append(name, "\n", string.rep("=", name:len()), "\n")
            b:append(st == git.needscommit and stret or "No file changed/added.\n",
                  rst == git.needspull and rstret or "No pull needed.\n", "\n")         
         end
      end
   end

   local f = io.open(home .. "/.git_global_stats", "w")
   fprintf(f, "[%d/c%d/r%d]", n, nneedscommit, nneedspull)
   f:close()

   b:save(home .. "/.git_global_report")
   if (dry_run) then
      os.exit()
   end
   os.execute("sleep 30")
end
