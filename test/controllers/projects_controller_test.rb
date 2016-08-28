require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @admin = admins(:kevin)
    @other_admin = admins(:admin_1)
    @valid_project = { name: "Project",
                      description: "This project is empty.",
                      source_link: "www.google.com",
                      complete_link: "www.google.com",
                      active: false,
                      admin_id: @admin.id }
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
    put project_path(Project.first.id), params: { project: @valid_project}
    assert_not_equal Project.first, @valid_project
    assert_redirected_to root_path
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Project.count' do
      delete project_path(Project.first.id)
    end
    assert_redirected_to root_path
  end

  test "should new when logged in" do
    sign_in @admin
    get new_project_url
    assert_response :success
  end

  test "should edit when logged in" do
    sign_in @admin
    first_id = Project.first.id
    get edit_project_url(first_id)
    assert_response :success
  end

  test "should create when logged in" do
    sign_in @admin
    assert_difference 'Project.count', 1 do
      post projects_path, params: { project: @valid_project }
    end
  end

  test "should update when logged in" do
    sign_in @admin
    initial_id = Project.first.id
    put project_path(initial_id), params: { project: @valid_project}
    assert_redirected_to project_path(initial_id)
  end

  test "should destroy when logged in" do
    sign_in @admin
    assert_difference 'Project.count', -1 do
      delete project_path(Project.first.id)
    end
    assert_redirected_to projects_path
  end

  
end
