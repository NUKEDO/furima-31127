class OrdersController < ApplicationController
  def show
    @item = Item.find(params[:id])
    @purchase_record = Purchase_record.new
  end

  def create
    @purchase_record = Purchase_record.new(purchase_record_params)

  end

  private

  def purchase_record_params
    params.require(:purchase_record).merge(user_id: current_user.id, item_id: current_item.id)
  end
end
