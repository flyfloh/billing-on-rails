class CompanyLogosController < ApplicationController

  def new
    @company_logo = CompanyLogo.new
  end
  
  def show
    @company_logo = CompanyLogo.find params[:id]
    send_data @company_logo.data, :type => @company_logo.content_type, :disposition => "inline"
  end

  def create
    @company_logo = CompanyLogo.new(params[:image])
    @company_logo.company = @user.company
    if @company_logo.save
      flash[:notice] = "Your Logo has been added successfully"
      redirect_to @user.company
    else
      render :action => "new"
    end
  end

  def destroy
    raise "not implemented yet!"
  end
  
end
