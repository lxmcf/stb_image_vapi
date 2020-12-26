# stb_image VAPI

## Description
A basic VAPI to use the stb_image single header library with Vala, includes a demo application using SDL to draw your distrobution logo.

## Demo Dependencies
- `valac`
- `glib-2.0`
- `libsdl2-dev`
- `meson`

## Build & Run Demo
```sh
cd demo
meson build && cd build
ninja

./demo
```