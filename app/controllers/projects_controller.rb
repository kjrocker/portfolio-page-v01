class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_project, except: [:index, :new]

  def index
    @projects = Project.all
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

end
