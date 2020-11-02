require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload("/files/DSC_0934.JPG")
  end

  def generate_long(num)
    str = ''
    string = 'あ'
    num.times do |i|
      @str = str << string
    end
  end

  describe '商品の新規出品' do
    context '新規出品に成功する' do
      it '全てのカラムに正しく入力されている' do
        expect(@item).to be_valid
      end
      it 'priceが300円以上なので出品できる' do
        @item.price = '300'
        expect(@item).to be_valid
      end
      it 'priceが9,999,999円以下なので出品できる' do
        @item.price = '9999999'
        expect(@item).to be_valid
      end
      it 'nameが40文字以下なので出品できる' do
        generate_long(40)
        @item.name = @str
        expect(@item).to be_valid
      end
      it 'textが1000文字以下なので出品できる' do
        generate_long(1000)
        @item.text = @str
        expect(@item).to be_valid
      end
    end

    context '新規出品に失敗する' do
      it 'priceが空欄なので出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300未満なので出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが1000万以上なので出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 10000000')
      end
      it 'priceが整数でないので出品できない' do
        @item.price = '10000.5'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be an integer')
      end
      it 'priceが全角なので出品できない' do
        @item.price = '５０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'nameが空欄なので出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'nameが41文字以上なので出品できない' do
        generate_long(41)
        @item.name = @str
        @item.valid?
        expect(@item.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
      end
      it 'textが空欄なので出品できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'textが1000文字以上なので出品できない' do
        generate_long(1001)
        @item.text = @str
        @item.valid?
        expect(@item.errors.full_messages).to include('Text is too long (maximum is 1000 characters)')
      end
      it 'category_idが空なので出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'category_idが1なので出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'category_idが0以下なので出品できない' do
        @item.category_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be greater than or equal to 2')
      end
      it 'category_idが11より上なので出品できない' do
        @item.category_id = '12'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be less than or equal to 11')
      end
      it 'category_idが整数ではないので出品できない' do
        @item.category_id = '2.5'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be an integer')
      end
      it 'category_idが全角なので出品できない' do
        @item.category_id = '２'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end
      it 'detail_idが空なので出品できない' do
        @item.detail_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank")
      end
      it 'detail_idが1なので出品できない' do
        @item.detail_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Detail must be other than 1')
      end
      it 'detail_idが0以下なので出品できない' do
        @item.detail_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Detail must be greater than or equal to 2')
      end
      it 'detail_idが7より上なので出品できない' do
        @item.detail_id = '8'
        @item.valid?
        expect(@item.errors.full_messages).to include('Detail must be less than or equal to 7')
      end
      it 'detail_idが整数ではないので出品できない' do
        @item.detail_id = '2.5'
        @item.valid?
        expect(@item.errors.full_messages).to include('Detail must be an integer')
      end
      it 'detail_idが全角なので出品できない' do
        @item.detail_id = '２'
        @item.valid?
        expect(@item.errors.full_messages).to include('Detail is not a number')
      end
      it 'burden_idが空なので出品できない' do
        @item.burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden can't be blank")
      end
      it 'burden_idが1なので出品できない' do
        @item.burden_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Burden must be other than 1')
      end
      it 'burden_idが0以下なので出品できない' do
        @item.burden_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Burden must be greater than or equal to 2')
      end
      it 'burden_idが3より上なので出品できない' do
        @item.burden_id = '8'
        @item.valid?
        expect(@item.errors.full_messages).to include('Burden must be less than or equal to 3')
      end
      it 'burden_idが整数ではないので出品できない' do
        @item.burden_id = '2.5'
        @item.valid?
        expect(@item.errors.full_messages).to include('Burden must be an integer')
      end
      it 'burden_idが全角なので出品できない' do
        @item.burden_id = '２'
        @item.valid?
        expect(@item.errors.full_messages).to include('Burden is not a number')
      end
      it 'shipment_source_idが空なので出品できない' do
        @item.shipment_source_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment source can't be blank")
      end
      it 'shipment_source_idが1なので出品できない' do
        @item.shipment_source_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipment source must be other than 1')
      end
      it 'shipment_source_idが0以下なので出品できない' do
        @item.shipment_source_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipment source must be greater than or equal to 2')
      end
      it 'shipment_source_idが48より上なので出品できない' do
        @item.shipment_source_id = '49'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipment source must be less than or equal to 48')
      end
      it 'shipment_source_idが整数ではないので出品できない' do
        @item.shipment_source_id = '2.5'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipment source must be an integer')
      end
      it 'shipment_source_idが全角なので出品できない' do
        @item.shipment_source_id = '２'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipment source is not a number')
      end
      it 'number_of_days_idが空なので出品できない' do
        @item.number_of_days_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Number of days can't be blank")
      end
      it 'number_of_days_idが1なので出品できない' do
        @item.number_of_days_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Number of days must be other than 1')
      end
      it 'number_of_days_idが0以下なので出品できない' do
        @item.number_of_days_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Number of days must be greater than or equal to 2')
      end
      it 'number_of_days_idが4より上なので出品できない' do
        @item.number_of_days_id = '5'
        @item.valid?
        expect(@item.errors.full_messages).to include('Number of days must be less than or equal to 4')
      end
      it 'number_of_days_idが整数ではないので出品できない' do
        @item.number_of_days_id = '2.5'
        @item.valid?
        expect(@item.errors.full_messages).to include('Number of days must be an integer')
      end
      it 'number_of_days_idが全角なので出品できない' do
        @item.number_of_days_id = '２'
        @item.valid?
        expect(@item.errors.full_messages).to include('Number of days is not a number')
      end
      it 'imageが存在しないので出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'ユーザーが紐づいていないので出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
