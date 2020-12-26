[CCode (cprefix = "stbi_", cheader_filename = "stb_image.h")]
namespace STB.Image {
    [CCode (cname = "stbi_load")]
    public static void* load (string file, out int width, out int height, out int bpp, int desired_channels = 4);

    [CCode (cname = "stbi_load_from_file")]
    public static void* load_from_filestream (GLib.FileStream file, out int width, out int height, out int bpp, int desired_channels = 4);

    [CCode (cname = "stbi_load_from_memory")]
    public static void* load_from_memory (void* mem, int length, out int width, out int height, out int bpp, int desired_channels = 4);


    [CCode (cname = "stbi_hdr_to_ldr_gamma")]
    public static void set_hdr_to_ldr_gamma (float gamma);

    [CCode (cname = "stbi_hdr_to_ldr_scale")]
    public static void set_hdr_to_ldr_scale (float scale);

    [CCode (cname = "stbi_ldr_to_hdr_gamma")]
    public static void set_ldr_to_hdr_gamma (float gamma);

    [CCode (cname = "stbi_ldr_to_hdr_scale")]
    public static void set_ldr_to_hdr_scale (float scale);


    [CCode (cname = "stbi_set_flip_vertically_on_load")]
    public static void set_flip_vertically_on_load (bool flip);

    [CCode (cname = "stbi_set_unpremultiply_on_load")]
    public static void set_unpremultiply_on_load (bool unpremultiply);

    [CCode (cname = "stbi_is_hdr")]
    public static bool is_file_hdr (string file);

    [CCode (cname = "stbi_is_hdr_from_file")]
    public static bool is_file_hdr_from_filestream (GLib.FileStream file);
}
