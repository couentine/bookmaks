class ApplicationController < ActionController::Base
  attr_reader :user
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  include Pundit
end
