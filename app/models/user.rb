class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 with_options presence: true do      
  validates :nickname, presence: true
  validates :birthday, presence: true
 end

  with_options presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."} do
    # ひらがな、カタカナ、漢字のみ許可する
    validates :name_last_name
    validates :name_first_name
  end

  with_options presence: true, format: {with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters."} do
    # カタカナのみ許可する
    validates :name_last_name_kana
    validates :name_first_name_kana
  end


    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with:  VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります'
    #　英数字混合必須
    
end
