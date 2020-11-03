class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    purchase_record = PurchaseRecord.new(purchase_params)
    # @item = purchase_record.item
    if purchase_record.valid?
      purchase_record.save
      redirect_to root_path
    # else
      # render "/orders/"
    end
  end

  private

  def purchase_params
    params.permit(:user_id, :item_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end