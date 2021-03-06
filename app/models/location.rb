class Location < ActiveRecord::Base

  def self.getLocationId(city, state)
    location = find_by city: city, state: state
    if location
      location.id
    else
      nil
    end
  end

end
