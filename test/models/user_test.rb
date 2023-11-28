require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save User with Email" do
    user = User.new
    user.username = "ABigBaby"
    user.password = "pass!@#"
    assert_not user.save, "Saved the User without email"
  end
end
