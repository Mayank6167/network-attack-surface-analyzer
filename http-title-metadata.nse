
local http = require "http"
local shortport = require "shortport"
local stdnse = require "stdnse"
local string = require "string"

description = [[
Enhanced HTTP Title Analyzer.
Displays the page title, HTTP status code,
and content type of an HTTP response.
]]

author = "Mayank Raj"
license = "Same as Nmap"
categories = {"safe", "discovery"}

portrule = shortport.http

action = function(host, port)
    local path = stdnse.get_script_args(
        SCRIPT_NAME .. ".url"
    ) or "/"

    local resp = http.get(host, port, path)

    if not resp then
        return "HTTP request failed"
    end

    local output = {}

    table.insert(output, "=== HTTP Title Metadata ===")
    table.insert(output, "Requested Path : " .. path)

    if resp.status then
        table.insert(
            output,
            "HTTP Status Code : " .. tostring(resp.status)
        )
    else
        table.insert(output, "HTTP Status Code : Unavailable")
    end

    local content_type =
        resp.header and resp.header["content-type"]

    table.insert(
        output,
        "Content Type : " .. (content_type or "Unavailable")
    )

    local title

    if resp.body then
        title = string.match(
            resp.body,
            "<[Tt][Ii][Tt][Ll][Ee][^>]*>([^<]*)</[Tt][Ii][Tt][Ll][Ee]>"
        )
    end

    if title and title ~= "" then
        title = string.gsub(title, "[\n\r\t]", " ")
        title = string.gsub(title, "^%s*(.-)%s*$", "%1")

        if #title > 65 then
            title = string.sub(title, 1, 62) .. "..."
        end

        table.insert(output, "Page Title : " .. title)
    else
        table.insert(output, "Page Title : Not found")
    end

    return table.concat(output, "\n")
end
