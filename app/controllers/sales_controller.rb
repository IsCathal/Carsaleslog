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
    @sale= Sale.new(sale_params)
 
    temp_salesperson = Salesperson.find(@sale.salesperson_id)
    temp_salesperson.salesNumber += 1
    temp_salesperson.save



    if @sale.save
      flash[:notice] = "Sale was successfully created"
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

  def update_sales_count(sale)
    p sale
    salesperson = Salesperson.find(sale.salesperson_id)
    p salesperson
    salesperson.salesNumber += 1 
    salesperson.save
  end

  def top_seller
    list_of_salespeople = Salesperson.all
    list_of_salespeople.sort_by { |salesperson| -salesperson.salesNumber }
    list_of_salespeople[0]
  end

end