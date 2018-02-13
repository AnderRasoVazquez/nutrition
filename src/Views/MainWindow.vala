public class MainWindow : Gtk.ApplicationWindow {

    private Header hb;
    private WelcomeView welcome;
    private SearchResultView search_view;
    private Gtk.Stack stack;
    private const int VALID_QUERY_LENGTH = 1;

    public MainWindow (Gtk.Application app) {
        Object (application: app);

        hb = new Header ();
        this.default_height = 600;
        this.default_width = 800;
        this.set_size_request (800, 600);
        welcome = new WelcomeView ("Nutrition");
        search_view = new SearchResultView ();
        this.set_titlebar(hb);
        var search_entry = hb.get_search_entry ();
        search_entry.grab_focus ();
        search_entry.activate.connect (() => on_trigger_search ());

        var back_button = hb.get_back_button ();
        back_button.clicked.connect (() => on_back_button_press ());

        stack = new Gtk.Stack ();
        stack.transition_type = Gtk.StackTransitionType.SLIDE_LEFT_RIGHT;
        stack.add (welcome);
        stack.add (search_view);

        var scrolled_window = new Gtk.ScrolledWindow (null, null);

        this.add (scrolled_window);
        scrolled_window.add (stack);
    }

    private void on_trigger_search () {
        var search_entry = this.hb.get_search_entry ();
        unowned string query = search_entry.text;
        uint query_length = query.length;
        bool query_valid = query_length >= VALID_QUERY_LENGTH;

        if (query_valid) {
            var search_result = FacadeNutrition.get_facade_nutrition ().search_food (query);
            this.search_view.set_results (search_result);
            this.stack.visible_child = this.search_view;
            this.hb.show_back_button ();
        }
    }  

    private void on_back_button_press () {
        this.search_view.hide_list_box ();
        this.stack.visible_child = this.welcome;
        this.search_view.empty_results_grid ();
        this.hb.hide_back_button ();
    }
}