class Cat < ActiveRecord::Base
  validates :age, numericality: true
  validates :color, inclusion: { in: cat_colors,
      message: "%{color} is not in %{cat_colors}" }
  validates :sex, inclusion: { in: ["M", "F"], message: "%{sex} not valid" }
  validates :age, :color, :sex, :name, presence: true
  
  private
  def cat_colors
    [:orange, :black, :white, :grey]
  end
end
