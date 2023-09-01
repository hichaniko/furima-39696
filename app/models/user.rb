class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true

  with_options presence: true do       ###バリテーション
    # ひらがな、カタカナ、漢字のみ許可する
    validates :name_last_name, :name_first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
    # カタカナのみ許可する
    validates :name_last_name_kana, :name_first_name_kana, format: {with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters."}

    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with:  VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります'
    #　英数字混合必須
   
    validates :birthday, presence: true
  end

end
