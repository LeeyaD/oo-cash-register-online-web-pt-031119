require 'pry'
class CashRegister
  attr_accessor :total, :last_trans
  attr_reader :discount

  def initialize (discount = 0)
    total = 0
    @total = total
    @discount = discount
    @items = []
  end
  
  def add_item (item, price, quantity = 1)
    self.total = @total + (price * quantity)
    @last_trans = price * quantity
    quantity.times do
      @items << item
    end
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      with_discount = self.total - (self.total * (@discount.to_f / 100)).round
      @total = with_discount
      "After the discount, the total comes to $#{with_discount}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @items.pop
    @total = self.total - @last_trans
  end
end
