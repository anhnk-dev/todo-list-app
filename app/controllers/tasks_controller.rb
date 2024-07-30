class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new(user: current_user)
  end
end
