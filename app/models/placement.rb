class Placement < ApplicationRecord
  belongs_to :location
  belongs_to :machine
end
