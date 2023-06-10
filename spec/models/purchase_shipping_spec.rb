require 'pry'
require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  describe '配送先情報' do
    before do
      @order = FactoryBot.build(:purchase_shipping)
    end

    context '内容に問題がない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order).to be_valid
      end

      it '建物名は任意であること' do
        expect(@order).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空だと保存できない' do
        @order.post_code = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code can't be blank")
      end

      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @order.post_code = "1234567"
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code is invalid")
      end

      it '都道府県が空だと保存できない' do
        @order.prefecture_id = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "発送元の地域に「---」が選択されている場合は出品できない" do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が空だと保存できない' do
        @order.municipalities = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipalities can't be blank")
      end

      it '番地が空だと保存できない' do
        @order.address = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空だと保存できない' do
        @order.number = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Number can't be blank")
      end

      it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと' do
        @order.number = "123456789012"
        @order.valid?
        expect(@order.errors.full_messages).to include("Number is invalid")
      end

      
      it 'userが紐付いていなければ保存できない' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていなければ保存できない' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end

      it "tokenが空では登録できないこと" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end

    end
  end
end
