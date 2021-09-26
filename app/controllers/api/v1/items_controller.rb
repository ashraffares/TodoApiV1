# frozen_string_literal: true

module Api
  module V1
    class ItemsController < ApplicationController
      before_action :auth
      before_action :set_item, only: %i[show update destroy]

      # GET /items
      def index
        @todo = Todo.find(params[:todo_id])
        @items = @todo.items
        render json: @items
      end

      # GET /items/1
      def show
        render json: @item
      end

      # POST /items
      def create
        @item = Item.new(item_params)

        if @item.save
          render json: @item, status: :created
        else
          render json: @item.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /items/1
      def update
        if @item.update(item_params)
          render json: @item, status: :ok
        else
          render json: @item.errors, status: :unprocessable_entity
        end
      end

      # DELETE /items/1
      def destroy
        if @item.destroy
          render json: { message: 'Item has been deleted successfully' }, status: :ok
        else
          render json: { error: 'Something went wrong please try again!' }, status: unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_item
        @item = Item.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def item_params
        params.require(:item).permit(:name, :description, :proirity, :priority, :completed, :todo_id)
      end
    end
  end
end
