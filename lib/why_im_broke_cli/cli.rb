class WhyImBrokeCli::CLI
  
  def call
    welcome
    menu
  end
  
  def welcome
    puts "Welcome to This Is Why I'm Broke."
    puts "These are the 101 best things to do in NYC plus a little extra:"
    WhyImBrokeCli::Scraper.activate
  end
  
  def menu
    input = nil
    while input != "exit"
      puts "You can type list, search, or exit:"
      input = gets.strip.downcase
      
      if input == "list"
        list
      elsif input == "search"
        search
      else
        puts "Sorry try again" unless input == "exit"
      end
          
    end
    goodbye
  end
  
  def list
    WhyImBrokeCli::Item.list
    puts "You can enter a number to learn more about an event:"
    input = gets.strip.downcase
      if input.to_i <= 0 || input.to_i > 102
        puts "Sorry try again"
      else
        WhyImBrokeCli::Item.details(input.to_i - 1)
      end
  end
  
  def search
    puts "You can search by type of event:"
    puts "(Bars, Attractions, Restaurants, Museums, Movie, Comedy, Theater, Things to do, Music, Sports, Shopping, Nightlife, Health)"
    input = gets.strip.capitalize
    
    if WhyImBrokeCli::Item.search_by_type(input) == []
      puts "Sorry try again"
    else
      x = WhyImBrokeCli::Item.search_by_type(input)
      puts "You can enter a number to learn more about an event:"
      input = gets.strip.to_i
    
      if input <= 0 || input > x.size
        puts "Sorry try again"
      else
        WhyImBrokeCli::Item.details_for_search(x, input.to_i - 1)
      end
    end
  end
  
  def goodbye
    puts "Goodbye Friend"
  end
  
  
end
