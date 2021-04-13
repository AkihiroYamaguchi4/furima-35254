require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'ニックネーム,メールアドレス,本名の苗字と氏名,それぞれの読み仮名,生年月日,passwordとpassword_confirmationが存在すれば登録できること' do
       expect(@user).to be_valid
    end

    it 'ニックネームが空では登録できないこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが必須であること' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")

    end
    it 'emailは、@を含む必要があること' do
      @user.email = '@'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")

    end 
    it 'emailが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')

    end 


    it 'passwordが必須であること' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'パスワードは、半角英数字を含む6文字以上での入力が必須であること' do
      @user.password = '1234ab'
      @user.password_confirmation = '1234ab'
      expect(@user).to be_valid
    end
    it 'passwordが半角英数字を含む5文字以下であれば登録できないこと' do
      @user.password = '123ab'
      @user.password_confirmation = '123ab'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'パスワードとパスワード（確認用）、値の一致が必須であること' do

    end
    it 'ユーザー本名は、名字と名前がそれぞれ必須であること' do

    end
    it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do

    end
    it 'ユーザー本名のフリガナは、名字と名前がそれぞれ必須であること' do

    end
    it 'ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること' do

    end
    it '生年月日が必須であること' do

    end
    it '' do

    end
    it '' do

    end    
  end
end





