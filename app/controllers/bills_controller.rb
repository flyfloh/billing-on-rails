class BillsController < ApplicationController
  before_filter :find_bill, :except => [:index, :new, :create]

  def index
    if params[:search].blank?
      @bills = Bill.find(:all, :conditions => "state != 10").group_by { |b| b.state }
    else
      @bills = Bill.find(:all, :conditions => ["title LIKE ? AND state != 10", '%' + params[:search] + '%']).group_by { |b| b.state }
    end
  end

  def show
    @company = Company.instance
  end
  
  def new
    @bill = Bill.new
  end
  
  def create
    @bill = Bill.new(params[:bill])
    @bill.state = 0
    if @bill.save
      flash[:notice] = 'Bill successfully created.'
      redirect_to :action => "show", :id => @bill.id
    else
      render :action =>"new"
    end
  end
  
  def close
    @bill.state = @bill.state + 1
    # set billed_date if bill is being marked as billed
    @bill.billed_date = Date.today if @bill.state == 1
    @bill.state = @bill.state + 1 if @bill.state == 2
    #set paid date if bill is being marked as paid
    @bill.paid_date = Date.today if @bill.state == 3

    if @bill.save
      flash[:notice] = 'Bill successfully closed.'
    else
      flash[:notice] = 'There was an error saving the bill!'
    end
    redirect_to :action => "show", :id => @bill.id
  end
  
  def edit
  end

  def update
    if @bill.update_attributes(params[:bill])
      flash[:notice] = 'Bill successfully updated.'
      redirect_to :action => "show", :id => params[:id]
    else
      render :action => "edit"
    end
  end

  def destroy
    if @bill.update_attribute(:state, 10)
      flash[:notice] = 'Bill successfully destroyed.'
    else
      flash[:notice] = 'There was an error destroying the Bill!'
    end
    redirect_to :action => "index"
  end
  
  private
  
  def find_bill
    @bill = Bill.find_by_id(params[:id])
  end
  
end
