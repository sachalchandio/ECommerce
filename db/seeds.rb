# ruby encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

include ProductsHelper
=begin

    
    
    
    User.create!(name:  "Example User",
                 email: "example@railstutorial.org",
                 password:              "foobar",
                 password_confirmation: "foobar",
                 activated: true,
                 activated_at: Time.zone.now)
    
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password = "password"
      User.create!(name:  name,
                   email: email,
                   password:              password,
                   password_confirmation: password,
                   activated: true,
                   activated_at: Time.zone.now)
      end
    
    
    #Departments
    10.times do |n|
        name  = Faker::Commerce.department
        
        while Department.find_by_name(name)
            name  = Faker::Commerce.department
        end
        
        Department.create!(name:  name)
    
    end
    
    #subdepartments
    
    12.times do |n|
         
         name  = Faker::Commerce.department
         deptID = 1 + rand(Department.count)
    
        while SubDepartment.find_by_name(name)
            name  = Faker::Commerce.department
        end
        
        SubDepartment.create!(name:  name,
                              department_id: deptID)
      
    end
    
    
    
    #Brands
    name  = ["LG", "Huawei", "Samsung", "Bata","Servis", "whatever"]
    
    name.each do |n|
      Brand.create!(name: n)
    end
    
=end    
    
    def helpers
      ActionController::Base.helpers
    end
    
    productsArray = helpers.scraping("https://www.daraz.pk/tecno-mobile/")
    
    productsArray[0].length.times do |x|
        Product.create(:name=>productsArray[2][x], :image=>productsArray[1][x], :price=>productsArray[0][x], :description=>"some Mobile Phone", 
        :sub_department=>SubDepartment.first, :department=>Department.first, :brand=>Brand.find_by_name("Tecno Mobile"))
        
        
    end
