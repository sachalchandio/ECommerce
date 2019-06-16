module SubDepartmentsHelper
    
    def get_all_subdepartments
        return @subdepartments = SubDepartment.all
    end
    
    def get_all_subdepartments_by_name (department_name)
        @all_departments = []
        SubDepartment.all.each do |subdepartment|
            if subdepartment.department.name == department_name
                @all_departments << subdepartment.name
            end
        end
         return @all_departments
    end
    
    
    def subdepartment_scarping(url)
        subdepartments = []
        scraped_url = url
        doc = Nokogiri::HTML(open(url))
        doc.css(".blog-widget li a").each do |sd|
            subdepartments << sd.text
        end
        return subdepartments
    end
        
        
        
end
