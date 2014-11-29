class Event < ActiveRecord::Base
  belongs_to :group
  belongs_to :user, foreign_key: "who_created"
  belongs_to :user, foreign_key: "who_updated"
end
