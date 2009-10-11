class PositionsController < ApplicationController
  before_filter :find_position, :except => [:new, :create]
  before_filter :find_bill, :only => [:new,:create]
  before_filter :enforce_position_lock
  
  def new
    @position = Position.new
  end
  
  def create
    @position = Position.new(params[:position])
    # TODO: add error-display for ajax positions
    if @bill.positions << @position
      flash[:notice] = "Position successfully created."
      respond_to do |format|
        format.html { redirect_to_bill "Position successfully created" }
        format.js
      end
    else
      render :action => 'new'
    end
  end
  
  def edit
  end

  def update
    if @position.update_attributes(params[:position])
      redirect_to_bill 'Position successfully updated.'
    else
      render :action => 'update'
    end
  end

  def destroy
    @position.destroy
    redirect_to_bill 'Position successfully deleted.'
  end
  
  private

  def find_bill
    @bill = Bill.find_by_id(params[:bill_id])
  end
  
  def choose_bill
    # TODO: find a better way to do this
    if @position == nil
      return @bill
    else
      return @position.bill
    end

  end
  
  def find_position
      @position = Position.find_by_id(params[:id])
  end
  
  def get_bill
    if @position == nil
      return @bill
    else
      return @position.bill
    end
  end
  
  def enforce_position_lock
    redirect_to_bill 'Positions cannot be altered after bill has been billed!' if get_bill.state > 0
  end
  
  def redirect_to_bill(notice)
    flash[:notice] = notice
    redirect_to :controller => "bills",
        :action => "show", :id => choose_bill.id
  end
end
