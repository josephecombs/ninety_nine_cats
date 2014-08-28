class CatsController < ApplicationController
  before_action :is_owner?, only: [:update, :edit]
  
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
    @cat = Cat.new(cat_params)
    @cat.user_id = current_user.id
    if @cat.save
      redirect_to cats_url
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :new
    end
  end
  
  def edit
    @cat = Cat.find(params[:id])
    
    render :edit
  end
  
  def update 
    @cat = Cat.find(params[:id])
    cat_params.each_pair do |k, v|
      @cat[k] = v
    end  
    
    if @cat.save
      redirect_to cats_url
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :new
    end
  end
  
  
  
  def is_owner?
    temp = Cat.find(params[:id])
    redirect_to root_url unless temp.owner.id == current_user.id
  end
  private
  def cat_params
    cat_attrs = [:id, :name, :age, :sex, :birth_date, :description, :color, :user_id]
    params.require(:cat).permit(*cat_attrs)
    #params.require(:cat).permit(:id, :name, :age)
  end
end
