class Load < ApplicationRecord
  after_create  :unload_machine

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

  def days_loaded
    days = (((removed_at || Time.now) - loaded_at) / 1.day).round
  end

  def avg_daily
    days = days_loaded
    days = days > 0 ? days : 1
    total_poured / days
  end

  def avg_size
    count = pours.count
    total_poured / (count > 0 ? count : 1)
  end

  def days_remaining
    daily = avg_daily * avg_size
    ounces_remaining / (daily + 8)
  end

  def unload_machine
    machine.unload(self)
  end
end
