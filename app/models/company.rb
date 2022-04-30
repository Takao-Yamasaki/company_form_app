class Company < ApplicationRecord
  # アソシエーションの設定
  belongs_to :user
end
