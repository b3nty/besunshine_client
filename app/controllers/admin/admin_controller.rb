class Admin::AdminController < ApplicationController
before_filter :authenticate_admin!


  def authenticate_admin!
    authenticate_or_request_with_http_basic('Authentification') do |username, password|
      username == 'besunshine' && password == 'test'
    end
  end

end
