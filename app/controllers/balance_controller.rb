class BalanceController < ApplicationController
  before_filter :require_user
  before_filter :find_user, :except => :index
  before_filter :find_company, :except => :index

  def index
    redirect_to balance_path(:year => Time.now.year)
  end

  def sheet
    @year = params[:year]
    if @company.billed_date_relevant
      @bills = Bill.billed_bills :year => @year
      @expenditure_types = ExpenditureType.find(:all, :include => :expenditures)
      @expenditures = Expenditure.billed :year => @year
    else
      @bills = Bill.paid_bills :year => @year
      @expenditure_types = ExpenditureType.find(:all)
      @expenditures = Expenditure.paid :year => @year
    end
  end

  def show
    @year = params[:year].to_i
    @month = params[:month].to_i
    
    if @company.billed_date_relevant
      @bills = Bill.closed_bills :year => @year, :month => @month
      @expenditures = Expenditure.billed :year => @year, :month => @month
    else
      @bills = Bill.paid_bills :year => @year, :month => @month
      @expenditures = Expenditure.paid :year => @year, :month => @month
    end
  end

  private

  def find_company
    @company = @user.company
  end

  def find_user
    @user = current_user
  end
end
