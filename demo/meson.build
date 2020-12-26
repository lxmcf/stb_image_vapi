project ('demo', ['vala', 'c'], version: '1.0')

source_directory = meson.current_source_dir ()
vapi_directory = join_paths (source_directory, 'vapi')

add_project_arguments (['--vapidir', join_paths(meson.current_source_dir(), 'vapi')], language: 'vala')

demo_dependencies = [
    dependency ('glib-2.0'),
    meson.get_compiler ('c').find_library ('SDL2')
]

demo_vapi = [
    meson.get_compiler('vala').find_library('sdl2', dirs: vapi_directory),
    meson.get_compiler('vala').find_library('stb_image', dirs: vapi_directory)
]

demo_sources = [
    'src/Main.vala',

    'src/stb_image.c'
]

executable (
    meson.project_name (),
    demo_sources,

    link_args: [ '-lm' ],

    dependencies: [
        demo_dependencies,
        demo_vapi
    ],

    include_directories: [
        include_directories ('include')
    ]
)