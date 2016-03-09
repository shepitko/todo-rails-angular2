class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ActionController::RequestForgeryProtection
protect_from_forgery with: :null_session
rescue_from ActiveSupport::MessageVerifier::InvalidSignature, with: :render_error

end
