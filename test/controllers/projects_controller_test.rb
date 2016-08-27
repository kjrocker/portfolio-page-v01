require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest

  test "should redirect #new when not logged in" do
    get new_project_url
    assert_redirected_to root_path
  end

  test "should redirect #edit when not logged in" do
    get edit_project_url(1)
    assert_redirected_to root_path
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Project.count' do
      post projects_path, params: { project: { name: "Shady Project",
                          description: "This project is suspect.",
                          source_link: "www.google.com",
                          complete_link: "www.google.com",
                          active: false } }
    end
    assert_redirected_to root_path
  end

  test "should redirect update when not logged in" do
    assert_no_difference 'Project.count' do
      put project_path(1), params: { project: { name: "Shady Project",
                           description: "This project is suspect.",
                           source_link: "www.google.com",
                           complete_link: "www.google.com",
                           active: false } }
    end
    assert_redirected_to root_path
  end

end
