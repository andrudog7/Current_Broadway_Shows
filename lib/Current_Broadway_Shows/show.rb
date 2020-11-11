class CurrentBroadwayShows::Show

    attr_accessor :title, :show_url, :type
    @@all = []

    def initialize(title)
        @title = title
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.find_show(title)
        self.all.find{|show| show.title == title}
    end

    def self.new_from_array
        shows_array = CurrentBroadwayShows::Scraper.create_shows_array("https://www.playbill.com/productions?venue-type=broadway")
        shows_array.each do |show|
            show.each do |key, value|
                if key.to_s == "title" && find_show(value) == nil
                    show = self.new(value)
                elsif key.to_s == "type"
                    show.type = value
                elsif key.to_s == "show_url"
                    show.show_url = value 
                    show.add_show_stats(show)
                    show.save 
                end
                
            end
        end     
    end

    def add_show_stats(show)
        stats = CurrentBroadwayShows::Scraper.scrape_show_stats(show.show_url)
        stats.each do |stat|
            stat.each do |key, value|
                self.class.attr_accessor(key)
                self.send("#{key}=", value)
            end
        end
    end

    def self.musicals
        self.all.select{|show| show.type == "Musical"}
    end

    def self.plays
        self.all.select{|show| show.type == "Play"}
    end

    def self.theaters
        self.all.select{|show| show.theater != "Theater To Be Announced" && show.theater != "TBA"}.sort{|show_a, show_b| show_a.theater <=> show_b.theater}
    end

    def self.top_five_grossing
        open_shows = self.all.select{|show| show.open? == true} 
        open_shows.sort{|show_a, show_b| show_b.gross.gsub(/[^0-9]/, '').to_i <=> show_a.gross.gsub(/[^0-9]/, '').to_i}[0, 5]
    end

    def self.five_cheapest_shows
        open_shows = self.all.select{|show| show.open? == true}
        open_shows.sort{|show_a, show_b| show_a.average_ticket_price.gsub(/[^0-9]/, '').to_i <=> show_b.average_ticket_price.gsub(/[^0-9]/, '').to_i}[0, 5]
    end

    def self.five_lowest_capacity
        open_shows = self.all.select{|show| show.open? == true}
        open_shows.sort{|show_a, show_b| show_a.average_capacity.gsub(/[^0-9, .]/, '').to_i <=> show_b.average_capacity.gsub(/[^0-9, .]/, '').to_i}[0, 5]
    end

    def open?
        self.gross == "Total Current Gross: Not Yet Available" ? false : true 
    end
end
