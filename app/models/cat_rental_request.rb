# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class CatRentalRequest < ActiveRecord::Base

  RENTAL_STATUSES = ["APPROVED", "PENDING", "DENIED"]
  
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: RENTAL_STATUSES, message: "not a valid status"}
  validate :outside_approved_requests
  
  def approve!
    status = "APPROVED"
    self.save
  end
  
  belongs_to(:cat)
  
  
  private
  def overlapping_requests
    # CatRentalRequest.select("")
    # select all CatRentalRequests where start_date between start_date and and end_date or end_date between start_date and end_date and cat_id == cat_id
    query = <<-SQL
      cat_id = :cat_id AND
      (
        (:my_start_date BETWEEN start_date AND end_date OR
         :my_end_date BETWEEN start_date AND end_date) OR
        (start_date BETWEEN :my_start_date AND :my_end_date OR
          end_date BETWEEN :my_start_date AND :my_end_date
        )
      )
    SQL
    params = {
      cat_id: self.cat_id,
      my_start_date: self.start_date,
      my_end_date: self.end_date
    }
    CatRentalRequest.where(query, params)
  end
  
  def overlapping_approved_requests
    overlapping_requests.where(status: 'APPROVED')
  end
  
  def outside_approved_requests
    if overlapping_approved_requests.exists?
      errors[:status] << "overlapping approved request"  
    end
  end
end
