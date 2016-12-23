require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
    
    def setup
       @category = Category.new(name: "sports") 
    end
    
    test "categoryShouldBeValid" do
        assert @category.valid?
    end
    
    test "nameShouldBePresent" do
       @category.name = " "
       assert_not @category.valid?
    end
    
    test "nameShouldBeUnique" do
        @category.save
        category2 = Category.new(name: "sports")
        assert_not category2.valid?
    end
    
    test "nameShouldNotBeTooLong" do
        @category.name = "a" * 26
        assert_not @category.valid?
    end
    
    test "nameShouldNotBeTooShort" do
        @category.name = "aa"
        assert_not @category.valid?
    end
    
end