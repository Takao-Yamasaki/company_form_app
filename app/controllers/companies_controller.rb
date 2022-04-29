class CompaniesController < ApplicationController
  def index
    @companies = Company.includes(:user)
  end

  def new
    @company = CompanyUser.new
  end

  def create
    @company = CompanyUser.create(company_user_params)
    @company.save
    redirect_to root_path
  end

  private

  def company_user_params
    params.require(:company_user).permit(:name, :address, :user_name, :email, :password_digest)
  end
end
