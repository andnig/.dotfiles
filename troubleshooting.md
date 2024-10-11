# Troubleshooting

## image.nvim

If image.nvim fails with warning "magick" not found:

1. Find, where your libMagickWand... library.

   - On MacOS: `find /opt/homebrew/lib -name 'libMagickWand*.dylib'`
   - On Linux: `find /home/linuxbrew/.linuxbrew/lib -name 'libMagickWand*.so'`

2. Open file `~/.luarocks/share/lua/5.1/magick/wand/lib.lua` using nvim
   Change the method `lib = try_to_load("MagickWand", function()...`

   To (change the whole function, including the commented-out stuff)

   ```lua
   lib = try_to_load("/home/linuxbrew/.linuxbrew/lib/libMagickWand-7.Q16HDRI.so", function()
     -- local lname = get_flags():match("-l(MagickWand[^%s]*)")
     -- local suffix
     -- if ffi.os == "OSX" then
     --   suffix = ".dylib"
     -- elseif ffi.os == "Windows" then
     --   suffix = ".dll"
     -- else
     --   suffix = ".so"
     -- end
     -- return lname and "lib" .. lname .. suffix
   end)
   ```
