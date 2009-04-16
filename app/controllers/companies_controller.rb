class CompaniesController < ApplicationController
  before_filter :get_company
  
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
    @company = Company.instance
  end
end
