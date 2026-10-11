
local http = require "http"
local shortport = require "shortport"
local stdnse = require "stdnse"
local string = require "string"

description = [[
Multi-Page HTTP Title Analyzer.
Retrieves page titles and HTTP status codes
for multiple user-specified HTTP paths.
]]

author = "Mayank Raj"
license = "Same as Nmap"
categories = {"safe", "discovery"}

portrule = shortport.http

action = function(host, port)
    local paths_arg = stdnse.get_script_args(
        SCRIPT_NAME .. ".paths"
    ) or "/"

    local paths = {}

    for path in string.gmatch(paths_arg, "[^,]+") do
        path = string.gsub(path, "^%s*(.-)%s*$", "%1")

        if path ~= "" then
            if string.sub(path, 1, 1) ~= "/" then
                path = "/" .. path
            end

            table.insert(paths, path)
        end
    end

    if #paths == 0 then
        return "No valid paths provided"
    end

    local output = {}

    table.insert(
        output,
        "=== Multi-Page HTTP Title Analysis ==="
    )

    for _, path in ipairs(paths) do
        table.insert(output, "")
        table.insert(output, "Requested Path : " .. path)

        local resp = http.get(host, port, path)

        if not resp then
            table.insert(output, "Request Status : Failed")
        else
            if resp.status then
                table.insert(
                    output,
                    "HTTP Status Code : " .. tostring(resp.status)
                )
            else
                table.insert(
                    output,
                    "HTTP Status Code : Unavailable"
                )
            end

            local title

            if resp.body then
                title = string.match(
                    resp.body,
                    "<[Tt][Ii][Tt][Ll][Ee][^>]*>([^<]*)</[Tt][Ii][Tt][Ll][Ee]>"
                )
            end

            if title and title ~= "" then
                title = string.gsub(title, "[\n\r\t]", " ")
                title = string.gsub(
                    title,
                    "^%s*(.-)%s*$",
                    "%1"
                )

                if #title > 65 then
                    title = string.sub(title, 1, 62) .. "..."
                end

                table.insert(output, "Page Title : " .. title)
            else
                table.insert(output, "Page Title : Not found")
            end
        end
    end

    return table.concat(output, "\n")
end
