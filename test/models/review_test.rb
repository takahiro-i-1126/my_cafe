require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @store = stores(:sutaba)
    @review = Review.new(content: "いいね",user_id: @user.id,store_id: @store.id)
  end

  test "should review valid" do
    assert @review.valid?
  end

  test "user id should be present" do
    @review.user_id = nil
    assert_not @review.valid?
  end

  test "introduction should not be too long" do
     @review.content = "a" * 1001
     assert_not @review.valid?
   end

   test "order should be most recent first" do
    assert_equal reviews(:most_recent), Review.first
  end

end
