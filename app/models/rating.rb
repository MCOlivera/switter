class Rating < ActiveRecord::Base
  belongs_to :swit
  belongs_to :user
end
