# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  age         :integer          not null
#  birth_date  :date
#  color       :string(255)      not null
#  sex         :string(255)      not null
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Cat < ActiveRecord::Base
  CAT_COLORS = ["orange", "black", "white", "grey"]
  SEXES = ['M', 'F']
  
  validates :age, numericality: true
  validates :color, inclusion: { in: CAT_COLORS,
      message: "%{value} is not in #{CAT_COLORS}" }
  validates :sex, inclusion: { in: SEXES, message: "%{value} not valid" }
  validates :age, :color, :sex, :name, presence: true
  
  belongs_to(
  :owner,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: 'User'
  )  
  
  has_many(
  :rental_requests,
  class_name: 'CatRentalRequest',
  dependent: :destroy
  )
end
