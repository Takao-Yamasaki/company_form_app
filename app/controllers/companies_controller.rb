class CompaniesController < ApplicationController
  def index
    @companies = Company.includes(:user)
  end

  def new
    @company = CompanyUser.new
  end

  def create
    @company = CompanyUser.new(company_user_params)
    if @company.save
      redirect_to root_path, notice: '企業情報とユーザー情報を登録しました。'
    else
      flash[:alert] = '企業情報とユーザー情報の登録に失敗しました。'
      render :new
    end
  end

  private

  def company_user_params
    params.require(:company_user).permit(:company_name, :address, :user_name, :email, :password, :password_confirmation)
  end
end
