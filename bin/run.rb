require_relative '../config/environment'


puts "Welcome to RideCare!\n\n"

if existing_user? == false
    current_user = new_passenger
else
    current_user = existing_passenger
end

user_action_prompt

user_action

