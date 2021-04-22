require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  describe '購入者情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_shipping = FactoryBot.build(:purchase_shipping, user_id: user.id, item_id: item.id)
      sleep 0.1
    end
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_shipping).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @purchase_shipping.postal_code = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_shipping.postal_code = 1_234_567
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'postal_codeが全角数字だと保存できないこと' do
        @purchase_shipping.postal_code = '１２３-４５６７'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'postal_codeが半角英字だと保存できないこと' do
        @purchase_shipping.postal_code = 'abc-defg'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @purchase_shipping.prefecture = '0'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityはだと保存できないこと' do
        @purchase_shipping.city = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberは空だと保存できないこと' do
        @purchase_shipping.house_number = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("House number can't be blank")
      end
      it 'building_nameは空でも保存できること' do
        @purchase_shipping.building_name = ''
        expect(@purchase_shipping).to be_valid
      end
      it 'phone_numberは空だと保存できないこと' do
        @purchase_shipping.phone_number = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは全角数字だと保存できないこと' do
        @purchase_shipping.phone_number = '０９０１２３４５６７８'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('Phone number PhoneNumber must be 11 digit Half-width numbers')
      end
      it 'phone_numberは半角英字だと保存できないこと' do
        @purchase_shipping.phone_number = 'abcdefghijk'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('Phone number PhoneNumber must be 11 digit Half-width numbers')
      end
      it 'phone_numberは半角英数字を含むと保存できないこと' do
        @purchase_shipping.phone_number = '0901111111k'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('Phone number PhoneNumber must be 11 digit Half-width numbers')
      end
      it 'tokenが空では登録できないこと' do
        @purchase_shipping.token = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase_shipping.user_id = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @purchase_shipping.item_id = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
