require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order_form = FactoryBot.build(:order_form)
  end

  describe '商品購入情報入力' do
    context '商品購入に成功する' do
      it 'トークンが存在し、全てのカラムに正しく入力されているので購入できる' do
        expect(@order_form).to be_valid
      end
      it '建物名が空欄でも購入できる' do
        @order_form.building_name = ''
        expect(@order_form).to be_valid
      end
      it '電話番号が数字のみ11桁で入力されているので購入できる' do
        @order_form.phone_number = '12345678901'
        expect(@order_form).to be_valid
      end
    end
    context '商品購入に失敗する' do
      it 'トークンが存在しないので購入できない' do
        @order_form.token = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空なので購入できない' do
        @order_form.postal_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号の頭3桁が2桁以下なので購入できない' do
        @order_form.postal_code = '12-1234'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Postal code Input correctly')
      end
      it '郵便番号の頭3桁が4桁以上なので購入できない' do
        @order_form.postal_code = '1234-1234'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Postal code Input correctly')
      end
      it '郵便番号の後ろ4桁が3桁以下なので購入できない' do
        @order_form.postal_code = '123-123'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Postal code Input correctly')
      end
      it '郵便番号の後ろ4桁が5桁以上なので購入できない' do
        @order_form.postal_code = '123-12345'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Postal code Input correctly')
      end
      it '郵便番号は7桁だがハイフンの位置がおかしいので購入できない' do
        @order_form.postal_code = '1234-123'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Postal code Input correctly')
      end
      it '郵便番号にハイフンが含まれていないので購入できない' do
        @order_form.postal_code = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Postal code Input correctly')
      end
      it '郵便番号が全角で入力されているので購入できない' do
        @order_form.postal_code = '１２３-４５６７'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Postal code Input correctly')
      end
      it '都道府県が空なので購入できない' do
        @order_form.prefecture_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県が1(---)なので購入できない' do
        @order_form.prefecture_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Prefecture Select')
      end
      it '都道府県が49以上なので購入できない' do
        @order_form.prefecture_id = 49
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Prefecture Select')
      end
      it '都道府県が半角なので購入できない' do
        @order_form.prefecture_id = '２２'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Prefecture Select')
      end
      it '市町村が空なので購入できない' do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空なので購入できない' do
        @order_form.house_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が空なので購入できない' do
        @order_form.phone_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が9桁以下なので購入できない' do
        @order_form.phone_number = '123456789'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it '電話番号が12桁以上なので購入できない' do
        @order_form.phone_number = '123456789012'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'ユーザーIDが紐付いていないので購入できない' do
        @order_form.user_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
      it '購入したい商品IDが紐付いていないので購入できない' do
        @order_form.item_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
