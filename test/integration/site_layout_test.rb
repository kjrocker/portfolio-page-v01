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

end
