class Vehicle < ApplicationRecord
  belongs_to :person
  has_many :drives
end
