
local Invisible = {}

local Characters = {}
local Reverse = {}

for i = 0, 255 do
    local Character, Number = string.char(i), i + 0xE0000

    Characters[Character] = Number

    local Bytes = {string.byte(utf8.char(Number), 1, -1)}

    for i = 1, #Bytes do
        Bytes[i] = Bytes[i] + 12
    end

    Reverse[string.gsub(table.concat(Bytes, "."), "255.172.", "")] = Character
end

function Invisible.Encode(Original)
    local Encoded = ""

    for i, v in next, string.split(Original, "") do
        Encoded = Encoded .. utf8.char(Characters[v])
    end

    return Encoded
end

function Invisible.Decode(Encoded)
    local Decoded = ""
    local Bytes = {string.byte(Encoded, 1, -1)}

    for i = 1, #Bytes do
        Bytes[i] = Bytes[i] + 12
    end

    Bytes = table.concat(Bytes, ".")

    local Chunks = {}

    local Cut
    local Chunk = ""
    for Byte in string.gmatch(string.gsub(Bytes, "255.172", ""), "([^.]+)") do
        Chunks[#Chunks + 1] = Cut and Chunk .. "." .. Byte or nil
        Chunk = Byte

        Cut = not Cut
    end

    for i,v in next, Chunks do
        Decoded = Decoded .. Reverse[v]
    end

    return Decoded
end

return Invisible
