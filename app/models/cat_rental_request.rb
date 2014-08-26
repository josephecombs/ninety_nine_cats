class CatRentalRequest < ActiveRecord::Base
  RENTAL_STATUSES = ["APPROVED", "PENDING", "DENIED"]
  
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: RENTAL_STATUSES, message: "not a valid status"}
  
  def overlappign_requests
    # CatRentalRequest.select("")
    # DB.execute()
    
  end
  
  def overlapping_approved_requests
    
    
    
  end
end
