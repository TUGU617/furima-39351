require 'pry'
require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録" do
  context '新規登録できるとき' do
    it "全て揃っていれば登録できる" do
      expect(@user).to be_valid
    end
  end
  context '新規登録できないとき' do
    it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "emailが一意性であること" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it "emailは、@を含む必要があること" do
      @user.email = "invalid_email"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "パスワードが空では登録できない" do
      @user.password  = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank", "Password confirmation doesn't match Password")
    end
    it "パスワードは、６文字以上での入力が必要であること" do
      @user.password = "aaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is too short (minimum is 6 characters)")
    end
    it "パスワードは、半角英数字混合での入力が必要であること" do
      @user.password = "aaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は半角英字と半角数字の両方を含める必要があります", "Password confirmation doesn't match Password")
    end
    it "パスワードとパスワード（確認）は、値の一致が必須であること" do
      @user.password_confirmation = "different_password"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "お名前（全角）は、苗字と名前がそれぞれ必要であること" do
      @user.last_name = ''
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank", "First name can't be blank")
    end
    it "お名前（全角）は、全角（漢字・ひらがな・カタカナ）での入力が必要であること" do
      @user.last_name = 'yamada'
      @user.first_name = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid", "First name is invalid")
    end
    it "お名前カナ(全角)は、苗字と名前がそれぞれ必要であること" do
      @user.last_name_kana = ''
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana is invalid", "First name kana can't be blank", "First name kana is invalid")
    end
    it "お名前カナ(全角)は、全角（カタカナ）での入力が必要であること" do
      @user.last_name_kana = '山田'
      @user.first_name_kana = '太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid", "First name kana is invalid")
    end
    it "生年月日が必要であること" do
      @user.date_of_birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Date of birth can't be blank")
    end
    end
  end
end
