    class RideCare

    def start
        puts "Welcome to RideCare!"
        passenger_exists?
        
    end

    def get_user_input
        gets.chomp
    end

    def new_user_prompt
        puts "Are you a new passenger? (y/n)"
    end

    def passenger_exists?
        new_user_prompt
        user_input = get_user_input

        until user_input == "y" || user_input == "n"
            invalid_input
            passenger_exists?
        end

        if user_input == "y"
            user_email = email_prompt
            new_passenger(user_email)
        else
            existing_passenger
        end
    end

    def invalid_input
        puts "Please enter a valid input"
    end

    def new_passenger(email)
        puts "Create a new account"
        if Passenger.find_by(name: email)
            puts "You already have an account!"
            existing_passenger(email)
        else
            Passenger.create(name: email)
        end
    end

    def email_prompt
        puts "Enter your email address"
        get_user_input  
    end

    def existing_passenger
        puts "Please log in!"
        user_email = email_prompt
        if Passenger.find_by(name: user_email)
            user_action
        else
            puts "Email Address not found!"
            existing_passenger
        end
    end

    def user_action_prompt
        puts "What would you like to do today? Select by entering the number of your choice.\n\n"
    end

    def user_action
        user_choice_array = [
        "  1) View Services\n",
        "  2) View Previous Visits\n",
        "  3) Call a Ride\n"
    ]
        user_action_prompt
        user_choice_array.each do |choice|
            puts choice
        end
        valid_input = ["1", "2", "3"]
        user_input = get_user_input

        until valid_input.include?(user_input)
            invalid_input
            user_action_prompt
            user_input = get_user_input
        end

        if user_input == "1"
            view_services #stub
        elsif user_input == "2"
            view_previous_visits #stub
        else
            call_ride #stub (remember to randomize online? and zip_code for drivers)
        end
    end

    

    def view_services
        service_search_parameter = [
            
        ]
        puts "stub"
    end

    def view_previous_visits
        
    end
end





# def hit?(card_total)
#     valid_inputs = ["h", "s"]
  
#     prompt_user
#     user_input = get_user_input
  
#     until valid_inputs.include?(user_input)
#       invalid_command
#       prompt_user
#       user_input = get_user_input
#     end
  
#     if user_input == "h"
#       card_total += deal_card
#     end
