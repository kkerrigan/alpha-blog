require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
    
    def setup
        @category = Category.create(name: "sports")
    end
    
    test "shouldGetCategoriesIndex" do
        get :index
        assert_response :success
    end
    
    test "shouldGetNew" do
        get :new
        assert_response :success
    end
    
    test "shouldGetShow" do
        get(:show, {'id' => @category.id })
        assert_response :success
    end
    
    
end