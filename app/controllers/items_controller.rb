class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  # SOLD OUT表示が未実装
  def index
    @item = Item.all.order(created_at: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :price, :name, :text, :category_id, :detail_id, :burden_id, :shipment_source_id, :number_of_days_id).merge(user_id: current_user.id)
  end
end
