class Group < ActiveRecord::Base
  belongs_to :user, foreign_key: "who_created"
  belongs_to :user, foreign_key: "who_updated"
  belongs_to :based_in


end
