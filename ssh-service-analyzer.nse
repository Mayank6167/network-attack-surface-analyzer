
description = [[
Network Attack Surface Analyzer - SSH Service Analyzer
Identifies SSH service information on the target port.
]]

author = "Mayank Raj"
license = "Same as Nmap"
categories = {"safe", "discovery"}

local shortport = require "shortport"

portrule = shortport.port_or_service(22, "ssh")

action = function(host, port)
    local output = {}

    table.insert(output, "=== Network Attack Surface Analysis ===")
    table.insert(output, "")
    table.insert(output, "Protocol : SSH")
    table.insert(output, "Port : " .. port.number)
    table.insert(output, "Service : SSH")

    return table.concat(output, "\n")
end
