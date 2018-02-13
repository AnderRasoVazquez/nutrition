public class MyApp : Gtk.Application {

    public MyApp() {
        Object (
            application_id: "com.github.anderrasovazquez.nutrition",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        var main_window = new MainWindow (this);
        main_window.show_all ();
    }

    public static int main (string[] args) {
        var app = new MyApp ();
        return app.run (args);
    }

}
