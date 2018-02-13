public class FoodNutritionView : Gtk.Window {

    private string food_id;

    public FoodNutritionView (string food_id) {
        this.food_id = food_id;
        this.title = food_id;
        this.border_width = 10;
        this.window_position = Gtk.WindowPosition.CENTER;
        this.set_default_size (350, 70);
        this.destroy.connect (Gtk.main_quit);

        var button = new Gtk.Button.with_label ("Click me!");
        button.clicked.connect (() => {
            button.label = food_id;
        });

        this.add (button);
    }

}