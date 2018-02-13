# Nutrition (beta)

This app uses USDA Food Composition Database's API to search foods and show it's nutrient composition.

![](https://i.imgur.com/SiLVJO7.gif)

# Dependencies

+ gtk+-3.0
+ granite
+ libsoup-2.4
+ json-glib-1.0

# Tasks

+ [x] Welcome screen
    + [x] Design welcome screen
    + [x] Transitions between views.
    + [x] Search on Enter.
+ [x] Search foods
    + [x] Design search view.
    + [x] Implement search view.
+ [ ] Show nutrients
    + [ ] Design nutrient view.
    + [ ] Implement nutrient view.

# How to compile

+ Clone repository and `cd` to it.
+ `meson build --prefix=/usr`
+ `cd build`
+ `ninja`
+ `./com.github.anderrasovazquez.nutrition`