class Post < ActiveRecord::Base
  belongs_to :user

validates :title,
  presence: true,
  length: { in: 10..100 }

validates :link,
  presence: true,
  url: true
end
