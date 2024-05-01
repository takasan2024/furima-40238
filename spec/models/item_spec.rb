require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
end
describe '出品機能' do
  context  '出品ができる時' do
    it '全ての値が正しく入力されていれば出品できること' do
      expect(@item).to be_valid
    end
  end

  context  '出品ができない時' do
    it 'imageが空だと出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Imageを入力してください")
    end
    it 'nameが空だと出品できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Nameを入力してください")
    end
    it 'explanationが空だと出品できない' do
      @item.explanation = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanationを入力してください")
    end
    it 'categoryが未選択だと出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Categorycan't be blank")
    end
    it 'situationが未選択だと出品できない' do
      @item.situation_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Situationcan't be blank")
    end
    it 'delivery_chargeが未選択だと出品できない' do
      @item.delivery_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery chargecan't be blank")
    end
    it 'shopping_areaが未選択だと出品できない' do
      @item.shopping_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shopping areacan't be blank")
    end
    it 'number_of_days_until_shoppingが未選択だと出品できない' do
      @item.number_of_days_until_shopping_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Number of days until shoppingcan't be blank")
    end
    it 'priceが空だと出品できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Priceを入力してください")
    end
    it 'priceが全角数字だと出品できない' do
      @item.price = "２０００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Pricecan't be blank")
    end
end
end
end