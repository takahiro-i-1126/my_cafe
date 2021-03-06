require 'test_helper'

class StoreTest < ActiveSupport::TestCase
  def setup
    @store = Store.new(name: "test store", title: "Welcome",
                     introduction: "test intro")
  end

  test "should user valid" do
    assert @store.valid?
  end

  test "name should be presence" do
    @store.name = " "
    assert_not @store.valid?
  end

  test "name should not be too long" do
     @store.name = "a" * 51
     assert_not @store.valid?
   end

   test "title should not be too long" do
      @store.title = "a" * 256
      assert_not @store.valid?
    end

    test "introduction should not be too long" do
       @store.introduction = "a" * 1001
       assert_not @store.valid?
     end

     test "associated reviews should be destroyed" do
       @store.save
       @user = users(:michael)
       @store.reviews.create!(content: "Lorem ipsum",user_id: @user.id)
       assert_difference 'Review.count', -1 do
         @store.destroy
       end
     end
end
