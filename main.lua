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

function Invisible.Encrypt(Original, Key)
    local Encrypted = {}
    local Key = {string.byte(Key, 1, -1)}
    local Original = {string.byte(Original, 1, -1)}

    for Index = 1, #Original do
        table.insert(Encrypted, string.char(bit32.bxor(Original[Index], Key[Index % #Key + 1])))
    end

    return Invisible.Encode(table.concat(Encrypted))
end

function Invisible.Decrypt(Encrypted, Key)
    local Decrypted = {}
    local Key = {string.byte(Key, 1, -1)}
    local Encrypted = {string.byte(Invisible.Decode(Encrypted), 1, -1)}

    for Index = 1, #Encrypted do
        table.insert(Decrypted, string.char(bit32.bxor(Encrypted[Index], Key[Index % #Key + 1])))
    end

    return table.concat(Decrypted)
end

return Invisible
