require 'pry'

class CashRegister
    attr_reader :discount
    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @items = []
        @checkout = {}
    end

    def total() 
        @total
    end

    def total=(total)
        @total = total
    end

    def add_item(item, price, quantity = 1)
        quantity.times do 
            @items.push(item)
        end
        @checkout[item] = price * quantity
        @total = @total + (price * quantity)
    end

    def apply_discount
        if @discount == 0
            "There is no discount to apply."
        else 
            @total = Integer(@total - (@total * (@discount/100.0)))
            "After the discount, the total comes to $#{@total}."
        end
    end

    def items
        @items
    end

    def void_last_transaction
       last = @items.last
       @total =  @total - @checkout[last]
    end
end
