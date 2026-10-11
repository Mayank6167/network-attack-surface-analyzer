
description = [[
Network Attack Surface Analyzer - HTTP Service Analyzer
Identifies HTTP service information on the target port.
]]

author = "Mayank Raj"
license = "Same as Nmap"
categories = {"safe", "discovery"}

local shortport = require "shortport"

portrule = shortport.port_or_service(80, "http")

action = function(host, port)
    local output = {}

    table.insert(output, "=== Network Attack Surface Analysis ===")
    table.insert(output, "")
    table.insert(output, "Protocol : HTTP")
    table.insert(output, "Port : " .. port.number)
    table.insert(output, "Service : HTTP")

    return table.concat(output, "\n")
end
