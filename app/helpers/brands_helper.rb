module BrandsHelper
    
    
    def brand_scraping(url)
        brands = []
        scraped_url = url
        doc = Nokogiri::HTML(open(url))
        doc.css(".-brands .cnv-name").each do |array|
            a= array.text
            b = a.split(/\s\s/)
            d = b[0]
            brands << d
        end
        return brands
        
    end
end
