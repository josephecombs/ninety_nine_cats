class CatRentalRequestsController < ApplicationController
  before_action :is_owner?, only: [:approve, :deny]
  
  def new
    @cat_rental_request = CatRentalRequest.new
    render :new
  end
  
  def create
    @cat_rental_request = CatRentalRequest.new(cat_rental_request_params)
    @cat_rental_request.status ||= "PENDING"
    @cat_rental_request.user_id = current_user.id
    if @cat_rental_request.save
      #redirect to cat requests if valid
      redirect_to cat_url(@cat_rental_request.cat_id)
    else
      #redirect if not valid
      render :new
    end
  end
  
  def approve
    @cat_rental_request = CatRentalRequest.find(params[:id])
    @cat_rental_request.approve!
    redirect_to cat_url(CatRentalRequest.find(params[:id]).cat_id)
  end
  
  def deny
    @cat_rental_request = CatRentalRequest.find(params[:id])
    @cat_rental_request.deny!
    redirect_to cat_url(CatRentalRequest.find(params[:id]).cat_id)
  end
  
  def is_owner?
    temp = CatRentalRequest.find(params[:id])
    redirect_to root_url unless temp.cat.owner.id == current_user.id
  end
  
  private
  def cat_rental_request_params
    cat_rental_request_attrs = [:id, :cat_id, :start_date, :end_date, :status, :user_id]
    params.require(:cat_rental_request).permit(*cat_rental_request_attrs)
  end

end
