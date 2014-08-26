# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  age         :integer          not null
#  birth_date  :string(255)
#  color       :string(255)      not null
#  sex         :string(255)      not null
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class CatTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
