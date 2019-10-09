class CashRegister
    attr_accessor(:discount, :total)
    attr_reader(:items)
    
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @lastTransaction = {:name => "", :price => 0, :quantity => 0}
    end

    def add_item (name, price, quantity = 1)
        quantity.times do
            @items.push(name) 
        end

        @total += price * quantity

        @lastTransaction[:name] = name;
        @lastTransaction[:price] = price;
        @lastTransaction[:quantity] = quantity;
    end

    def apply_discount
        
        if @discount != 0 
            @total -= (@total * (@discount.to_f/100)).to_i
            p "After the discount, the total comes to $#{@total}."
        else
            p "There is no discount to apply."
        end

    end

    def void_last_transaction
        @total -= @lastTransaction[:price]*@lastTransaction[:quantity]
    end

end