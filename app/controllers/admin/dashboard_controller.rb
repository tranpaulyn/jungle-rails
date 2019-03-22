class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with :name => ENV["HTTP_AUTH_USERNAME"], :password => ENV["HTTP_AUTH_PW"]

  # http_basic_authenticate_with name: 'Jungle', password: 'book'

  def show
  end
end
