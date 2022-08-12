# Invisible
**A simple module to encode messages with invisible zero-width characters.**
# Documentation
### Encode
**Encodes the text into invisible characters**
```html
<string> Invisible.Encode(<string> Message)
```
### Decode
**Decodes encoded invisible messages**
```html
<string> Invisible.Decode(<string> Message)
```
### Encrypt
**Encrypts the text into invisible characters with a key**
```html
<string> Invisible.Encrypt(<string> Message, <string> Key)
```
### Decrypt
**Decrypts encrypted invisible messages with a key**
```html
<string> Invisible.Decrypt(<string> Message, <string> Key)
```
# Example
```lua
local Hello = "Hello, World!"
local Encoded = Invisible.Encode(Hello)
local Decoded = Invisible.Decode(Encoded)

print("Original:", Hello) --> Hello, World!
print("Encoded:", Encoded) --> 󠁈󠁥󠁬󠁬󠁯󠀬󠀠󠁗󠁯󠁲󠁬󠁤󠀡
print("Decoded:", Decoded) --> Hello, World!
```
