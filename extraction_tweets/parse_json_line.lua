#!/usr/bin/env lua

local JSON  = require "JSON"
local utils = require "toolbox"

local counter = 1
for line in io.stdin:lines() do
--  io.stderr:write(counter.."\n")
  counter = counter + 1
  local plain = JSON:decode(line)
  if plain.text then
    local processed_text = plain.text:gsub("\n", "  ")
    assert(not processed_text:match("\t"))
    assert(not processed_text:match("\n"))
    print(string.format("%s\t%s", plain.timestamp_ms, processed_text))
  end
end
