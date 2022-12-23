class Person < ApplicationRecord
  enum type: { Student: 1, Professor: 2 }

  has_many :vehicles
  has_one :address
  has_many :drives
end
