require 'rails_helper'

RSpec.describe BuyerAddressInformation, type: :model do
  before do
    user = FactoryBot.create(:user)
    @buyer_address_information = FactoryBot.build(:buyer_address_information, user_id: user.id)
  end
  describe '購入情報の保存' do

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buyer_address_information).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @buyer_address_information.building_name = ''
        expect(@buyer_address_information).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @buyer_address_information.post_code = ''
        @buyer_address_information.valid?
        expect(@buyer_address_information.errors.full_messages).to include("Post codeを入力してください",)
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @buyer_address_information.post_code = '1234567'
        @buyer_address_information.valid?
        expect(@buyer_address_information.errors.full_messages).to include("Post codeis invalid. Include hyphen(-)")
      end
      it 'shopping_area_idを選択していないと保存できないこと' do
        @buyer_address_information.shopping_area_id = 1
        @buyer_address_information.valid?
        expect(@buyer_address_information.errors.full_messages).to include()
      end
      it 'municipalitiesが空だと保存できないこと' do
        @buyer_address_information.municipalities = nil
        @buyer_address_information.valid?
        expect(@buyer_address_information.errors.full_messages).to include("Municipalitiesを入力してください")
      end
      it 'street_addressが空だと保存できないこと' do
        @buyer_address_information.street_address = nil
        @buyer_address_information.valid?
        expect(@buyer_address_information.errors.full_messages).to include("Street addressを入力してください")
      end
      it 'telephone_numberが空だと保存できないこと' do
        @buyer_address_information.telephone_number = nil
        @buyer_address_information.valid?
        expect(@buyer_address_information.errors.full_messages).to include("Telephone numberを入力してください")
      end
      it 'userが紐付いていないと保存できないこと' do
        @buyer_address_information.user_id = nil
        @buyer_address_information.valid?
        expect(@buyer_address_information.errors.full_messages).to include("Userを入力してください")
      end
      it "tokenが空では登録できないこと" do
        @buyer_address_information.token = nil
        @buyer_address_information.valid?
        expect(@buyer_address_information.errors.full_messages).to include("Tokenを入力してください")
      end
    end
  end
end
