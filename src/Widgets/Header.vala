public class Header : Gtk.HeaderBar { 

    private Gtk.SearchEntry search_entry;
    private Gtk.Button back_button;

    public Header () {
        search_entry = new Gtk.SearchEntry ();
        search_entry.placeholder_text = "Search foods";

        this.back_button = new Gtk.Button.with_label ("Back");
        this.back_button.get_style_context ().add_class (Granite.STYLE_CLASS_BACK_BUTTON);
        this.back_button.no_show_all = true;
        this.pack_start (back_button);
        this.pack_end (search_entry);
        this.show_close_button = true;
    }

    public Gtk.SearchEntry get_search_entry () {
        return this.search_entry;
    }

    public Gtk.Button get_back_button () {
        return this.back_button;
    }

    public void hide_back_button () {
        this.back_button.hide ();
    }

    public void show_back_button () {
        this.back_button.show ();
    }
}
