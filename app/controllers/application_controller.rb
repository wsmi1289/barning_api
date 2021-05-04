class ApplicationController < ActionController::API
# curl -v -X GET http://localhost:5000/ -H 'Authorization: Bearer 4ff169e0c3e42fd0b60af4f12abae086'
  
  def root
    render plain: 'Welcome!'
  end
end
