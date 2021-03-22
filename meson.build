project ('stb_image', [ 'vala', 'c' ], version: 'meson-1.0')

# Variables
source_dir  = meson.current_source_dir ()
vapi_dir    = source_dir /'vapi'

# Compilers
valac   = meson.get_compiler ('vala')
cc      = meson.get_compiler ('c')

# Compiler arguments
valac_arguments = [
    '--vapidir', vapi_dir
]

cc_arguments = [
    '-DSTB_IMAGE_IMPLEMENTATION'
]

add_project_arguments (valac_arguments, language: 'vala')
add_project_arguments (cc_arguments, language: 'c')

stbi_dep = declare_dependency (
    version: meson.project_version (),

    dependencies: [
        valac.find_library ('stb_image', dirs: vapi_dir)
    ],

    include_directories: [
        include_directories ('include')
    ]
)