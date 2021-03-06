require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest
    def setup
        @category = Category.create(name: "Flying")
        @category2 = Category.create(name: "Eating")
    end
    test "should show category listing" do   
        get categories_path
        assert 'categories/index'
        assert_select "a[href=?]", category_path(@category), text: @category.name
        assert_select "a[href=?]", category_path(@category2), text: @category2.name
    end
end