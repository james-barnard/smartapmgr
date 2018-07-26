class Machine < ApplicationRecord
  belongs_to :owner
  has_many :placements
  has_many :locations, :through => :placements
  has_many :loads
  has_many :ticks
  has_many :calibrations
  validates :serial_number, :presence => true
  MIN_SEC_BETWEEN_POURS = 5

  class MachineNewPourFailed < StandardError
  end

  def calibration_for_meter(meter_number)
    calibrations.select(:constant).where(meter_number: meter_number).first
  end

  def current_placement
    placements.where(removed_at: nil).order(placed_at: :desc).first
  end

  def last_location
    return nil if current_placement.nil?
    current_placement.location
  end

  def last_location_name
    return nil if last_location.nil?
    last_location.display_name
  end

  def ounces_remaining
    loads.inject(0) { |sum, load| sum + load.ounces_remaining }
  end

  def current_loads
    loads.where(removed_at: nil).order(loaded_at: :desc)
  end

  def last_loaded
    return nil if current_loads.empty?
    current_loads.first.loaded_at
  end

  def last_pour(meter)
    load = loads.where(meter_number: meter).first
    load && load.pours.order(created_at: :desc).first
  end

  def current_pour(meter)
    pour = last_pour(meter)

    pour if pour && pour.ended_at && (Time.now - pour.ended_at < MIN_SEC_BETWEEN_POURS)
  end

  def pour(meter)
    current_pour(meter) || new_pour(meter)
  end

  def new_pour(meter)
    load = current_loads.where(meter_number: meter).first
    load && load.pours.create
  #rescue
  #  raise MachineNewPourFailed
  end

  def record_tick(meter, count)
    poor = pour(meter)
    if poor.nil?
      puts "record_tick with NO pour (#{meter}, #{count})"
    else
      puts "record_tick with pour (#{meter}, #{count}) pour: #{poor.id}"
      ticks.create reported_at: Time.now, meter_number: meter, count: count, pour: poor
    end
  end
end
