public class FoodSearcher : Object {

    private static FoodSearcher food_searcher = null;
    private int offset;

    private FoodSearcher () {
        offset = 0;
    }

    public static FoodSearcher get_food_searcher () {
        if (food_searcher == null) {
            food_searcher = new FoodSearcher ();
        }
        return food_searcher;
    }

    public string search_food (string search_item) {
        var api_key = "WqBMKefeOUR5UiJqbeZPM9PQc2Mb5bO8jswnvnJt";
        var uri = "https://api.nal.usda.gov/ndb/search/?format=json&q=" + search_item + "&max=50&offset=0&ds=Standard%20Reference&api_key=" + api_key;
        // var uri = "https://api.nal.usda.gov/ndb/search/?format=json&q=" + search_item + "&sort=n&max=25&offset=0&api_key=" + api_key;
        var session = new Soup.Session ();
        var message = new Soup.Message ("GET", uri);
        session.send_message (message);

        return (string) message.response_body.flatten ().data;
    }

    public string search_food_with_offset (string search_item, int64 start_point, int64 total_results) {
        var api_key = "WqBMKefeOUR5UiJqbeZPM9PQc2Mb5bO8jswnvnJt";
        var uri = "https://api.nal.usda.gov/ndb/search/?format=json&q=" + search_item + @"&max=$total_results" + @"&offset=$start_point" + "&ds=Standard%20Reference&api_key=" + api_key;
        // var uri = "https://api.nal.usda.gov/ndb/search/?format=json&q=" + search_item + "&sort=n&max=25&offset=0&api_key=" + api_key;
        var session = new Soup.Session ();
        var message = new Soup.Message ("GET", uri);
        session.send_message (message);

        return (string) message.response_body.flatten ().data;
    }
}
