    def get_user_input
        gets.chomp
    end

    def new_user_prompt
        puts "Are you a new passenger? (y/n)"
    end

    def existing_user?
        valid_inputs = ["y", "n"]
        new_passenger = true

        new_user_prompt
        user_input = get_user_input

        until valid_inputs.include?(user_input)
            invalid_input
            new_user_prompt
            user_input = get_user_input
        end

        new_passenger = false if user_input == "y" 
        new_passenger
    end

    def invalid_input
        "Please enter a valid input"
    end

    def new_passenger
        puts "Create a new account"
        Passenger.create(name: "#{user_name}")
    end

    def user_name
        puts "please enter your email address"
        get_user_input  
    end

    def existing_passenger
        puts "Please log in!"
        Passenger.find_by(name: "#{user_name}")
    end

    user_choice_array = [
        "  1) View Services\n",
        "  2) View Previous Visits\n",
        "  3) Call a Ride\n"
    ]

    def user_action_prompt
        puts "What would you like to do today? Select by entering the number of your choice.\n\n"
    end

    def user_action
        puts user_choice_array
        valid_input = ["1", "2", "3"]
        user_input = get_user_input

        until valid_inputs.include?(user_input)
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
