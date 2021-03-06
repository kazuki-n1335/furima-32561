require 'rails_helper'

describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規登録' do
    context '新規登録がうまくいくとき' do
      it '正常に記入すると新規登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it '商品画像がないとと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("出品画像を入力してください")
      end

      it '商品名が空欄だと登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end

      it '商品の説明が空欄だと登録できない' do
        @item.introduce = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end

      it 'カテゴリーが空欄だと登録できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end

      it '商品の状態が空欄だと登録できない' do
        @item.item_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end

      it '配送料の負担が空欄だと登録できない' do
        @item.delivery_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end

      it '発送元の地域が空欄だと登録できない' do
        @item.shipping_area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
      end

      it '発送までの日数が空欄だと登録できない' do
        @item.shipping_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end

      it '販売価格が空欄だと登録できない' do
        @item.value = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格が適切な数値ではありません')
      end

      it '価格が、10,000,000以上だと登録できない' do
        @item.value = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格が適切な数値ではありません')
      end

      it '価格が、300より低いと登録できない' do
        @item.value = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格が適切な数値ではありません')
      end

      it '販売価格は半角数字以外だと登録できない' do
        @item.value = '３５０'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格が適切な数値ではありません')
      end
      it 'userが紐付いていないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('ユーザーを入力してください')
      end
    end
  end
end
