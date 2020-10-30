class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  private

  def item_params
    params.require(:item).permit(:image, :price, :name, :text, :category_id, :detail_id, :burden_id, :shipment_source_id, :number_of_days_id).merge(user_id: current_user.id)
  end
end