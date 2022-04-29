class CompanyUser
  # 擬似モデルにする
  include ActiveModel::Model
  # 参照更新をかける値を設定
  attr_accessor :name, :address, :user_name, :email, :password_digest

  with_options presence: true do
    # Companyモデルのバリデーション
    validates :name
    validates :address
    # Userモデルのバリデーション
    validates :user_name
    validates :email
    validates :password_digest
  end
end