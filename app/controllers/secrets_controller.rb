class SecretsController < ApplicationController
  before_action :require_login
  
  def show
    if session[:user_id].blank?
      redirect_to '/login'
    end
  end

  private
  def require_login
    return head(:forbidden) unless session.include? :user_id
  end
end
