class Company < ApplicationRecord
  # アソシエーションの設定
  belongs_to :user

  # 値が空になるのを防ぐ
  with_options presence: true do
    validates :name
    validates :address
  end
end
