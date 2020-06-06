#!/usr/bin/env ruby

#            ---------------------------------------------------
#                             Utopia Framework                  
#            ---------------------------------------------------
#                  Copyright (C) <2020>  <Entynetproject>       
#
#        This program is free software: you can redistribute it and/or modify
#        it under the terms of the GNU General Public License as published by
#        the Free Software Foundation, either version 3 of the License, or
#        any later version.
#
#        This program is distributed in the hope that it will be useful,
#        but WITHOUT ANY WARRANTY; without even the implied warranty of
#        MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#        GNU General Public License for more details.
#
#        You should have received a copy of the GNU General Public License
#        along with this program.  If not, see <http://www.gnu.org/licenses/>.

attack = ARGV[0]
rhost = ARGV[1]
rport = ARGV[2]
cmd = ARGV[3]

if rhost == "none" or rhost == nil
    rhost = ""
end
if rport == "none" or rport == nil
    rport = ""
end
if cmd == "none" or cmd == nil
    cmd = ""
end

if attack == "ssh_exec_noauth"
    if rhost.length >= 12 or rport.length >= 12 or cmd.length >= 12
        if rhost.length >= rport.length and rhost.length >= cmd.length
            stf = " " * (rhost.length - 3)
            fts = rhost.length + 2
        end
        if rport.length >= rhost.length and rport.length >= cmd.length
            stf = " " * (rport.length - 3)
            fts = rport.length + 2
        end
        if cmd.length >= rhost.length and cmd.length >= rport.length
            stf = " " * (cmd.length - 3)
            fts = cmd.length + 2
        end
    else
        stf = " " * 8
        fts = 13
    end
    puts ""
    puts "Module Options"
    puts "=============="
    puts ""
    puts "    Option        Value#{stf}Description"
    puts "    ------        -----#{stf}-----------"
    printf "    %-14s%-#{fts}s%s\n", "RHOST", rhost, "Remote host."
    printf "    %-14s%-#{fts}s%s\n", "RPORT", rport, "Remote port."
    printf "    %-14s%-#{fts}s%s\n", "CMD", cmd, "Command to execute."
    puts ""
else
    if rhost.length >= 12 or rport.length >= 12
        if rhost.length >= rport.length
            stf = " " * (rhost.length - 3)
            fts = rhost.length + 2
        end
        if rport.length >= rhost.length
            stf = " " * (rport.length - 3)
            fts = rport.length + 2
        end
    else
        stf = " " * 8
        fts = 13
    end
    puts ""
    puts "Module Options"
    puts "=============="
    puts ""
    puts "    Option        Value#{stf}Description"
    puts "    ------        -----#{stf}-----------"
    printf "    %-14s%-#{fts}s%s\n", "RHOST", rhost, "Remote host."
    printf "    %-14s%-#{fts}s%s\n", "RPORT", rport, "Remote port."
    puts ""
end
