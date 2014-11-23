class AccountsController < ApplicationController
  def show
    @account = Account.find(params[:id])
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    if @account.save
     
    end
  end

  private
    def account_params
      params.require(:account).permit(:name, :access_token, :access_token_secret)
    end
end
