class ApplicationController < ActionController::API
#before_filter :add_cors_headers
before_filter :cors_preflight_check
after_filter :cors_set_access_control_headers
#rescue_from ActiveRecord::RecordNotFound, with: :render_404
rescue_from ActiveSupport::MessageVerifier::InvalidSignature, with: :render_error

	private
	def go_back_link_to(path)
		@go_back_link_to ||= path
		@go_back_link_to
	end
	def cors_set_access_control_headers
		headers['Access-Control-Allow-Origin'] = '*'
		headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
		headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
		headers['Access-Control-Max-Age'] = "1728000"
	end

	def cors_preflight_check
		if request.method == 'OPTIONS'
		  headers['Access-Control-Allow-Origin'] = '*'
		  headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
		  headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Token'
		  headers['Access-Control-Max-Age'] = '1728000'

		  render :text => '', :content_type => 'text/plain'
		end
	end
end
