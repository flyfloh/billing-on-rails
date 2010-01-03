class ExpendituresController < ApplicationController
  before_filter :require_user
  before_filter :find_expenditure, :except => [:index, :new, :create]
  
  def index
    unless params[:search]
      @expenditure_states = Expenditure.find(:all).group_by { |e| e.state }
    else
      @expenditure_states = Expenditure.find(:all, :conditions => ["name LIKE ?", '%' + params[:search] + '%']).group_by { |e| e.state }
    end
  end
  
  def show
  end
  
  def new
    @expenditure = Expenditure.new
  end
  
  def create
    @expenditure = Expenditure.new(params[:expenditure])
    @expenditure.state = 1
    if @expenditure.save
      flash[:notice] = 'Expenditure successully created.'
      redirect_to_expenditure @expenditure
    else
      render :action =>"new"
    end
  end
  
  def edit
  end
  
  def update
    if @expenditure.update_attributes(params[:expenditure])
      flash[:notice] = 'Expenditure successully updated.'
      redirect_to_expenditure(@expenditure)
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @expenditure.destroy
    redirect_to :action => "index"
  end
  
  def paid
    @expenditure.update_attributes(params[:expenditure])
    @expenditure.state = 3
    # TODO: add error-display for ajax positions
    if @expenditure.save
      flash[:notice] = "Expenditure now marked as paid"
      respond_to do |format|
        format.html { redirect_to_expenditure(@expenditure) }
        format.js
      end
    else
      render :action => 'new'
    end
  end
  
  private
  
  def find_expenditure
    @expenditure = Expenditure.find_by_id(params[:id])
  end
  
  def redirect_to_expenditure(expenditure)
    redirect_to :action => "show", :id => expenditure.id
  end
  
end
