# stb_image VAPI

## Description
A basic VAPI to use the stb_image single header library with Vala, includes a demo application using SDL to draw your distrobution logo.

## Dependencies
- `meson`

## Usage
1. Create a subproject folder in your root project folder
2. Create a file named `stb_image` with the following content

```ini
# Git Wrap
[wrap-git]
url = https://github.com/lxmcf/stb_image_vapi
revision = meson
```
3. Add the following to your main `meson.build` file

```meson
stbi_proj = subproject ('stb_image')
stbi_dep = stbi_proj.get_variable ('stbi_dep')
```

4. Add `stbi_dep` to your project's dependencies