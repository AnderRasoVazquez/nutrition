public class SearchResultView : Gtk.Grid {

    private Gtk.Label title;
    private Gtk.ListBox list_box;
    private Gtk.Button button_show_all;
    private int64 start_result;
    private int64 end_result;
    private int64 total_results;
    private string query;
    
    public SearchResultView () {
        this.column_spacing = 12;
        this.row_spacing = 6;
        this.halign = Gtk.Align.CENTER;
        this.valign = Gtk.Align.START;
        margin_top = 12;

        this.title = new Gtk.Label ("");
        this.title.get_style_context ().add_class (Granite.STYLE_CLASS_H2_LABEL);
        this.title.halign = Gtk.Align.CENTER;

        this.list_box = new Gtk.ListBox ();

        this.button_show_all = new Gtk.Button.from_icon_name ("go-next");
        this.button_show_all.no_show_all = true;

        // connect signals
        this.button_show_all.clicked.connect (this.on_button_show_all_clicked);

        this.attach (title, 0, 0, 1, 1);
        this.attach (this.button_show_all, 1, 0, 1, 1);
        this.attach (list_box, 0, 1, 3, 1);
    }


    public void on_button_show_all_clicked (Gtk.Button button) {
        var search_result = FacadeNutrition.get_facade_nutrition ().search_food_with_offset (this.query, this.end_result + 1, this.total_results);
        this.set_results (search_result);
        this.button_show_all.hide ();
        this.title.hide ();
        this.set_title ("Showing all results");
    }

    public void set_title (string text) {
        this.title.label = text;
    }

    public void change_title (int64 start, int64 end, int64 total) {
        start += 1;
        this.start_result = start;
        this.end_result = end;
        this.total_results = total;
        this.title.label = @"Showing $start-$end of $total results";
    }

    public bool on_key_release_event (ListBoxRowWithData l, Gdk.EventKey event) {

        if (event.keyval == Gdk.Key.Return) {
            print (l.get_id ());
        }
        return true;
    }

    public void set_results (string data) {
        print(data);
        var children = list_box.get_children ();
        foreach (Gtk.Widget element in children)
            list_box.remove (element);

        try {
            var parser = new Json.Parser ();
            parser.load_from_data (data);
            var root_object = parser.get_root ().get_object ();

            if (root_object.has_member ("errors")) {
                this.title.label = "No results found";
                list_box.hide ();
                print("No results found");

            } else {
                var list_info = root_object.get_object_member ("list");

                this.query = list_info.get_string_member ("q");
                var start_num = list_info.get_int_member ("start");
                var end_num = list_info.get_int_member ("end");
                var total_num = list_info.get_int_member ("total");

                this.change_title (start_num, end_num, total_num);
                this.title.show ();
                if (total_num > end_num) {
                    this.button_show_all.show ();
                }

                var food_item_list = list_info.get_array_member ("item");
                
                foreach (var item in food_item_list.get_elements ()) {
                    var food_data = item.get_object ();
                    var id = food_data.get_string_member ("ndbno");
                    var food_name = food_data.get_string_member ("name");

                    var list_item = new ListBoxRowWithData (id, food_name);
                    // TODO no me gusta usando lambdas
                    list_item.key_release_event.connect((l, key) => on_key_release_event ((ListBoxRowWithData) l, key));
                    list_box.add(list_item);
                    list_box.show_all ();
                }
            }
        } catch (Error e) {
            error("%s", e.message);
        }
    }

    public void hide_list_box () {
        list_box.hide ();
    }
}