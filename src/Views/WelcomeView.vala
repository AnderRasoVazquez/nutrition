
public class WelcomeView: Gtk.Grid {

    private Granite.Widgets.Welcome welcome;

    // TODO quitar el title
    public WelcomeView (string title) {
        welcome = new Granite.Widgets.Welcome (title, _("USDA Food Composition Database"));
        welcome.append ("text-x-source", "Get Nutrition Source Code", "Nutrition's source code is hosted on GitHub.");

        this.add (welcome);

        welcome.activated.connect ((index) => {
            switch (index) {
                case 0:
                    try {
                        AppInfo.launch_default_for_uri ("https://github.com/AnderRasoVazquez/nutrition", null);
                    } catch (Error e) {
                        warning (e.message);
                    }

                    break;
            }
        });

    }
}
