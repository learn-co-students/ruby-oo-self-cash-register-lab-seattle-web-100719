require 'pry'

class CashRegister
    attr_accessor :total, :discount, :items, :last_item
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
        @last_item = []
    end

    def add_item(title, price, quantity=1)
        self.total = total + (price * quantity)
        quantity.times do
            items << title
        end
        self.last_item = [title, price, quantity]
    end

    def apply_discount
        if self.discount > 0
            self.total = total - total * (discount.to_f / 100)
            return "After the discount, the total comes to $#{@total.to_i}."
        else
            return "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.items.pop
        self.total = total - (self.last_item[1] * self.last_item[2])

    end

end
