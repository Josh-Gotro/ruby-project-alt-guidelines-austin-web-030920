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
            @current_user = Passenger.create(name: email)
            puts "*"*30
            puts "\nSuccess!\n\n"
            puts "*"*30
            puts "\n\n"
            user_action
        end
    end

    def email_prompt
        puts "Enter your email address"
        get_user_input  
    end

    def existing_passenger
        user_email = email_prompt
        if Passenger.find_by(name: user_email)
            @current_user = Passenger.find_by(name: user_email)
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
        # "  3) Call a Ride\n",
        "  3) Log Out\n"
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
        # elsif user_input == "3"
        #     call_ride #stub (remember to randomize online? and zip_code for drivers)
        else
            logout
        end
    end

    

    def view_services
        service_search_parameter = [
            "  1) Referral Type"
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
        @services = Service.view_services_by(service)
        puts "Showing all #{service}"
        puts "*"*30
        @services.each.with_index(1) do |s, index|
            puts "#{index})"
            puts "  " + s.primary_service
            puts "  " + s.location_name
            puts "  " + s.address
            puts "*"*30
        end
        create_visit?
    end

    def create_visit?
        puts "Do you want to create a Visit? (y/n)"
        visit_question = get_user_input
        until visit_question == "y" || visit_question == "n"
            invalid_input
            create_visit?
        end
        if visit_question == "y"
            puts "Please input the service by number"
            which_service = get_user_input
            # binding.pry
            current_user.services << (@services[which_service.to_i - 1])
            puts "*"*30, "Success!", "*"*30
            user_action
        else
            user_action
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
        # binding.pry
        current_user.visits.each do |visit|
            puts "*"*30
            # puts "Visit ID:" + visit.id.to_s
            puts "Visitor Email Address: " + Passenger.find(visit.passenger_id).name.to_s
            puts "Location Visited: " + Service.find(visit.service_id).location_name.to_s
            puts "Business Address: " + Service.find(visit.service_id).address.to_s
        end
        puts "*"*30, "Success!", "*"*30
        user_action

        #query passenger table by email, for user ID, then query visits for matching Visits.passenger_id
    end

    def current_user
        @current_user
    end

    def logout
        puts "\n", "*"*30, "\n" 
        puts "Thank you for using RideCare today!"
        puts "\n", "*"*30, "\n" 
            # new_user_prompt
            # passenger_exists?
    end
end