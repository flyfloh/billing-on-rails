class BalanceController < ApplicationController

  def index
    redirect_to(balance_path(:year => Time.now.year))
  end

  def sheet
    @company = Company.instance
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
    @company = Company.instance
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
end
