class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if@user.save
      redirect_to user_registration_path(@user.id)
    else
      render :new
    end
  end

#ここから下　チーム開発参考資料
#before_action :authenticate_customer!

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = "登録情報が更新されました。"
      redirect_to customers_my_page_path
    else
      render 'edit'
    end
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行しました。"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :zip_code, :address, :tel, :email)
  end
end
