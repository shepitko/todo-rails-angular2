class Api::TodoItemsController < Api::ApiController
	before_filter :find_todo_list

	def index
		render json: @list.todo_items.all
	end
	def create
		item = @list.todo_items.new(item_params)
		if item.save
			render status: 200, json: {
				message: "New task created",
				todo_list: item
			}.to_json
		else
			render status: 422, json: {
				message: "task could not be created",
				errors: item.errors
			}.to_json
		end
	end
	def update
		item = @list.todo_items.find(params[:id])
		if item.update(item_params)
			render status: 200, json: {
			  message: "Successfully updated To-do Item.",
			  todo_list: @list,
			  todo_item: item
			}.to_json
		else
			render status: 422, json: {
			  message: "To-do Item update failed.",
			  errors: item.errors
			}.to_json
		end
	end

	def destroy
		item = @list.todo_items.find(params[:id])
		item.destroy
		render status: 200, json: {
		  message: "Todo-Item successfully deleted.",
		  todo_list: @list,
		  todo_item: item
		}.to_json
	end
	private
	def item_params
      	params.permit(:title, :due_date, :completed)
    end
    def find_todo_list
      	@list = TodoList.find(params[:todo_list_id])
    end

end