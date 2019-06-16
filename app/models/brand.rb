class Brand < ApplicationRecord
    include PgSearch
     Brand_NAME_REGEX = /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/ 
    
     validates :name, presence: true, length: { maximum: 30 },
                   format: { with: Brand_NAME_REGEX },
                   uniqueness: { case_sensitive: false }
    
    has_many :products
    
    has_many :join_on_d_sd_bs
    has_many :sub_departments, through: :join_on_d_sd_bs
    
    
    
     pg_search_scope :searchName, against: [:name], using: {
        tsearch:{
            prefix:true
        }
    }
    
    
    def self.find_subdepartment(sub_department)
        sub_department_name = SubDepartment.find_by_name(sub_department)
        return sub_department_name
    end
    
    
end


