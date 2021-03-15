require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  describe '商品購入' do
    before do
      @user = FactoryBot.create(:user, email: 'testcode@test.com')
      @item = FactoryBot.create(:item)
      @order_form = FactoryBot.build(:order_form, user_id: @user, item_id: @item)
      sleep(1)
    end

    context '商品購入できるとき' do
      it '全項目が存在すれば購入できる' do
        expect(@order_form).to be_valid
      end
      it 'buildingが空でも購入できる' do
        @order_form.building = ''
        expect(@order_form).to be_valid
      end
    end

    context '商品購入できないとき' do
      it 'zip_codeが空だと購入できない' do
        @order_form.zip_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Zip code can't be blank")
      end
      it 'zip_codeにハイフンがないと購入できない' do
        @order_form.zip_code = '1111111'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include
      end
      it 'shipping_area_idが空だと購入できない' do
        @order_form.shipping_area_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Shipping area must be other than 1')
      end
      it 'cityが空だとが購入できない' do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it 'street_addressが空だと購入できない' do
        @order_form.street_address = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Street address can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @order_form.phone_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが半角数字以外だと購入できない' do
        @order_form.phone_number = 'あアｱａa０'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが英数字混合では登録できない' do
        @order_form.phone_number = '0a0a0a0a0a0'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberは12桁以上では登録できない' do
        @order_form.phone_number = '123456789012'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
      it 'user_idが空だと購入できない' do
        @order_form.user_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと購入できない' do
        @order_form.item_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空だと購入できない' do
        @order_form.token = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
