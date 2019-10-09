require "pry"
class CashRegister
    attr_accessor :total, :discount
    attr_reader :reciept

    def initialize(discount = nil)
        @total = 0
        @discount = discount
        @items = []
        @reciept = []
    end

    def add_item(name, price, quantity = 1)
        self.total += quantity * price

        @reciept.unshift({name => [price, quantity]})

        quantity.times do 
            @items << name
        end

    end

    def apply_discount
        if self.discount
            self.total *= 1 - (@discount)/100.0
            "After the discount, the total comes to $#{@total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        void_item = @reciept.shift
        price, quantity = void_item.values[0]
        self.total -= price*quantity
    end
end



