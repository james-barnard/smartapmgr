class Owner < ApplicationRecord
  belongs_to :location
  has_many :machines
  has_many :locations

  def installed
    machines.reject { |m| m.current_placement.nil? }
  end
end
