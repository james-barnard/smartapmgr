class Load < ApplicationRecord
  belongs_to :machine
  belongs_to :product
  has_many :pours

  def product_name
    product.name
  end

  def total_poured
    (pours.inject(0) { |sum, p| sum + p.ounce_fractions } / 100.0).round 1
  end

  def ounces_remaining
    ounces.to_i - total_poured
  end
end
