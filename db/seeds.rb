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


Cat.create!(name: "Mr. Freckles", age: 1, birth_date: "Jan 1", color: :black, sex: "M")
Cat.create!(name: "Mrs. Freckles", age: 2, birth_date: "Jan 1", color: :white, sex: "F")
Cat.create!(name: "Muffin", age: 3, birth_date: "Aug 1", color: :grey, sex: "M")
Cat.create!(name: "Peach", age: 43, birth_date: "Jul 1", color: :orange, sex: "F")