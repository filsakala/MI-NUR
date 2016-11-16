class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :rocnik_exists

  def rocnik_exists
    if Rocnik.count == 0
      Rocnik.create(cislo: 1)
    end
  end
end
