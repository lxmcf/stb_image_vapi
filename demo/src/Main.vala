using SDL.Video;

Window sdl_window;
Renderer sdl_renderer;

Texture sdl_texture;
Rect sdl_texture_quad;

SDL.Event event;

bool is_running;

public static int main (string[] args) {
    int initialised = init ();

    if (initialised != 0) {
        return initialised;
    }

    is_running = true;
    sdl_texture = load_texture ("/.VolumeIcon.png");
    sdl_window.set_minsize ((int)sdl_texture_quad.w, (int)sdl_texture_quad.h);

    while (is_running) {
        if (SDL.Event.poll (out event) == 1) {
            if (event.type == SDL.EventType.QUIT) {
                is_running = false;
            }
        }

        sdl_renderer.set_draw_color (88, 151, 233, 255);
        sdl_renderer.clear ();
        int window_width, window_height;
        sdl_window.get_size (out window_width, out window_height);

        sdl_renderer.copy (
            sdl_texture,
            sdl_texture_quad,
            {
                (int)((window_width / 2) - (sdl_texture_quad.w / 2)),
                (int)((window_height / 2) - (sdl_texture_quad.h / 2)),
                sdl_texture_quad.w,
                sdl_texture_quad.h
            }
        );

        sdl_renderer.present ();
    }

    SDL.quit ();

    return initialised;
}

public int init () {
    int initialised = SDL.init (SDL.InitFlag.VIDEO);

    if (initialised == 0) {
        sdl_window = new Window ("Demo Application", Window.POS_CENTERED, Window.POS_CENTERED, 640, 360, WindowFlags.RESIZABLE);
        sdl_renderer = Renderer.create (sdl_window, -1, 0);
    }

    return initialised;
}

public Texture load_texture (string filename) {
    int width, height, bytes_per_pixel;
    void* pixel_data = Stbi.load (filename, out width, out height, out bytes_per_pixel, 4);

    Texture texture = Texture.create (
        sdl_renderer, PixelRAWFormat.ABGR8888, TextureAccess.STATIC, width, height
    );

    sdl_texture_quad = {
        0, 0, width, height
    };

    texture.set_blend_mode (BlendMode.BLEND);
    texture.update (sdl_texture_quad, pixel_data, bytes_per_pixel * width);

    delete pixel_data;

    return texture;
}