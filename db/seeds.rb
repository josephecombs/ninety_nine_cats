# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Cat.create!(name: "Mr. Freckles", )


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
# ___
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


User.create!(user_name: "kyle", password: "smith")
User.create!(user_name: "joe", password: "combs")




Cat.create!(name: "Mr. Freckles", age: 1, birth_date: "2013-04-13", color: "black", sex: "M", user_id: 1)
Cat.create!(name: "Mrs. Freckles", age: 2, birth_date: "2012-02-19", color: "white", sex: "F", user_id: 1)
Cat.create!(name: "Muffin", age: 3, birth_date: "2011-06-30", color: "grey", sex: "M", user_id: 2)
Cat.create!(name: "Laney", age: 10, birth_date: "2004-03-22", color: "orange", sex: "F", user_id: 2)


CatRentalRequest.create!(cat_id: 1, start_date: "2013-03-22", end_date: "2014-03-22", status: "PENDING", user_id: 1)
CatRentalRequest.create!(cat_id: 2, start_date: "2010-03-22", end_date: "2014-03-22", status: "PENDING", user_id: 1)
CatRentalRequest.create!(cat_id: 3, start_date: "2004-03-22", end_date: "2009-03-22", status: "PENDING", user_id: 1)
CatRentalRequest.create!(cat_id: 2, start_date: "2004-03-22", end_date: "2011-03-22", status: "PENDING", user_id: 2)
CatRentalRequest.create!(cat_id: 1, start_date: "2007-05-11", end_date: "2008-04-01", status: "PENDING", user_id: 2)
CatRentalRequest.create!(cat_id: 1, start_date: "2011-01-03", end_date: "2011-12-02", status: "PENDING", user_id: 2)
CatRentalRequest.create!(cat_id: 4, start_date: "2007-03-22", end_date: "2012-03-22", status: "PENDING", user_id: 2)