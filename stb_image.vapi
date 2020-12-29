[CCode (cprefix = "stbi_", cheader_filename = "stb_image.h")]
namespace Stbi {
    public const int STBI_VERSION;

    public enum Components {
        DEFAULT = 0,
        GREY = 1,
        GREY_ALPHA = 2,
        RGB = 3,
        RGB_ALPHA = 4
    }

    /**
     * Loads an image file and returns a generic pointer.
     *
     * This function takes in a file and returns a generic pointer while outputting image data.
     * However this function has the below imitations as part of stb_image:
     * * No 12 bits per chanel JPEG
     * * No JPEGs with arithmetic coding
     * * GIF always returns 4 bits per pixel
     *
     * As this function return's a generic pointer, the memory will need to manually free'd like below:
     *
     * {{{
     *  void* pixel_data = Stbi.load ("example.png", out width, out height, out bpp);
     *
     *  // Image processing code
     *
     *  delete pixel_data;
     * }}}
     *
     * @param string File to load
     * @param int Returns the image width
     * @param int Returns the image height
     * @param int Returns the bytes per pixel
     * @param int Requested amount of image components
     * @return Generic pointer to image pixel data
     */
    [CCode (cname = "stbi_load")]
    public static void* load (string file, out int width, out int height, out int bpp, int desired_channels = 4);

    /**
     * Loads an image filestream and returns a generic pointer.
     *
     * This function takes in a file and returns a generic pointer while outputting image data.
     * This function inherits the same limitations as Stbi.load ();
     *
     *
     * @see Stbi.load
     * @param GLib.FileStream FileStream to load
     * @param int Returns the image width
     * @param int Returns the image height
     * @param int Returns the bytes per pixel
     * @param int Requested amount of image components
     * @return Generic pointer to image pixel data
     */
    [CCode (cname = "stbi_load_from_file")]
    public static void* load_from_filestream (GLib.FileStream file, out int width, out int height, out int bpp, int desired_channels = 4);

    /**
     * Loads an image buffer and returns a generic pointer.
     *
     * This function takes in a file and returns a generic pointer while outputting image data.
     * This function inherits the same limitations as Stbi.load ();
     *
     *
     * @see Stbi.load
     * @param void* File buffer to load
     * @param int Returns the image width
     * @param int Returns the image height
     * @param int Returns the bytes per pixel
     * @param int Requested amount of image components
     * @return Generic pointer to image pixel data
     */
    [CCode (cname = "stbi_load_from_memory")]
    public static void* load_from_memory (void* mem, int length, out int width, out int height, out int bpp, int desired_channels = 4);

    /**
     * Sets the HDR to LDR gamma used when loading HDR images with Stbi.load ();
     *
     * @param float The desired gamma level
     */
    [CCode (cname = "stbi_hdr_to_ldr_gamma")]
    public static void set_hdr_to_ldr_gamma (float gamma);

    /**
     * Sets the HDR to LDR scale used when loading HDR images with Stbi.load ();
     *
     * @param float The desired scale
     */
    [CCode (cname = "stbi_hdr_to_ldr_scale")]
    public static void set_hdr_to_ldr_scale (float scale);

    /**
     * Sets the LDR to HDR gamma used when loading LDR images with Stbi.load ();
     *
     * @param float The desired gamma level
     */
    [CCode (cname = "stbi_ldr_to_hdr_gamma")]
    public static void set_ldr_to_hdr_gamma (float gamma);

    /**
     * Sets the LDR to HDR scale used when loading LDR images with Stbi.load ();
     *
     * @param float The desired gamma level
     */
    [CCode (cname = "stbi_ldr_to_hdr_scale")]
    public static void set_ldr_to_hdr_scale (float scale);

    /**
     * Indicates whether any given files should be flipped when loading.
     *
     * This function can be used to flip an image on load meaning the first read pixel is the bottom left.
     * This is required if working with raw OpenGL for example.
     *
     * @param bool Whether to flip
     */
    [CCode (cname = "stbi_set_flip_vertically_on_load")]
    public static void set_flip_vertically_on_load (bool flip);

    /**
     * Indicates whether to force a divide per pixel to remove any premultiplied alpha.
     *
     * @param bool Whether to unpremultiply
     */
    [CCode (cname = "stbi_set_unpremultiply_on_load")]
    public static void set_unpremultiply_on_load (bool unpremultiply);

    /**
     * Indicates whether to process iPhone images bac to normal RGB
     *
     * @param bool Whether to process image
     */
    [CCode (cname = "stbi_convert_iphone_png_to_rgb")]
    public static void set_convert_iphone_png_to_rgb (bool convert);

    /**
     * Returns whether the provided file is HDR or not.
     *
     * @param bool If file is HDR
     */
    [CCode (cname = "stbi_is_hdr")]
    public static bool is_file_hdr (string file);

    /**
     * Returns whether the provided file stream is HDR or not.
     *
     * @param bool If file stream is HDR
     */
    [CCode (cname = "stbi_is_hdr_from_file")]
    public static bool is_file_hdr_from_filestream (GLib.FileStream file);

    /**
     * Free's memory returned from file loading functions.
     *
     * This fucntion will free the returned value from Stbi.load() functions, this is no different from delete mem;
     *
     * @param void* Memory to free
     */
    [CCode (cname = "stbi_image_free")]
    public static void image_free (void* mem);
}
