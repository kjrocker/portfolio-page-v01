require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "links present on homepage" do
    get root_path
    assert_template 'static_pages/home'
    assert_basic_links
  end

  test "links present on resume" do
    get resume_path
    assert_template 'static_pages/resume'
    assert_basic_links
  end

  test "links present on project index" do
    get projects_path
    assert_template 'projects/index'
    assert_basic_links
  end

  test "login and logout links present" do
    sign_in admins(:kevin)
    get root_path
    assert_select "a[href=?]", destroy_admin_session_path, count: 1
    assert_select "a[href=?]", new_admin_session_path, count: 0
    sign_out Admin
    get root_path
    assert_select "a[href=?]", destroy_admin_session_path, count: 0
    assert_select "a[href=?]", new_admin_session_path, count: 1
  end

end
