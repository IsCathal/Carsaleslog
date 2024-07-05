class SalesController < ApplicationController
  before_action :require_salesperon, only: [:create, :index, :new]


  def index
    @sales = Sale.all

  end

  def show
    
  end

  def new
    @sale = Sale.new

  end

  def create
    byebug
    @sale= Sale.new(sale_params)
    if @sale.save
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
  
  def sale_params
    params.require(:sale).permit(:carModel, :salesDate, :fuelType, :salesperson_id)
  end

  def require_salesperon
    @salespersons = Salesperson.all
  end

end