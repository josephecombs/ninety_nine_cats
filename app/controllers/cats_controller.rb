class CatsController < ApplicationController
  
  def index
    @cats = Cat.all
    #find all cats
    render :index
  end
  
  def show
    @cat = Cat.find(params[:id])
    #find specific cat
    render :show
  end
  
  def new
    @cat = Cat.new
     # @cat = Cat.new(name: "", age: 0, sex: "M", color: :orange)
     render :new
  end
  
  def create
    
    # ...
  end
  
  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end
  
  def update 
    
    # ...
  end
  
  
  private
  
  def cat_params
    cat_attrs = [:id, :name, :age, :sex, :birth_date, :description, :color]
    params.require(:cat).permit(*cat_attrs)
    #params.require(:cat).permit(:id, :name, :age)
  end
end
