require "pry"
class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    self.total += price * quantity
    self.last_transaction = self.total

    quantity.times do
      @items << title
    end
  end

  def apply_discount
    if @discount > 0
      percentage = discount.fdiv(100)
      self.total -=  (self.total * percentage)
      self.last_transaction = self.total
      "After the discount, the total comes to $#{self.total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    self.total -= self.last_transaction
  end
end
