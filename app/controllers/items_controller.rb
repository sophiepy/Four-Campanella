class ItemsController < ApplicationController
  before_action :authenticate_user!
  def index
    @all_items_count = Item.where(is_active: true).count
    @items_page = Item.where(is_active: true).page(params[:page]).per(9)
    #byebug
    # @items_page = Item.where(is_active: true).page(params[:page]).per(9)
  end
  def show
    @item = Item.find(params[:id])
    # if user_signed_in?
    #   if current_user.items.find_by(item_id:params[:id]).present?
    #     @item = current_user.items.find_by(item_id:params[:id])
    #   else
    #     @item = Item.new
    #   end
    # end
    #byebug
  end
  def create
    item = current_user.items.new(item_params)
    item.save
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:quantity, :item_id)
  end
end

  #ここから下チーム開発の時の
  # def index
  #   @genres = Genre.all
  #   @all_items_count = Item.where(is_active: true).count
  #   @items_page = Item.where(is_active: true).page(params[:page]).per(9)
  # end

  # def show
  #   @genres = Genre.all
  #   # 『カートに入れる』form_with用インスタンスの定義
  #   @item = Item.find(params[:id])
  #   if customer_signed_in?
  #     if current_customer.cart_items.find_by(item_id:params[:id]).present?
  #       @cart_item = current_customer.cart_items.find_by(item_id:params[:id])
  #     else
  #       @cart_item = CartItem.new
  #     end
  #   end
  # end

