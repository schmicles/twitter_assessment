class User < ActiveRecord::Base
  has_many :tweets

  validates :username, null: false
end
