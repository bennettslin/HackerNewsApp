class Vote < ActiveRecord::Base
  belongs_to :user
  # add polymorphic: true after generating model
  belongs_to :votable, polymorphic: true
end
