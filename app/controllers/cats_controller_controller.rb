class CatsControllerController < ApplicationController
  
  def index
    render :index
  end
  
  def show
    render :show
  end
  
  private
  def cat_params
    cat_attrs = [:name, :age, :sex, :birth_date, :description, :color]
    params.require(:cat).permit(*cat_attrs)
  end
end
