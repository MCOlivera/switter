class Comment < ActiveRecord::Base
  belongs_to :swit
  belongs_to :user
end
