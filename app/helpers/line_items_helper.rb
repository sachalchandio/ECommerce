module LineItemsHelper
    def returnLineItems
        @lineItems = LineItem.all
    end
end
