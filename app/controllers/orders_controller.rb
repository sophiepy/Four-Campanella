class OrdersController < ApplicationController
  before_action :authenticate_user!
  def new
    @order = Order.new
  end

  def confirm_wrapping
  end

  def check
    @order = Order.new(order_params)
    @items = current_user.items.all # アイテムの情報をユーザーに確認してもらうために使用します
    @items = Item.where(id: params[:order][:item_id])

  end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    if @order.save
        item = Item.find(order_params[:item_id])
        item.update(is_active: false)
      redirect_to complete_path
    end
  end

  def complete
  end

  def index
    @orders = current_user.orders

  end

  def show
    @order = Order.find(params[:id]) #order特定
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :name, :address, :postage, :zip_code, :item_id, :total_price, :quantity)
  end

end

