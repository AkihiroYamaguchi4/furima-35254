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
      it '商品名が空だと出品できないこと' do
        @item.product = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product can't be blank")
      end
      it '画像が空だと出品できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '説明が空だと出品できないこと' do
        @item.information = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Information can't be blank")
      end
      it 'カテゴリーが空だと出品できないこと' do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it '状態が空だと出品できないこと' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition is not a number')
      end
      it '状態が---だと出品できないこと' do
        @item.condition_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end
      

      it '発送の負担が空だと出品できないこと' do
        @item.shipping_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee is not a number')
      end
      it '発送の負担が---だと出品できないこと' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee must be other than 1')
      end
      it '発送地域が空だと出品できないこと' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture is not a number')
      end
      it '発送地域が---だと出品できないこと' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '発送の日数が空だと出品できないこと' do
        @item.days_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Days to ship is not a number')
      end
      it '発送の日数が---だと出品できないこと' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Days to ship must be other than 1')
      end
      it '販売価格が空だと出品できないこと' do
        @item.selling_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price can't be blank")
      end
      it '販売価格が上限以上だと出品できないこと' do
        @item.selling_price = 100000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price must be less than 9999999")
      end
      it '販売価格が上限以下だと出品できないこと' do
        @item.selling_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price must be greater than 300')
      end
      

      it '販売価格が全角数字だと出品できないこと' do
        @item.selling_price = '２９９'
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price is not a number')
      end
      it '販売価格が全角英語だと出品できないこと' do
        @item.selling_price = 'TTT'
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price is not a number')
      end
      it '販売価格が半角英数字を含む場合だと出品できないこと' do
        @item.selling_price = '12a'
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
