class CurrentBroadwayShows::Scraper
    
    def self.create_shows_array(url)
        page = Nokogiri::HTML(open(url))
        shows = []
        page.css(".pb-pl-tile-wrapper").each do |show|
            shows << {
                :title => show.css(".pb-pl-tile-title").text.gsub("â\u0080\u0094", ": ").strip,
                :type => 
                    if show.css(".pb-pl-tile-title").text.gsub("â\u0080\u0094", ": ").strip == "MJ The Musical"
                        "Musical"
                    elsif show.css(".pb-pl-tile-subtitle").text.include?("Musical")
                        "Musical"
                    else "Play"
                    end,
                :show_url => "https://www.playbill.com#{show.css(".pb-pl-tile-box a").attribute("href")}"}
        end
        shows
    end

    def self.scrape_show_stats(url)
        stats = []
        show_page = Nokogiri::HTML(open(url))
        stats << {:gross =>
                if show_page.css(".bsp-component-group.quick-stats .stat-left")[1] == nil
                    "Total Current Gross: Not Yet Available"
                else show_page.css(".bsp-component-group.quick-stats .stat-left")[1].text
                end,
            :theater => 
                if show_page.css(".bsp-bio-content a").first.text == "Pete Townshend" or show_page.css(".bsp-bio-content a").first.text  == "Matthew Lopez" or show_page.css(".bsp-bio-content a").first.text  == "David Byrne"
                    "Theater To Be Announced"
                else
                    show_page.css(".bsp-bio-content a").first.text.strip
                end,
            :average_ticket_price =>
                if show_page.css(".bsp-component-group.quick-stats .stat-right")[1] == nil
                    "Average Ticket Price: Not Yet Available"
                else show_page.css(".bsp-component-group.quick-stats .stat-right")[1].text
                end,
            :average_capacity =>
                if show_page.css(".bsp-component-group.quick-stats .stat-right")[2] == nil
                    "Average % Capacity: Not Yet Available"
                else show_page.css(".bsp-component-group.quick-stats .stat-right")[2].text
                end}
    end
     
end
