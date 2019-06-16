require 'active_merchant'
require 'rubygems'
class Order < ApplicationRecord
    has_many :line_items, dependent: :destroy
    belongs_to :cart
    has_many :transactions, :class_name => "OrderTransaction"
    attr_accessor :card_number, :card_verification
    validate :validate_card
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX }
    
    
    NAME_REGEX = /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/    
    
    validates :first_name,  presence: true, length: { maximum: 30 },
    format: { with: NAME_REGEX }
    
    
    NAME_REGEX = /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/    
    
    validates :last_name,  presence: true, length: { maximum: 30 },
    format: { with: NAME_REGEX }
    
    
    validates :card_number , presence: true , length: {minimum: 16, maximum: 16},
    numericality: { only_integer: true }
    
    
    
    validates :address , presence: true 
    
    
     
    
    
    
    
    
   
 
    enum pay_type: {
        "Check" => 0,
        "Credit card" => 1,
        "Cash On Delievry" => 2
    }
    
   
    
   # validates :pay_type, inclusion: pay_types.keys
    
    def add_line_items_from_cart(cart)
        cart.line_items.each do |item|
        item.cart_id = nil
        line_items << item
        end
    end
    def get_total_of_cart(cart)
        total = 0
        cart.line_items.each do |item|
            total +=  item.total_price
            return total
        end
    end
    
    def purchase
      response = GATEWAY.purchase(self.amount, credit_card , purchase_options)
      transactions.create!(:action => "purchase", :amount => self.amount, :response => response)
      cart.update_attribute(:purchased_at, Time.now) if response.success?
      response.success?
    end
  

  private
  
  def purchase_options
    {
        :ip => ip_address,
        :billing_address => {
        :name     => "Haris",
        :address1 => "123 Main St.",
        :city     => "Lahore",
        :state    => "Punjab",
        :country  => "Pakistan",
        :zip      => "52250"
      }
    }
  end
  
  def price_in_cents()
    ((cart.total_price/100)*100).round
  end
  
  public
  
  def validate_card
    unless credit_card#valid?
      credit_card.errors.full_messages.each do |message|
        errors[:base] << "error"
        puts "Error"
      end
      
    end
    puts "working"
  end
  public
  def credit_card
    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
      :brand              =>  card_type ,
      :number             => "4032032175899399",
      :verification_value => "123",
      :month              => card_expires_on.month,
      :year               => card_expires_on.year,
      :first_name         => first_name,
      :last_name          => last_name
      
    )
  end
end
