require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '出品ができる時' do
      it '商品名、画像、説明、カテゴリー、状態、配送料の負担、発送までの日数、販売価格（条件内）' do
        expect(@item).to be_valid
      end
    end

    context '出品ができない時' do
      it '商品名が空だとと出品できないこと' do
        @item.product = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product can't be blank")
      end
      it '画像が空だとと出品できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品情報が空だとと出品できないこと' do
        @item.information = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Information can't be blank")
      end
      it '商品の状態が空だとと出品できないこと' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition is not a number')
      end
      it '発送の負担が空だとと出品できないこと' do
        @item.shipping_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee is not a number')
      end
      it '発送地域が空だとと出品できないこと' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture is not a number')
      end
      it '発送の日数が空だとと出品できないこと' do
        @item.days_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Days to ship is not a number')
      end
      it '販売価格が空だとと出品できないこと' do
        @item.selling_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price 半角数字で入力して下さい', 'Selling price is not a number')
      end
      it '販売価格が全角数字だとと出品できないこと' do
        @item.selling_price = '２９９'
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price is not a number')
      end
      it 'userが紐付いていないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
