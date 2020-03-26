class RideCare
    
    def start
        Service.seed_data
        puts "Welcome to RideCare!"
        new_user_prompt
        passenger_exists?
        
    end

    def get_user_input
        gets.chomp
    end

    def new_user_prompt
        puts "Are you a new passenger? (y/n)"
    end

    def passenger_exists?
        user_input = get_user_input

        until user_input == "y" || user_input == "n"
            invalid_input
            passenger_exists?
        end

        if user_input == "y"
            puts "Create a new account by entering your email address\nOR type 'login' if you are an existing user."
            user_email = get_user_input
            if user_email.match(URI::MailTo::EMAIL_REGEXP)
                new_passenger(user_email)
            elsif user_email == "login"
                existing_passenger
            else
                invalid_input
                passenger_exists?
            end
        else
            existing_passenger
        end
    end

    def invalid_input
        puts "Please enter a valid input"
    end

    def new_passenger(email)

        if Passenger.find_by(name: email)
            puts "You already have an account!"
            puts "Please log in!"
            existing_passenger
        else
            Passenger.create(name: email)
            puts "*"*30
            puts "\nSuccess!\n\n"
            puts "*"*30
            puts "\n\n"
            @current_user = email
            user_action
        end
    end

    def email_prompt
        puts "Enter your email address"
        get_user_input  
    end

    def existing_passenger
        user_email = email_prompt
        @current_user = user_email
        if Passenger.find_by(name: user_email)
            puts "*"*30
            puts "\nLogin Successful!\n\n"
            puts "*"*30
            puts "\n\n"
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
        "  3) Call a Ride\n",
        "  4) Log Out\n"
    ]
        user_action_prompt
        user_choice_array.each do |choice|
            puts choice
        end
        valid_input = ["1", "2", "3", "4"]
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
        elsif user_input == "3"
            call_ride 
        else
            puts "\n", "*"*30, "\n" 
            puts "Thank you for using RideCare today!"
            puts "\n", "*"*30, "\n" 
            # new_user_prompt
            # passenger_exists?
        end
    end
    

    def view_services
        service_search_parameter = [
            "  1) Referral Type",
            "  2) Zip Code"
        ]

        service_search_parameter.each do |choice|
            puts choice
        end
        user_input = get_user_input
        if user_input == "1"
            printed_services = print_referral_types
            selected_service = printed_services[select_referral_type.to_i - 1]
            display_selected_services(selected_service)
        end
    end

    def display_selected_services(service)
        services = Service.view_services_by(service)
        puts "Showing all #{service}"
        services.each do |s|
            puts s.primary_service
            puts s.location_name
            puts s.address
        end
    end

    def print_referral_types
        # referrals = Service.all.map do |service|
        #     service.referral_type
        # end.uniq
        referrals = Service.distinct.pluck(:referral_type)
        referrals.delete(nil)
        referrals.each.with_index(1) do |referral, index|
            puts "#{index}) " + "#{referral}"
        end
    end

    def select_referral_type
        puts "Choose from the list of referral types"
        get_user_input
    end



    def view_previous_visits
        
    end

    def call_ride
    Passenger.call_ride
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
