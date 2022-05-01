require 'rails_helper'

RSpec.describe PurchaseRecordAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_record_address = FactoryBot.build(:purchase_record_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '配送先情報' do
    context '購入できる場合' do
      it "全ての項目がある:購入可能" do
        expect(@purchase_record_address).to be_valid
      end

      it "建物名:任意" do
        @purchase_record_address.building_name = ''
        expect(@purchase_record_address).to be_valid
      end
    end

    context '購入できない場合' do
      it "郵便番号:必須" do
        @purchase_record_address.postal_code = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include "Postal code can't be blank"
      end

      it "郵便番号:3桁-4桁の半角文字列" do
        @purchase_record_address.postal_code = '0000000'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
      end

      it "都道府県:必須" do
        @purchase_record_address.prefecture_id= ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include "Prefecture can't be blank"
      end

      it "都道府県「---」が選択:購入できない" do
        @purchase_record_address.prefecture_id= '---'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include "Prefecture can't be blank"
      end

      it "市区町村:必須" do
        @purchase_record_address.city = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include "City can't be blank"
      end

      it "番地:必須" do
        @purchase_record_address.house_number = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include "House number can't be blank"
      end

      it "電話番号:必須" do
        @purchase_record_address.phone_number = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include "Phone number can't be blank"
      end

      it "電話番号:12桁以上" do
        @purchase_record_address.phone_number = '123456789101'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include "Phone number is too long (maximum is 11 characters)"
      end

      it "電話番号:9桁以下" do
        @purchase_record_address.phone_number = '123456789'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include "Phone number is invalid"
      end

      it "電話番号:半角数字以外が含まれている" do
        @purchase_record_address.phone_number = '12345678910１'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include "Phone number is too long (maximum is 11 characters)"
      end

      it 'userが紐付いていないと購入できない' do
        @purchase_record_address.user_id = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include "User can't be blank"
      end

      it 'itemが紐付いていないと購入できない' do
        @purchase_record_address.item_id = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include "Item can't be blank"
      end

      it "token:必須" do
        @purchase_record_address.token = ""
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end