local Invisible = {}

local Encode = {}
local Decode = {}

for i = 0, 255 do
    local Character, Invisible = string.char(i), utf8.char(i + 0xE0000)

    Encode[Character] = Invisible
    Decode[Invisible] = Character
end

function Invisible.Encode(Original)
    return string.gsub(Original, ".", Encode)
end

function Invisible.Decode(Encoded)
    return string.gsub(Encoded, "....", Decode)
end

return Invisible
