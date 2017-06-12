class Car < ApplicationRecord
  # Validations
  validates_presence_of :make, :model, :year, :mileage, :price,
                        :interior_color, :exterior_color

 # Callbacks
  # Instance Methods
  def info
    "#{make} #{model} has an exterior color of: #{exterior_color}"
  end

 def old?
    mileage >= 150000 ? true : false
  end

 def expensive?
    price > 30000
  end
  # Class Methods - scopes
  def self.by_highest_price
    order(price: :desc)
  end

 def self.by_mileage(lowest = true)
    lowest ? order(:mileage) : order(mileage: :desc)
  end

 def self.by_year
    order(:year)
  end
  # Associations
  # Serialize - allows us to save a Hash or Array to a column
  serialize :upgrades, Array
end
