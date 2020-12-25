class TasksController < ApplicationController
  before_action :set_task, only: [:show, :update, :destroy]

  # GET /tasks
  def index
    @tasks = Task.all

    render json: @tasks
  end

  # GET /tasks/1
  def show
    render json: @task
  end

  # POST /tasks
  def create
    @task = current_user.tasks.build(task_params)
    
    if @task.save
      render json: TaskSerializer.new(@task).serializable_hash[:data][:attributes], status: :created, location: @task
    else
      render json: @task.errors.full_messages.to_sentence, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      render json: TaskSerializer.new(@task).serializable_hash[:data][:attributes]
    else
      render json: @task.errors.full_messages.to_sentence, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = current_user.tasks.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:name, :notes, :completed, :user_id, :todo_list_id)
    end
end
