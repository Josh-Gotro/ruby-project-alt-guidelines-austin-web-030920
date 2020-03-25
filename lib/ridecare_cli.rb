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
            invalid_command
            new_user_prompt
            user_input = get_user_input
        end

        new_passenger = false if user_input == "y" 
        new_passenger
    end

    def invalid_input
        "Please enter a valid command"
    end

    def new_passenger
        puts "Create a new account"
        Passenger.create(name: "#{user_name}")
    end

    def user_name
        puts "please enter your name"
        get_user_input  
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
