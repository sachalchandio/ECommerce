module OrdersHelper
    
    def returnOrder
        @orders = Order.all
    end
end
