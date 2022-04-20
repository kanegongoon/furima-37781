require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe "ユーザー新規登録" do
    context "ユーザー情報" do
      it "nickname:必須" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it "email:必須" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it "email:一意性" do
        @user.save
        another_user =  FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end

      it "email:@を含む" do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include"Email is invalid"
      end

      it "password:必須" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it "password:6文字以上" do
        @user.password = 'aaaaa'
        @user.password_confirmation = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end

      it "password:英字のみ:登録できない" do
        @user.password = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it "password:数字のみ:登録できない" do
        @user.password = '0000000'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it "password:全角文字を含む:登録できない" do
        @user.password = 'あああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it "password = encrypted_password" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
    end

    context "本人情報確認" do
      it "first_name:必須" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end

      it "last_name:必須" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end

      it "first_name:全角入力必須" do
        @user.first_name = 'ｱｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid"
      end

      it "last_name:全角入力必須" do
        @user.last_name = 'ｱｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name is invalid"
      end

      it "first_name_kana:必須" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end

      it "last_name_kana:必須" do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end

      it "first_name_kana:全角入力必須" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank", "First name kana is invalid"
      end

      it "last_name_kana:全角入力必須" do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank", "Last name kana is invalid"
      end

      it "birthday:必須" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end

    it '全ての項目が存在すれば登録できる' do
      expect(@user).to be_valid
    end
  end
end
