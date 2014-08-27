class CatRentalRequestsController < ApplicationController
  
  def new
    @cat_rental_request = CatRentalRequest.new
    render :new
  end
  
  def create
    @cat_rental_request = CatRentalRequest.new(cat_rental_request_params)
    @cat_rental_request.status ||= "PENDING"
    p 'this is cat rental request'
    p @cat_rental_request
    puts puts
    if @cat_rental_request.save
      #redirect to cat requests if valid
      redirect_to cat_url(@cat_rental_request.cat_id)
    else
      #redirect if not valid
      render :new
    end
  end
  
  def cat_rental_request_params
    cat_rental_request_attrs = [:id, :cat_id, :start_date, :end_date, :status]
    params.require(:cat_rental_request).permit(*cat_rental_request_attrs)
  end

end
