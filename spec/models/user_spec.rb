require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '正常に記入すると新規登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'ニックネームが空欄だと登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end

      it 'メールアドレスが空欄だと登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'すでに同じメールアドレスが存在すると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'メールアドレスに＠が入っていないと登録できない' do
        @user.email = 'aaaaaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'パスワードが空欄だと登録できない' do
        @user.password = nil
        @user.password_confirmation = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'パスワードが5文字以下だと登録できない' do
        @user.password = 'a1a1a'
        @user.password_confirmation = 'a1a1a'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'パスワードが英数混合でないと登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは英数混合かつ6文字以上で入力してください')
      end
      it 'パスワードと確認用パスワードが異なると登録できない' do
        @user.password = 'a111111'
        @user.password_confirmation = 'a1a1a1a1'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'ユーザー本名の名字が空欄だと登録できない' do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("姓を入力してください")
      end
      it 'ユーザー本名の名字が半角だと登録できない' do
        @user.family_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('姓は全角で入力してください')
      end
      it 'ユーザー本名の名前が空欄だと登録できない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("名を入力してください")
      end
      it 'ユーザー本名の名前が半角だと登録できない' do
        @user.first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('名は全角で入力してください')
      end
      it 'ユーザー本名の名字のフリガナが空欄だと登録できない' do
        @user.reading_family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("姓(フリガナ)を入力してください")
      end
      it 'ユーザー本名の名字のフリガナがカタカナ以外だと登録できない' do
        @user.reading_family_name = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('姓(フリガナ)は全角カタカナで入力してください')
      end
      it 'ユーザー本名の名前のフリガナが空欄だと登録できない' do
        @user.reading_first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("名(フリガナ)を入力してください")
      end
      it 'ユーザー本名の名前のフリガナがカタカナ以外だと登録できない' do
        @user.reading_first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('名(フリガナ)は全角カタカナで入力してください')
      end
      it '生年月日が空欄だと登録できない' do
        @user.birth_day = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end
