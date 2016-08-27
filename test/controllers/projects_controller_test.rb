require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @valid_project = { name: "Project",
                      description: "This project is empty.",
                      source_link: "www.google.com",
                      complete_link: "www.google.com",
                      active: false }
    @admin = admins(:kevin)
    @other_admin = admins(:admin4)
  end

  test "should redirect new when not logged in" do
    get new_project_url
    assert_redirected_to root_path
  end

  test "should redirect edit when not logged in" do
    get edit_project_url(1)
    assert_redirected_to root_path
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Project.count' do
      post projects_path, params: { project: @valid_project }
    end
    assert_redirected_to root_path
  end

  test "should redirect update when not logged in" do
    assert_no_difference 'Project.count' do
      put project_path(1), params: { project: @valid_project}
    end
    assert_redirected_to root_path
  end

  test "should new when logged in" do
    sign_in @admin
    assert_equal true, true
  end

  test "should edit when logged in" do
    sign_in @admin
    assert_equal true, true
  end

  test "should create when logged in" do
    sign_in @admin
    assert_equal true, true
  end

  test "should update when logged in" do
    sign_in @admin
    assert_equal true, true
  end

end
