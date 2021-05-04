class ApplicationController < ActionController::API
  def root
    render plain: 'Welcome!'
  end
end
