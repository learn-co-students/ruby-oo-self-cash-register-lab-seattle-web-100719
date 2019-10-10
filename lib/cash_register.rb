class CashRegister

    attr_accessor :discount, :total

    def initialize(discount=0)
        @total = 0.0
        @discount = discount
        @items = []
        @lastItem = []
    end

    def add_item(title, price, quantity = 1)
        @lastItem = []
        self.total += price * quantity
        1.upto(quantity).each {|numberOfItems| @items.push(title)}
        @lastItem.push(price)
        @lastItem.push(quantity)
    end

    def apply_discount
        if self.discount == 0
            "There is no discount to apply."
        else
            self.total = self.total - self.total * self.discount / 100
            "After the discount, the total comes to $#{self.total.to_i}."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        1.upto(@lastItem[1]).each {|numberOfItems| @items.pop}
        self.total -= @lastItem[0] * @lastItem[1]
        if(@items == [])
            @total = 0.0
        end
    end
end
