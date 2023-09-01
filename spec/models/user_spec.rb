require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
    it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
      expect(@user).to be_valid
    end
  end
  context '新規登録できないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できない' do
      @user.password =''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが129文字以上では登録できない' do
      @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
    end

    it 'パスワードは半角英字のみでは保存できない' do
      @user.password = 'abcdefg'
      @user.password_confirmation = 'abcdefg'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password は半角英数を両方含む必要があります')
    end

    it 'パスワードは半角数字のみでは保存できない' do
      @user.password = '0000000'
      @user.password_confirmation = '0000000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password は半角英数を両方含む必要があります')
    end

    it 'パスワードは全角の英数混合では保存できない' do
      @user.password = 'ＡＡＡＡＡ１'
      @user.password_confirmation = 'ＡＡＡＡＡ１'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password は半角英数を両方含む必要があります')
    end

    it 'お名前(全角)は、空では登録できない' do
      @user.name_last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name last name can't be blank")
    end

    it 'お名前(全角)は、空では登録できない' do
      @user.name_first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name first name can't be blank")
    end

    it 'お名前カナ(全角)は、空では登録できない' do
      @user.name_last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name last name kana can't be blank")
    end

    it 'お名前カナ(全角)は、空では登録できない' do
      @user.name_first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name first name kana can't be blank")
    end

    it 'お名前が全角日本語でないと保存できないこと' do
      @user.name_last_name = 'suzuki'
      @user.valid?
      expect(@user.errors.full_messages).to include('Name last name is invalid. Input full-width characters.')
    end
    it 'お名前が全角日本語でないと保存できないこと' do
      @user.name_first_name = 'suzuki'
      @user.valid?
      expect(@user.errors.full_messages).to include('Name first name is invalid. Input full-width characters.')
    end

    it 'お名前が全角カタカナでないと保存できないこと' do
      @user.name_last_name_kana = 'すずき'
      @user.valid?
      expect(@user.errors.full_messages).to include('Name last name kana is invalid. Input full-width katakana characters.')
    end

    it 'お名前が全角カタカナでないと保存できないこと' do
      @user.name_first_name_kana = 'すずき'
      @user.valid?
      expect(@user.errors.full_messages).to include('Name first name kana is invalid. Input full-width katakana characters.')
    end

    it '生年月日は、空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
 end
end
