class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  # SOLD OUT表示が未実装
  def index
    @items = Item.all.order(created_at: 'DESC').includes(:purchase_record)
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

  def show
    @item = Item.find(params[:id])
    count_stock(@item)
  end

  private

  def item_params
    params.require(:item).permit(:image, :price, :name, :text, :category_id, :detail_id, :burden_id, :shipment_source_id, :number_of_day_id).merge(user_id: current_user.id)
  end

  def count_stock(item)
    @stock = 'Exists'
    purchase_records = PurchaseRecord.all
    purchase_records.each do |purchase_record|
      if purchase_record.item_id == item.id
        @stock = nil
        break
      end
    end
  end
end
