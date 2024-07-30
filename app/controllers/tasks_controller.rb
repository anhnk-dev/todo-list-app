class TasksController < ApplicationController
  layout "task"

  def index
    @tasks = fetch_incomplete_tasks
  end

  def new
    @task = Task.new(user: current_user)
  end

  def create
    @task = Task.create(task_params)

    if @task.errors.blank?
      flash[:notice] = "Task created successfully"
      redirect_to :tasks
    else
      flash.now[:alert] = "Error: #{@task.errors.full_messages.join(". ")}"
      render :new, status: 422
    end
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

  def task_params
    params.require(:task).permit(:title, :sub_title, :priority, :due_date, :user_id)
  end
end
