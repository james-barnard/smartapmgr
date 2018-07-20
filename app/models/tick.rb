class Tick < ApplicationRecord
  belongs_to :machine
  belongs_to :pour
end
