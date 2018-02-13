
public class FacadeNutrition : Object {

    private static FacadeNutrition facade_nutrition = null;

    private FacadeNutrition () {}

    public static FacadeNutrition get_facade_nutrition () {
        if (facade_nutrition == null) {
            facade_nutrition = new FacadeNutrition ();
        }
        return facade_nutrition;
    }

    public string search_food (string search_item) {
        return FoodSearcher.get_food_searcher ().search_food (search_item);
    }

    public string search_food_with_offset (string search_item, int64 start_point, int64 total_results) {
        return FoodSearcher.get_food_searcher ().search_food_with_offset (search_item, start_point, total_results);
    }
    
}
