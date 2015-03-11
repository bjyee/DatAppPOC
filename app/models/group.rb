class Group < ActiveRecord::Base
  belongs_to :user, foreign_key: "who_created_id"
  belongs_to :user, foreign_key: "who_updated_id"
  belongs_to :based_in


end
