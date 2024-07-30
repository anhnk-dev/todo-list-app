class TasksController < ApplicationController
  def index
    @tasks = fetch_incomplete_tasks
  end

  def new
    @task = Task.new(user: current_user)
  end

  def mark_completed
    @task = Task.find(params[:id])
    @task.completed!
    @tasks = fetch_incomplete_tasks

    result_json = render_to_string(partial: "tasks/tasks_list", locals: { tasks: @tasks })

    respond_to do |format|
      format.json { render json: { result: result_json } }
      format.html { render(:index) }
    end
  end

  private

  def fetch_incomplete_tasks
    current_user.tasks.incomplete
  end
end
