class ProtectedController < ApplicationController
  include JwtAuthentication
  before_action :require_authentication
  
end
