class RideCare
    
    def start
        Service.seed_data
        Art.welcome
        new_user_prompt
        passenger_exists?
        
    end

    def get_user_input
        gets.chomp
    end

    def new_user_prompt
        Art.triangle_drop
        puts Art.p("\n\n     Are you a new passenger?  ") + Art.s("  (y/n)\n").blink
    end

    def passenger_exists?
        user_input = get_user_input

        until user_input == "y" || user_input == "n"
            invalid_input
            puts Art.s("                                 (y,n)").blink
            passenger_exists?
        end

        if user_input == "y"
            puts Art.p("\n     Enter your ") + Art.s("email address ") + Art.p("to create a new account\n     OR type ")+ Art.s("'login' ") + Art.p("if you are an existing user.\n")
            user_email = get_user_input
            if user_email.match(URI::MailTo::EMAIL_REGEXP)
                new_passenger(user_email)
            elsif user_email == "login"
                existing_passenger
            else
                invalid_input
                puts Art.p("\n\n     Are you a new passenger?  ") + Art.s("  (y/n)\n").blink
                passenger_exists?
            end
        else
            existing_passenger
        end
    end

    def invalid_input
        puts Art.e("     !! Sorry, but that's not a valid input !!")
    end

    def new_passenger(email)

        if Passenger.find_by(name: email)
            puts Art.p("\n     You already have an account!")
            puts Art.p("     Please log in!")
            existing_passenger
        else
            @current_user = Passenger.create(name: email)
            Art.success
            Art.triangle_drop
            user_action
        end
    end

    def email_prompt
        puts Art.p("\n     Enter your ") + Art.s("email address \n")
        get_user_input  
    end

    def existing_passenger
        user_email = email_prompt
        if Passenger.find_by(name: user_email)
            @current_user = Passenger.find_by(name: user_email)
            Art.success
            Art.triangle_drop
            user_action
        else
            puts Art.p"\n     Email Address not found!" #<------------------ what if you don't have an email address?
            existing_passenger
        end
    end

    def user_action_prompt
        puts Art.p("\n     What would you like to do today?\n     Select a") + Art.s(" number.\n").blink
    end

    def user_action
        user_choice_array = [
         "     " +   Art.n(' -'*14),
         "     " + Art.n("|  1) View Services        |"),
         "     " + Art.n("|  2) View Previous Visits |"),
        # "  3) Call a Ride\n",
        "     " + Art.n("|  3) Log Out              |"),
        "     " + Art.n(' -'*14), "\n"
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
        # service_search_parameter = [
        #     "  1) Referral Type"
        # ]

        # service_search_parameter.each do |choice|
        #     puts choice
        # end
        # user_input = get_user_input
        # if user_input == "1"
            printed_services = print_referral_types
            selected_service = printed_services[select_referral_type.to_i - 1]
            display_selected_services(selected_service)
        # end
    end

    def display_selected_services(service)
        @services = Service.view_services_by(service)
        # SHOULD SHOW "0" dislplays "13"?  <-----------------------------------------------------------
        # EDGE CASE, create option in case user enters number not associated with a service. <----------
        puts Art.p("\n     Showing all") + Art.n(" #{service}")
        puts "\n" + Art.s("*"*50)
        @services.each.with_index(1) do |s, index|
            puts Art.p("  #{index})")
            puts Art.p("     " + s.primary_service)
            puts Art.p("     " + s.location_name)
            puts Art.p("     " + s.address)
            puts Art.s("*"*50)
        end
        create_visit?
    end

    def create_visit?
        puts Art.p("\n\n     Would you like to create a Visit? ") + Art.s("(y/n)").blink
        visit_question = get_user_input
        until visit_question == "y" || visit_question == "n"
            invalid_input
            create_visit?
        end
        if visit_question == "y"
            puts Art.p("\n     Please input the service by ") + Art.s("number").blink
            which_service = get_user_input
            current_user.services << (@services[which_service.to_i - 1])
            Art.booked
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
            puts Art.p("     #{index}) ") + Art.p("#{referral}")
        end
    end

    def select_referral_type
        puts Art.p("\n     Select the ") + Art.s("number ").blink + Art.p("of the service you would like to view\n")
        get_user_input
    end



    def view_previous_visits
        Art.visits
        current_user.visits.each do |visit|
            puts "\n" + Art.s("*"*50)
            # puts "Visit ID:" + visit.id.to_s
            puts Art.p("\nVisitor Email Address: " + Passenger.find(visit.passenger_id).name.to_s)
            puts Art.p("Location Visited: " + Service.find(visit.service_id).location_name.to_s)
            puts Art.p("Business Address: " + Service.find(visit.service_id).address.to_s)
        end
        # Art.success
        Art.pink_triangle_drop
        user_action

        #query passenger table by email, for user ID, then query visits for matching Visits.passenger_id
    end

    def current_user
        @current_user
    end

    def logout
        Art.logout
        puts Art.p("     You have been succesfully logged out").blink
 
    end
end

