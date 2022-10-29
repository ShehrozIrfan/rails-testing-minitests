require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Shehroz Irfan", email: "shehrozirfan89@gmail.com")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 246 + "@gmail.com"
    assert_not @user.valid?
  end

  test "email should be valid" do
    @user.email = "shehrozirfan89@gmail.com"
    assert @user.valid?
  end

  test "invalid emails should be rejected" do
    INVALID_EMAILS = %w[ ABC@gmail,com HE.com mywebsite@ ]
    INVALID_EMAILS.each do |invalid_email|
      @user.email = invalid_email
      assert_not @user.valid?, "#{invalid_email.inspect} should be rejected"
    end
  end

  test "email should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email address should be saved as lowercase" do
    mixed_email_address = "EXAmple@tesT.com"
    @user.email = mixed_email_address
    @user.save
    assert_equal mixed_email_address.downcase, @user.reload.email
  end
end
