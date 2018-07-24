class Location < ApplicationRecord
  belongs_to :owner
  has_many :placements
  has_many :machines, through: :placements

  def display_name
    "#{address1}, #{city}"
  end
end
