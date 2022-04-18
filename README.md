# Invisible
A simple module to encode messages with invisible zero-width characters

```lua
local Hello = "Hello, World!"
local Encoded = Invisible.Encode(Hello)
local Decoded = Invisible.Decode(Encoded)

print("Original:", Hello) --> Hello, World!
print("Encoded:", Encoded) --> 󠁈󠁥󠁬󠁬󠁯󠀬󠀠󠁗󠁯󠁲󠁬󠁤󠀡
print("Decoded:", Decoded) --> Hello, World!
```
