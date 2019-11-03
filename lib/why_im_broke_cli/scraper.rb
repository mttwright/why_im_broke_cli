class WhyImBrokeCli::Scraper
  
  
  def self.activate
    html = "https://www.timeout.com/newyork/things-to-do/101-things-to-do-in-new-york"
    doc = Nokogiri::HTML(open(html))
    
    container = doc.css("article.listCard")
    
    container.each do |item|
      type = item.css("div.category").text.strip
      title = item.css("h3.card-title").text.strip.capitalize
      location = item.css("span.bold").text.strip
      info = item.css("div.js-card-desc-content").css("p").text
      
      if item.css("a.amp-btn-secondary")[0] == nil
        url = "No link provided for this event."
      else
        url = "https://www.timeout.com" + item.css("a.amp-btn-secondary")[0].attribute("href").value
      end
      
      x = WhyImBrokeCli::Item.new(type, title, location, info, url)
    end
  end
  
end
