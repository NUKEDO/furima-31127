class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    find_item
    if @item.purchase_record
      redirect_to root_path
    elsif current_user.id != @item.user_id
      @order_form = OrderForm.new
    else
      redirect_to root_path
    end
  end

  def create
    @order_form = OrderForm.new(purchase_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      find_item
      render :index
    end
  end

  private

  def purchase_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
