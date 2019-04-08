require 'pry'

class CashRegister
  attr_accessor :total, :discount, :last_trans, :items

  @@items = []

  def initialize (discount = 0)
    total = 0
    @total = total
    @discount = discount
  end

  def total
    @total
    #binding.pry
  end

  def add_item (item, price, quantity = 1)
    self.total = @total + (price * quantity)
    @@items << item
    @last_item = item
    #binding.pry
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
    #binding.pry
  end
=begin
  def void_last_transaction
    @@items.pop
    void = self.total - @last_item
    @total = void
  end
=end
end
