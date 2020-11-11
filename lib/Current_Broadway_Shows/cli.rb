class CurrentBroadwayShows::CLI
    
    def call
        puts "Please wait as we load your gem!"
        CurrentBroadwayShows::Show.new_from_array
        puts "                                                                                                                                                   
8 888888888o   8 888888888o.      ,o888888o.           .8.          8 888888888o.    `8.`888b                 ,8' .8.   `8.`8888.      ,8' 
8 8888    `88. 8 8888    `88.  . 8888     `88.        .888.         8 8888    `^888.  `8.`888b               ,8' .888.   `8.`8888.    ,8'  
8 8888     `88 8 8888     `88 ,8 8888       `8b      :88888.        8 8888        `88. `8.`888b             ,8' :88888.   `8.`8888.  ,8'   
8 8888     ,88 8 8888     ,88 88 8888        `8b    . `88888.       8 8888         `88  `8.`888b     .b    ,8' . `88888.   `8.`8888.,8'    
8 8888.   ,88' 8 8888.   ,88' 88 8888         88   .8. `88888.      8 8888          88   `8.`888b    88b  ,8' .8. `88888.   `8.`88888'     
8 8888888888   8 888888888P'  88 8888         88  .8`8. `88888.     8 8888          88    `8.`888b .`888b,8' .8`8. `88888.   `8. 8888      
8 8888    `88. 8 8888`8b      88 8888        ,8P .8' `8. `88888.    8 8888         ,88     `8.`888b8.`8888' .8' `8. `88888.   `8 8888      
8 8888      88 8 8888 `8b.    `8 8888       ,8P .8'   `8. `88888.   8 8888        ,88'      `8.`888`8.`88' .8'   `8. `88888.   8 8888      
8 8888    ,88' 8 8888   `8b.   ` 8888     ,88' .888888888. `88888.  8 8888    ,o88P'         `8.`8' `8,`' .888888888. `88888.  8 8888      
8 888888888P   8 8888     `88.    `8888888P'  .8'       `8. `88888. 8 888888888P'             `8.`   `8' .8'       `8. `88888. 8 8888      
"
        sleep(2)
        menu
    end

    def menu
        puts "
Which category of current Broadway shows would you like to view? (Enter 1 - 8):
    1.  Top 5 Grossing Shows
    2.  The 5 Cheapest Shows based on average ticket price
    3.  The 5 Easiest Shows to get into based on average capacity
    4.  Musicals
    5.  Plays
    6.  All Shows
    7.  Theater List
    8.  Exit"
        user_input = gets.strip.to_i
        if user_input < 1 or user_input > 8
            puts "Please select a valid number."
            menu
        elsif user_input == 1
            category_top_five_grossing
        elsif user_input == 2
            category_cheapest
        elsif user_input == 3
            category_lowest_capacity
        elsif user_input == 4
            category_musicals
        elsif user_input == 5
            category_plays
        elsif user_input == 6
            category_all_shows
        elsif user_input == 7
            category_theaters
        else user_input == 8
            curtain
        end
    end

    def choice_output(choice)
        if choice.open? == true
        puts "  
#{choice.title} is currently playing at: #{choice.theater}."
        else puts "
#{choice.title} is scheduled to open at: #{choice.theater}."
        end
        puts "    #{choice.type}
    #{choice.gross}
    #{choice.average_ticket_price}
    #{choice.average_capacity}.

Visit #{choice.show_url} for more information!
        "
    sleep(1)
    puts "Select 'm' for main menu or 'x' to exit:"
        user_input = gets.strip 
            if user_input == "m"
                menu
            elsif user_input == "x"
                curtain
            end
    end

    def category_top_five_grossing
        puts "TOP 5 GROSSING SHOWS CURRENTLY PLAYING:"
        CurrentBroadwayShows::Show.top_five_grossing.each.with_index(1) do |show, i|
            puts "#{i}. #{show.title} - #{show.gross}"
        end
        puts "
Enter the number of the Broadway show you would like more information about (Enter 1 - 5):"
        user_input = gets.strip.to_i
        if user_input < 1 or user_input > 5
            puts "Please select a number between 1 and 5."
            category_top_five_grossing
        else
        choice_output(CurrentBroadwayShows::Show.top_five_grossing[user_input - 1])
        end
    end

    def category_musicals
        puts "CURRENT MUSICALS:"
        CurrentBroadwayShows::Show.musicals.each.with_index(1) do |show, i|
            puts "#{i}. #{show.title}"
        end
            puts "
Enter the number of the Broadway Musical you would like more information about:"
            user_input = gets.strip.to_i
            if user_input < 1 or user_input > CurrentBroadwayShows::Show.musicals.count
                puts "Please select a number between 1 and #{CurrentBroadwayShows::Show.musicals.count}."
                category_musicals
            else
            choice_output(CurrentBroadwayShows::Show.musicals[user_input - 1])
            end
    end

    def category_plays
        puts "CURRENT PLAYS:"
        CurrentBroadwayShows::Show.plays.each.with_index(1) do |show, i|
            puts "#{i}. #{show.title}"
        end
        puts "
Enter the number of the Broadway Play you would like more information about:"
        user_input = gets.strip.to_i
        if user_input < 1 or user_input > CurrentBroadwayShows::Show.plays.count
            puts "Please select a number between 1 and #{CurrentBroadwayShows::Show.plays.count}."
            category_plays
        else
        choice_output(CurrentBroadwayShows::Show.plays[user_input - 1])
        end
    end

    def category_all_shows
        puts "CURRENT BROADWAY SHOWS:"
        CurrentBroadwayShows::Show.all.each.with_index(1) do |show, i|
            puts "#{i}. #{show.title}"
        end
        puts "
Enter the number of the Broadway show you would like more information about:"
        user_input = gets.strip.to_i
        if user_input < 1 or user_input >CurrentBroadwayShows::Show.all.count
            puts "Please select a number between 1 and #{CurrentBroadwayShows::Show.all.count}."
            category_all_shows
        elsif
        choice_output(CurrentBroadwayShows::Show.all[user_input - 1])
        end
    end

    def category_cheapest
        puts "CHEAPEST SHOWS:"
        CurrentBroadwayShows::Show.five_cheapest_shows.each.with_index(1) do |show, i|
            puts "#{i}. #{show.title} - #{show.average_ticket_price}"
        end
        puts "
Enter the number of the Broadway show you would like more information about(Enter 1 - 5):"
        user_input = gets.strip.to_i
        if user_input < 1 or user_input > 5
            puts "Please select a number between 1 and 5."
            category_cheapest
        else
        choice_output(CurrentBroadwayShows::Show.five_cheapest_shows[user_input - 1])
        end
    end

    def category_lowest_capacity
        puts "EASIEST SHOWS TO GET INTO:"
        CurrentBroadwayShows::Show.five_lowest_capacity.each.with_index(1) do |show, i|
            puts "#{i}. #{show.title} - #{show.average_capacity}"
        end
        puts "
Enter the number of the Broadway show you would like more information about (Enter 1 - 5):"
        user_input = gets.strip.to_i
        if user_input < 1 or user_input > 5
            puts "Please select a number between 1 and 5."
            category_lowest_capacity
        else
        choice_output(CurrentBroadwayShows::Show.five_lowest_capacity[user_input - 1])
        end
    end

    def category_theaters
        puts "THEATERS:"
        CurrentBroadwayShows::Show.theaters.each.with_index(1) do |show, i|
            puts "#{i}. #{show.theater} - #{show.title}"
        end
        puts "
Enter the number of a theater to view the show that is currently playing there:"
        user_input = gets.strip.to_i
        if user_input < 1 or user_input > CurrentBroadwayShows::Show.theaters.count
            puts "Please select a number between 1 and #{CurrentBroadwayShows::Show.theaters.count}."
            category_theaters
        else
        choice_output(CurrentBroadwayShows::Show.theaters[user_input - 1])
        end
    end

    def curtain 
        puts "
    +-++-++-++-++-++-++-+
    |C||U||R||T||A||I||N|
    +-++-++-++-++-++-++-+"
    end
end