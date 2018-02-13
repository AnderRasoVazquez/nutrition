project('com.github.anderrasovazquez.nutrition', 'vala', 'c',
    version : '0.1.0',
    license: 'GPL-3.0'
)

add_project_arguments([
        '-DGETTEXT_PACKAGE="@0@"'.format(meson.project_name())
    ],
    language: 'c',
)

i18n = import('i18n')

subdir('po')
subdir('src')

executable(
    meson.project_name(),
    sources,
    dependencies: [
        dependency('gtk+-3.0'),
        dependency('granite'),
        dependency('libsoup-2.4'),
        dependency('json-glib-1.0')
    ],
    install: true
)
