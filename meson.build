project('com.github.anderrasovazquez.nutrition', 'vala', 'c')

executable(
    meson.project_name(),
    'src/Main.vala',
    'src/Views/SearchResultView.vala',
    'src/Views/MainWindow.vala',
    'src/Views/WelcomeView.vala',
    'src/Controllers/FoodSearcher.vala',
    'src/Controllers/FacadeNutrition.vala',
    'src/Widgets/Header.vala',
    'src/Widgets/ListBoxRowWithData.vala',
    dependencies: [
        dependency('gtk+-3.0'),
        dependency('granite'),
        dependency('libsoup-2.4'),
        dependency('json-glib-1.0')
    ],
    install: true
)
