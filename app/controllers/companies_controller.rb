class CompaniesController < ApplicationController
  def index
    @companies_users = Company.includes(:user)
  end

  def new
    @company_user = CompanyUser.new
  end

  def create
    @company_user = CompanyUser.create(company_user_params)
    @company_user.save
    redirect_to root_path
  end

  private

  def company_user_params
    params.require(:company_user).permit(:name, :address, :user_name, :email, :password_digest)
  end
end
