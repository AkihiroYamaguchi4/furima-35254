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
    it 'passwordは英語のみでは登録できないこと' do
      @user.password = 'abcdef'
      @user.password_confirmation = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password パスワードには半角英字と半角数字の両方を含めて設定してください")
    end
    it 'passwordは数字のみでは登録できないこと' do
      @user.password = '1233456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password パスワードには半角英字と半角数字の両方を含めて設定してください")
    end
    it 'passwordは全角では登録できないこと' do
      @user.password = 'ああああああ'
      @user.password_confirmation = 'ああああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password パスワードには半角英字と半角数字の両方を含めて設定してください')
    end


    it 'パスワードとパスワード（確認用）、値の一致が必須であること' do
      @user.password = '1234ab'
      @user.password_confirmation = '12345ab'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'ユーザー本名は、名字が必須であること' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank", "Family name 全角ひらがな、全角カタカナ、漢字で入力して下さい")
    end
    it 'ユーザー本名は、名前が必須であること' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", "First name 全角ひらがな、全角カタカナ、漢字で入力して下さい")
    end
    

    it 'ユーザー本名は、名字は全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.family_name = 'aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name 全角ひらがな、全角カタカナ、漢字で入力して下さい")
    end
      
    it 'ユーザー本名は、名前は全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.first_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角ひらがな、全角カタカナ、漢字で入力して下さい")
    end
  
    it 'ユーザー本名のフリガナは、名字が必須であること' do
      @user.family_name_reading = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name reading can't be blank", "Family name reading 全角カタカナで入力して下さい")
    end
    it 'ユーザー本名のフリガナは、名前が必須であること' do
      @user.first_name_reading = ''
      @user.valid?
      expect(@user.errors.full_messages).to include( "First name reading can't be blank", "First name reading 全角カタカナで入力して下さい")
    end
   
  
    it 'ユーザー本名名字のフリガナは、全角（カタカナ）での入力が必須であること' do
      @user.family_name_reading = 'aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name reading 全角カタカナで入力して下さい")
    end
    it 'ユーザー本名名前のフリガナは、全角（カタカナ）での入力が必須であること' do
      @user.first_name_reading = 'aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include( "First name reading 全角カタカナで入力して下さい")
    end
   
    it '生年月日が必須であること' do
      @user.birth_id = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
    end  
   end  
end





