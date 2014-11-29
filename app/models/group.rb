class Group < ActiveRecord::Base
  belongs_to :who_created
  belongs_to :who_updated
  belongs_to :based_in
end
