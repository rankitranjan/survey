# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception, unless: -> { request.format.json? }
  skip_before_action :verify_authenticity_token
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, notice: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end

  def verify_auth_token
    auth_header = request.headers.env["HTTP_API_AUTH_TOKEN"]
    if auth_header.present?
      user = User.where(auth_token: auth_header)
      if !user.present?
        render json: { status: "unauthorized" }
      end
    else
      render json: { status: "forbidden" }
    end
  end
end
