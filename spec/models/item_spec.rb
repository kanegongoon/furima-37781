require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
  end

  describe "商品出品機能" do
    context "商品が出品できる時" do
      it "全ての項目があれば出品できる" do
        expect(@item).to be_valid
      end
    end
  
    context "商品の出品ができない時" do
      it "一枚の画像:必須" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
  
      it "商品名:必須" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
  
      it "商品の説明:必須" do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end
  
      it "カテゴリーの情報:必須" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
  
      it "商品の状態の情報:必須" do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
  
      it "配送料の負担の情報:必須" do
        @item.shipping_charges_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping charges can't be blank"
      end
  
      it "発送元の地域の情報:必須" do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
  
      it "発送までの日数の情報:必須" do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping day can't be blank"
      end
  
      it "価格の情報:必須" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
  
      it "価格が¥299以下:登録できない" do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end
  
      it "価格が¥10000000以上:登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end
      
      it "価格が全角文字:登録できない" do
        @item.price = "あああ"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
        
      it "価格が半角英語だけ:登録できない" do
      @item.price = "あああ"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "価格が半角英数混合:登録できない" do
        @item.price = "あああ"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
