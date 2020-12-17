class TodoListsController < ApplicationController
  before_action :set_todo_list, only: [:show, :update, :destroy]

  # GET /todo_lists
  def index
    @todo_lists = current_user.todo_lists
    render json: TodoListSerializer.new(@todo_lists).serializable_hash[:data].map{|tl| tl[:attributes]}
  end

  # GET /todo_lists/1
  def show
    @todo_list.make_active_list_for(current_user)
    data = {
      todo_list: TodoListSerializer.new(@todo_list).serializable_hash[:data][:attributes], 
      tasks: TodoListTaskSerializer.new(@todo_list, include: [:tasks]).serializable_hash[:included].map{|t| t[:attributes]}
    }
    render json: data, status: :ok
  end

  # POST /todo_lists
  def create
    @todo_list = current_user.todo_lists.build(todo_list_params)
    if @todo_list.save
      render json: TodoListSerializer.new(@todo_list).serializable_hash[:data][:attributes], status: :created, location: @todo_list
    else
      render json: @todo_list.errors.full_messages.to_sentence, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /todo_lists/1
  def update
    if @todo_list.update(todo_list_params)
      render json: TodoListSerializer.new(@todo_list).serializable_hash[:data][:attributes], status: :ok, location: @todo_list
    else
      render json: @todo_list.errors.full_messages.to_sentence, status: :unprocessable_entity
    end
  end

  # DELETE /todo_lists/1
  def destroy
    @todo_list.destroy
    render json: TodoListSerializer.new(@todo_list).serializable_hash[:data][:attributes], status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_list
      @todo_list = current_user.todo_lists.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def todo_list_params
      params.require(:todo_list).permit(:name)
    end
end
