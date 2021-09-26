module Api
  module V1
    class TodosController < ApplicationController
      before_action :auth
      before_action :set_todo, only: %i[show update destroy]
      # GET /todos
      def index
        if current_user
          @todos = current_user.todos.all
          render json: @todos
        end
      end

      # GET /todos/1
      def show
        render json: @todo, status: :ok
      end

      # POST /todos
      def create
        @todo = Todo.new(todo_params)

        if @todo.save
          render json: @todo, status: :ok
        else
          render json: @todo.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /todos/1
      def update
        if @todo.update(todo_params)
          render json: @todo, status: :ok
        else
          render json: @todo.errors, status: :unprocessable_entity
        end
      end

      # DELETE /todos/1
      def destroy
        if @todo.destroy
          render json: { message: 'Todo has been deleted successfully' }, status: :ok
        else
          render json: { error: 'Something went wrong please try again!' }, status: unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_todo
        @todo = Todo.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def todo_params
        params.require(:todo).permit(:title, :created_by, :user_id)
      end
    end
  end
end
