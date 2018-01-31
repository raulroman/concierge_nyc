require 'unirest'
require 'pp'

while
  system 'clear'
  p "Welcome to the Shift change page"
  p "Choose from the following options"
  p "[1] Show available shifts"
  p "[2] Show resident manager shift requests"
  p "[3] New shift request"
  p "[4] Update/grab a shift"
  p "[5] Delete a shift"
  p "[6] Sign Up"
  p "[7] Login"
  p "[8] Logout"
  p "Type 'exit' to leave"

  user_input = gets.chomp
  if user_input == "1" 
    response = Unirest.get("localhost:3000/v1/shifts")
    pp response.body  

  elsif user_input == "2"
    response = Unirest.get("localhost:3000/v1/shifts/shift")
    pp response.body

  elsif user_input == "3"
    the_params = {}
    p "What is your employee id number?"
    the_params[:full_time_employee_id] = gets.chomp
    p "What day of the week are you taking?"
    the_params[:day_of_the_week] = gets.chomp
    p "What is the date?"
    the_params[:date] = gets.chomp
    p "What is your start time?"
    the_params[:start_time] = gets.chomp
    p "What is your end time?"
    the_params[:end_time] = gets.chomp
    p "What is your position?"
    the_params [:position] = gets.chomp
    p "What is your building id?"
    the_params[:building_id] = gets.chomp

    response = Unirest.post("localhost:3000/v1/shifts?", parameters: the_params)
    pp response.body

  elsif user_input == "4"
    the_params = {}
    p "Which shift id would you like to update?"
    input_id = gets.chomp
    response = Unirest.get("localhost:3000/v1/shifts/#{input_id}")
    pp response.body

    p "What is your employee id number?"
    the_params[:full_time_employee_id] = gets.chomp
    p "What is the new day of the week are you taking?"
    the_params[:day_of_the_week] = gets.chomp
    p "What is the new date?"
    the_params[:date] = gets.chomp
    p "What is the new start time?"
    the_params[:start_time] = gets.chomp
    p "What is the new end time?"
    the_params[:end_time] = gets.chomp
    p "What is your position?"
    the_params [:position] = gets.chomp
    p "What is your building id?"
    the_params[:building_id] = gets.chomp 
    p "Is the shift approved or denied?"
    the_params[:approved_denied] = gets.chomp
    p "What is your employee id number?"
    the_params[:claimed_by_employee_id] = gets.chomp
    p "What type of employee are you?"
    the_params[:relief_type]
    response = Unirest.patch("localhost:3000/v1/shifts/#{input_id}", parameters: the_params)
    pp response.body
      

  elsif user_input == "5"
    p "Which shift would you like to delete?"
    input_id = gets.chomp
    response = Unirest.delete("localhost:3000/v1/shifts/#{input_id}")

  elsif user_input == "6"
    p 'type your name'
    user_name = gets.chomp
    p 'type your email'
    user_email = gets.chomp
    p 'type your password'
    password = gets.chomp
    p 'confirm your password'
    password_confirmation = gets.chomp
    response = Unirest.post('localhost:3000/v1/users', parameters: {
        name: user_name,
        email: user_email,
        password: password,
        password_confirmation: password_confirmation
      }
    )
    pp response.body

  elsif user_input == "7"
    p "type in your email"
    user_email = gets.chomp
    p "type in your password"
    user_password = gets.chomp
    response = Unirest.post("localhost:3000/user_token", parameters: {
      auth: {
        email: user_email,
        password: user_password
      }
    }
  )
    jwt = response.body["jwt"]
    Unirest.default_header("Authorization", "Bearer #{jwt}") 
    pp response.body

  elsif user_input == "8"
    jwt = ""
    Unirest.clear_default_headers()
    pp "You logged out"
    
    elsif user_input == "exit"
      break

  end
end
