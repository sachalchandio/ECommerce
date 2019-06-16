class Product < ApplicationRecord
    include PgSearch

    has_many :line_items, dependent: :destroy
    before_destroy :ensure_not_referenced_by_any_line_item
    belongs_to :brand
    belongs_to :department
    belongs_to :sub_department
    
    has_attached_file :image, styles: {large: "600x600>", medium:"300x300>",tumb:"150x150#" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
    validates :price, presence: true   
    validates :name , presence: true
    
    pg_search_scope :searchName, against: [:name], using: {
        tsearch:{
            prefix:true
        }
    }
    
    attr_reader :avatar_remote_url
    has_attached_file :avatar

    def avatar_remote_url=(url_value)
        self.avatar = URI.parse(url_value)
        # Assuming url_value is http://example.com/photos/face.png
        # avatar_file_name == "face.png"
        # avatar_content_type == "image/png"
        @avatar_remote_url = url_value
    end
    
    private
    def ensure_not_referenced_by_any_line_item
        unless line_items.empty?
            errors.add(:base, 'Line Items present')
            throw :abort
        end
    end


    
    
    def self.find_the_department(department_name)
        department = Department.find_by_name(department_name)
        return department
    end
    

    
    def self.find_the_brand(brand_name)
        brand = Brand.find_by_name(brand_name)
        return brand
    end
    
    def self.find_the_sub_department(sub_department_name)
        sub_department = SubDepartment.find_by_name(sub_department_name)
        return sub_department
    end
    public
    def country_name
        country = ISO3166::Country[self.from_country]
        country.translations[I18n.locale.to_s] || country.name
    end
    
    
    
end
