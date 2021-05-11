class ApplicationController < ActionController::API
  include Pundit
# curl -v -X GET http://localhost:5000/ -H 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJsb2NhbGhvc3Q6NTAwMCIsImV4cCI6MTYyMDEwNDY3OSwiYXVkIjoibG9jYWxob3N0OjMwMDAiLCJzdWIiOnsiaWQiOjEsImVtYWlsIjoid3NtaTEyODlAZ21haWwuY29tIn19.KWeOEAaq6zKHDWqgFadU10Wk6nenyVZlNaaa4iHX13g'

# curl -v -X POST http://localhost:3000/v1/users/sessions -u wsmi1289@gmail.com:smith420
# curl -v -X POST http://localhost:3000/v1/users/1/sessions -H 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJsb2NhbGhvc3Q6NTAwMCIsImV4cCI6MTYyMDY5ODQ3NiwiYXVkIjoibG9jYWxob3N0OjMwMDAiLCJzdWIiOnsiaWQiOjEsImVtYWlsIjoid3NtaTEyODlAZ21haWwuY29tIn19.US0BSeKrGlMHJtZEfw8GZi8LP6EFK1L31N6COjfLs1s'
  def root
    render plain: 'Welcome!'
  end
end
