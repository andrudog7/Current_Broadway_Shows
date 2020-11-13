module CLIHelperMethods
    def choice_output(choice)
        if choice.open? == true
        puts "  
#{choice.title} is currently playing at: #{choice.theater}.
    #{choice.type}"
        else puts "
#{choice.title} is an upcoming Broadway #{choice.type} and is scheduled to open at: #{choice.theater}."
        end
        puts "    #{choice.gross}
    #{choice.average_ticket_price}
    #{choice.average_capacity}.

Visit #{choice.show_url} for more information!
        "
        sleep(1)
    end

    def check_user_input
        user_input = gets.strip
        if user_input == "m" 
            menu
        elsif user_input == "b"
            "b"
        elsif user_input == "x"
            curtain
        else puts "Please select 'b' for back, 'm' for main menu, or 'x' to exit:"
            check_user_input
        end
    end
end