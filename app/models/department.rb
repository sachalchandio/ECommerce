class Department < ApplicationRecord
    DEP_NAME_REGEX = /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/   
     validates :name, presence: true, length: {minimum: 4, maximum: 50 },
     format: { with: DEP_NAME_REGEX },
     uniqueness: { case_sensitive: false }
     
     has_many :sub_departments 
end