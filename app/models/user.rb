class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 
  
         validates :nickname, :date_of_birth,presence: true

         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         with_options presence: true, format: { with: PASSWORD_REGEX, message:'には英字と数字の両方を含めて設定してください' }, length: { minimum: 6 }, confirmation: true do
          validates :password
        end

        with_options presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: '@を含めて入力してください' }, uniqueness: { case_sensitive: false } do
          validates :email
        end
        
         with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
           validates :first_name
           validates :last_name
         end
         with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: '全角(カナ)文字を使用してください' } do
           validates :first_name_kana
           validates :last_name_kana
         end
        
       end