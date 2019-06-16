module DepartmentsHelper
    
    def iAmTooFuckingShit
       return @DepartmentsVar = Department.all
    end
    
    
    
    def department_scraping(url)
        departments = []
        scraped_url = url
        doc = Nokogiri::HTML(open(url))
        doc.css("#menuFixed .menu-items .nav-subTxt").each do |department|
            departments << department.text
        end
        
        return departments
            
        
    end
    
end
