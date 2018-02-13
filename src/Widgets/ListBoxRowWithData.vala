public class ListBoxRowWithData : Gtk.Button {

    private string data;
    private string id;

    public ListBoxRowWithData (string id, string data) {
        this.id = id;
        this.data = data;
        this.label = data;
        xalign = 0;
    }

    public string get_id () {
        return this.id;
    }
}