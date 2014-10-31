class Tweet < ActiveRecord::Base

  belongs_to :user

  validates :tweet, presence: true
  validates_length_of :tweet, minumum: 1, maximum: 140

end
