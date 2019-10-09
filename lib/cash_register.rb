require 'pry'

class CashRegister
    
    attr_accessor :total, :discount, :last_transaction
    
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @last_transaction = nil
        @last_transaction_name = nil
    end

    def add_item(title, price, quantity = 1)
        i = 0
        while i < quantity do
            @items << title
            @last_transaction = price * quantity
            @last_transaction_name = title
            i += 1
        end
        self.total += price * quantity
    end

    def apply_discount
        if self.discount == 0
            "There is no discount to apply."
        else
            self.total -= (self.total * (self.discount / 100.0))
            "After the discount, the total comes to $#{self.total.round}."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        items.delete(@last_transaction_name)
        if items.empty?
            self.total = 0.0
        else
            self.total -= @last_transaction
        end
    end










end
