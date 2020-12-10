require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "正常に記入すると新規登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "ニックネームが空欄だと登録できない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "メールアドレスが空欄だと登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "すでに同じメールアドレスが存在すると登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "メールアドレスに＠が入っていないと登録できない" do
        @user.email = "aaaaaaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "パスワードが空欄だと登録できない" do
        @user.password = nil
        @user.password_confirmation = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "パスワードが5文字以下だと登録できない" do
        @user.password = 'a1a1a'
        @user.password_confirmation = 'a1a1a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "パスワードが英数混合でないと登録できない" do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Fill in mixed alphanumeric characters.")
      end
      it "パスワードと確認用パスワードが異なると登録できない" do
        @user.password = 'a111111'
        @user.password_confirmation = 'a1a1a1a1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "ユーザー本名の名字が空欄だと登録できない" do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it "ユーザー本名の名字が半角だと登録できない" do
        @user.family_name = "yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid. Input full-width characters.")
      end
      it "ユーザー本名の名前が空欄だと登録できない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "ユーザー本名の名前が半角だと登録できない" do
        @user.first_name = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
      end
      it "ユーザー本名の名字のフリガナが空欄だと登録できない" do
        @user.reading_family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Reading family name can't be blank")
      end
      it "ユーザー本名の名字のフリガナがカタカナ以外だと登録できない" do
        @user.reading_family_name = "やまだ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Reading family name is invalid. Input full-width katakana characters.")
      end
      it "ユーザー本名の名前のフリガナが空欄だと登録できない" do
        @user.reading_first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Reading first name can't be blank")
      end
      it "ユーザー本名の名前のフリガナがカタカナ以外だと登録できない" do
        @user.reading_first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Reading first name is invalid. Input full-width katakana characters.")
      end
      it "生年月日が空欄だと登録できない" do
        @user.birth_day = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end