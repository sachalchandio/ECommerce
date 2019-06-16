module AdministratorHelper
    
    def test
        
    end
    
    def graph
        
        @SubDepartment =  SubDepartment.all
        @Department =  Department.all
        
        #select("songs.id, count(sub_de.id) AS listens_count").
        ##joins(:listens).
        ##group("songs.id").
        #order("listens_count DESC").
        #limit(5)
        
        
        pie_chart SubDepartment.group(:department_id).count, height: '200px', library: {
          title: {text: 'Sub departments in a Department'},
          yAxis: {
             allowDecimals: false,
             title: {
                 text: 'Sub Department Count'
             }
          },
          xAxis: {
             title: {
                 text: 'Derpartment Name'
             }
          }
        }
      
    end
end
