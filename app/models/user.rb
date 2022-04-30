class User < ApplicationRecord
  # アソシエーションの設定
  has_one :company
  # パスワードをハッシュ化
  has_secure_password
end
