class CompaniesController < ApplicationController
  before_filter :require_user
  before_filter :find_user
  before_filter :get_company

  def show
    @company = @user.company
  end

  def edit
  end
  
  def update
    if @company.update_attributes(params[:company])
      flash[:notice] = "Company was updated successfully."
      redirect_to :action => 'edit'
    else
      render :action => 'edit'
    end
  end
  
  private
  
  def get_company
    @company = @user.company
  end

  def find_user
    @user = current_user
  end
  
end
