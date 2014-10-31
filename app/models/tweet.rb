class Tweet < ActiveRecord::Base

  belongs_to :user

  validates :content, null: false
  validates_length_of :content, minumum => 1, maximum => 140

end
