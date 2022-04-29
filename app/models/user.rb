class User < ApplicationRecord
  # アソシエーションの設定
  has_one :company
  # パスワードをハッシュ化
  
  # 値が空になるのを防ぐ
  with_options presence: true do
    validates :name
    validates :email
    validates :password_digest
  end
end
