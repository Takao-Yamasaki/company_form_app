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

  # ２つのモデルを介して保存処理
  def save
    # Companyを保存
    company = Company.create(name: name, address: address)
    # Userを保存
    User.create(user_name: user_name, email: email, password_digest: password_digest, company_id: company.id)
  end
end