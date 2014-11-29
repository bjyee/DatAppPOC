class Event < ActiveRecord::Base
  belongs_to :group_id
  belongs_to :who_created
  belongs_to :who_updated
end
