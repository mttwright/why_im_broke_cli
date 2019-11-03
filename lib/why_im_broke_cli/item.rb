class WhyImBrokeCli::Item
  
  @@all = []
  attr_accessor :type, :title, :location, :info, :url
  
  def initialize(type, title, location, info, url)
    @type = type
    @title = title
    @location = location
    @info = info
    @url = url
    @@all.push(self) unless @@all.include?(self) || self.title == ""
  end
  
  def self.all
    @@all
  end
  
  def self.list
    @@all.each_with_index do |item, i|
      puts "#{i + 1}. #{item.title}"
    end
    nil
  end
  
  def self.details(num)
    x = all[num]
    puts "\n"
    puts "All you need to know for, #{num + 1}. #{x.title}:"
    puts "\n"
    puts "Type of activity: #{x.type}"
    puts "\n"
    puts "Location: #{x.location}"
    puts "\n"
    puts "Description: #{x.info}"
    puts "\n"
    puts "Website: #{x.url}"
    puts "\n"
  end
  
  def self.search_by_type(input)
    x = all.select do |item|
      item.type.include?(input)
    end
    x.each_with_index do |item, i|
      puts "#{i + 1}. #{item.title}"
    end
    x
  end
  
  def self.details_for_search(array, num)
    x = array[num]
    puts "\n"
    puts "All you need to know for, #{num + 1}. #{x.title}:"
    puts "\n"
    puts "Type of activity: #{x.type}"
    puts "\n"
    puts "Location: #{x.location}"
    puts "\n"
    puts "Description: #{x.info}"
    puts "\n"
    puts "Website: #{x.url}"
    puts "\n"
  end
  
end
