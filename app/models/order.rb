class Order < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy

  def top
    @order = Order.page(params[:page])
  end

  #def total_quantity
    #sum = 0
    #self.order_items.each do |order_item|
     # sum = sum + order_item.quantity
    #end
   # sum
  #end
end
