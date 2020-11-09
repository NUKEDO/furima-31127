class ItemsController < ApplicationController
  before_action :authenticate_user!,  only: %i[new edit]
  before_action :find_item,           only: %i[show edit update destroy]

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

  def show; end

  def edit
    redirect_to root_path if current_user.id != @item.user_id || @item.purchase_record
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:image, :price, :name, :text, :category_id, :detail_id, :burden_id, :shipment_source_id, :number_of_day_id).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
