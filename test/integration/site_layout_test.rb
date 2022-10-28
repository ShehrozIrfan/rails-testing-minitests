require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    # get the root path
    get root_path
    # check for the required page
    assert_template 'static_pages/home'
    # checking the links
    # as there are two root paths, one is for home and one is for site logo
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
  end
end
