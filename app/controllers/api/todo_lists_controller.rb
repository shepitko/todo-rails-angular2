class Api::TodoListsController < Api::ApiController

	before_action :authenticate_api_user!

	def index
		todo_lists = current_api_user.todo_lists.all
		render json: todo_lists.to_json(:include => [:todo_items])
	end

	def show
		list = TodoList.find(params[:id])
		render json: list.to_json
	end

	def create
		#render :json => { message: "You posted a message with a title of #{params[:list_name]}" }, :status => 200
		list = TodoList.new(list_params)
		if list.save
			render status: 200, json: {
				message: "New todo created",
				todo_list: list
			}.to_json
		else
			render status: 422, json: {
				message: "Todo-list could not be created",
				errors: list.errors
			}.to_json
		end
	end

	def update
		list = TodoList.find(params[:id])
		if list.update(list_params)
			render status: 200, json: {
				message: "Todo-list updated",
				todo_list: list
			}.to_json
		else
			render status: 422, json: {
				message: "Todo-list could not be updated",
				errors: list.errors
			}.to_json
		end
	end

	def destroy
		list = TodoList.find(params[:id])
		list.destroy
		render status: 200, json: {
				message: "Todo-list is destroy",
				todo_list: list
			}.to_json
	end

	private
	def list_params
      	params.permit(:list_name, :user_id, :list_due_date)
    end

end
