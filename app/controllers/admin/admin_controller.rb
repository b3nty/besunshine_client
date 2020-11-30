class Admin::AdminController < ApplicationController
before_action :authenticate_admin!


  def authenticate_admin!
    authenticate_or_request_with_http_basic('Authentification') do |username, password|
      username == 'besunshine' && password == 'test'
    end
  end

end
