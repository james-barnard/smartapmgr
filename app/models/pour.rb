class Pour < ApplicationRecord
  has_many :ticks
  belongs_to :load
  TICKS_PER_OZ = 153

  def started_at
    first_tick = ticks.select(:reported_at).order(reported_at: :asc).first
    first_tick && first_tick.reported_at
  end

  def ended_at
    last_tick = ticks.select(:reported_at).order(reported_at: :desc).first
    last_tick && last_tick.reported_at
  end

  def ounce_fractions
    ticks.select(:count).inject(0) { |sum, t| sum + t.count * 100 / ticks_per_ounce }
  end

  def ounces
    ounce_fractions / 100.0
  end

  def ticks_per_ounce
    calibration = load.machine.calibration_for_meter(load.meter_number)
    (calibration && calibration.constant) || TICKS_PER_OZ
  end
end
