class SecretsController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:show]

  def show
    unless session.include? :name
      redirect_to 'sessions#new'
    end
  end

  private
  def require_login
    return head(:forbidden) unless session.include? :name
  end
end
