module ProductsHelper
    
    def returnProducts
        @products = Product.all
    end
    
    
    def scraping(argURL)
        images = []
        names  = []
        prices = []
        prices_without_commas = []

        url  = argURL
        doc = Nokogiri::HTML(open(url))
        doc.css(".osh-content .products").each do |product|
            product.css("img").each do |image|
               
                if image["data-src"].to_s.include? "60x60"
                    
                elsif image["data-src"].to_s.include? "220x220"
                      images << image["data-src"] 
                else 
                    
                end
            end
            
            product.css(".-gallery .price:nth-child(1) span+ span").each do |price|                                                   
                 prices << price.text
            end
            
             prices.each do |price|
                 
                price = price.gsub(/\D/, "").to_i
                
                #price = price.to_i
                prices_without_commas << price
                
            end
            product.css("span[class='name']").each do |pro|
                
                names << pro.text
            end
        end
        
        return [prices_without_commas, images, names ]
    end
    
end

  