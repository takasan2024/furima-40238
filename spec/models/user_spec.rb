require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nicknameを入力してください")
    end
    
    it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end

    it '重複したemailが存在する場合は登録できない' do
      @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('First name全角文字を使用してください')
    end

    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールは不正な値です')
    end

    it "passwordが空では登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end

    it 'passwordが5文字以下では登録できない' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
    end

    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end

    it 'お名前(全角)は、名字が必須である' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last nameを入力してください")
    end

    it 'お名前(全角)は、名前が必須である' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First nameを入力してください")
    end

    it 'お名字(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.last_name = 'ぁ-んァ-ヶ一-龥々ー'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name全角文字を使用してください")
    end

    it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.first_name = 'ぁ-んァ-ヶ一-龥々ー'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name全角文字を使用してください")
    end

    it 'お名字(カナ)は、名前が必須である' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name全角文字を使用してください")
    end

    it 'お名前(カナ)は、名前が必須である' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanaを入力してください")
    end

    it 'お名字(カナ)は、全角（カタカナ）での入力が必須であること' do
      @user.last_name_kana = 'ァ-ヶ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name全角文字を使用してください")
    end

    it 'お名前(カナ)は、全角（カタカナ）での入力が必須であること' do
      @user.first_name_kana = 'ァ-ヶ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana全角文字を使用してください")
    end

    it '生年月日が必須である' do
      @user.date_of_birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Date of birthを入力してください")
    end

  end
end
