class SubDepartment < ApplicationRecord
    include PgSearch
    
    NAME_REGEX = /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/  
    validates :name, presence: true, length: {minimum: 2, maximum: 30 },
    format: { with: NAME_REGEX },
    uniqueness: { case_sensitive: false }
    
    has_many :join_on_d_sd_bs
    has_many :brands, through: :join_on_d_sd_bs
    belongs_to :department
    has_many :products 
    

    pg_search_scope :searchName, against: [:name], using: {
        tsearch:{
            prefix:true
        }
    }
end
    
