class SalespeopleController < ApplicationController

  def index
    @salespersons = Salesperson.all
  end

  def new
    @salesperson= Salesperson.new
  end

  def create 
    @salesperson= Salesperson.new(salesperson_params)
    if @salesperson.save
      flash[:notice] = "Item was successfully created"
      redirect_to root_path
    else
      flash[:notice] = "There was an error"
      render 'new'
    end
  end

  def salesperson_params
    params.require(:salesperson).permit(:firstName, :lastName, :salesNumber)
  end
  
end