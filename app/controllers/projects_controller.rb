class ProjectsController < ApplicationController
  before_action :authenticate_admin!, except: [:show, :index]
  before_action :set_project, except: [:index, :new]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

end
