class SalespersonsController < ApplicationController

  def index
    @salespersons = Salesperson.all

  end

  def show
    
  end

  def new
    @salesperson= Salesperson.new

  end

  def create 
    byebug
    @salespersons= Salesperson.new(salespersons_params)
    if @salespersons.save
      flash[:notice] = "Item was successfully created"
      redirect_to root_path
    else
      flash[:notice] = "There was an error"
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def salespersosn_params
    params.require(:salesperson).permit(:firstName, :lastName, :salesNumber)
  end
  
end