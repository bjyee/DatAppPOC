class SuggestedEvent < ActiveRecord::Base
  belongs_to :location
  belongs_to :category
end
