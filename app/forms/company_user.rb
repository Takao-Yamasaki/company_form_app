class CompanyUser
  # 擬似モデルにする
  include ActiveModel::Model
  include ActiveRecord::AttributeAssignment

  # 参照更新をかける値を設定
  attr_accessor :company_name, :address, :user_name, :email, :password, :password_confirmation

  with_options presence: true do
    # Companyモデルのバリデーション
    validates :company_name
    validates :address
    # Userモデルのバリデーション
    validates :user_name
    validates :email
    validates :password_digest
  end

  # ２つのモデルを介して保存処理
  def save
    # ActiveRecord::Base.transaction do
      # Companyを保存
      company = Company.create(company_name: company_name, address: address)
      # Userを保存
      User.create(user_name: user_name, email: email, password_digest: password, company_id: company.id)
    # end
    # true
  end
end