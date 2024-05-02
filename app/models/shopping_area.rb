class ShoppingArea < ActiveHash::Base
  self.data = [
    { id: 1, shopping_area: '---' }, { id: 2, shopping_area: '北海道' }, { id: 3, shopping_area: '青森県' },
    { id: 4, shopping_area: '岩手県' }, { id: 5, shopping_area: '宮城県' }, { id: 6, shopping_area: '秋田県' },
    { id: 7, shopping_area: '山形県' }, { id: 8, shopping_area: '福島県' }, { id: 9, shopping_area: '茨城県' },
    { id: 10, shopping_area: '栃木県' }, { id: 11, shopping_area: '群馬県' }, { id: 12, shopping_area: '埼玉県' },
    { id: 13, shopping_area: '千葉県' }, { id: 14, shopping_area: '東京都' }, { id: 15, shopping_area: '神奈川県' },
    { id: 16, shopping_area: '新潟県' }, { id: 17, shopping_area: '富山県' }, { id: 18, shopping_area: '石川県' },
    { id: 19, shopping_area: '福井県' }, { id: 20, shopping_area: '山梨県' }, { id: 21, shopping_area: '長野県' },
    { id: 22, shopping_area: '岐阜県' }, { id: 23, shopping_area: '静岡県' }, { id: 24, shopping_area: '愛知県' },
    { id: 25, shopping_area: '三重県' }, { id: 26, shopping_area: '滋賀県' }, { id: 27, shopping_area: '京都府' },
    { id: 28, shopping_area: '大阪府' }, { id: 29, shopping_area: '兵庫県' }, { id: 30, shopping_area: '奈良県' },
    { id: 31, shopping_area: '和歌山県' }, { id: 32, shopping_area: '鳥取県' }, { id: 33, shopping_area: '島根県' },
    { id: 34, shopping_area: '岡山県' }, { id: 35, shopping_area: '広島県' }, { id: 36, shopping_area: '山口県' },
    { id: 37, shopping_area: '徳島県' }, { id: 38, shopping_area: '香川県' }, { id: 39, shopping_area: '愛媛県' },
    { id: 40, shopping_area: '高知県' }, { id: 41, shopping_area: '福岡県' }, { id: 42, shopping_area: '佐賀県' },
    { id: 43, shopping_area: '長崎県' }, { id: 44, shopping_area: '熊本県' }, { id: 45, shopping_area: '大分県' },
    { id: 46, shopping_area: '宮崎県' }, { id: 47, shopping_area: '鹿児島県' }, { id: 48, shopping_area: '沖縄県' }
  ]
  include ActiveHash::Associations
  has_many :items
  
  end