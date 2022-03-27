class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  #has_many :items, dependent: :destroy

  enum payment_method: { credit_card: 0, transfer: 1 }
  # enum payment: { credit_card: クレジットカード, transfer: 銀行振込 }

  def top
    @order = Order.page(params[:page])
  end

  # def total_quantity
    # sum = 0
    # self.order_items.each do |order_item|
      # sum = sum + order_item.quantity
    # end
    # sum
  # end
end
