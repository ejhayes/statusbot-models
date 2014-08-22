class Wait < ActiveRecord::Base

  validates_presence_of :description
  validates_presence_of :user

  belongs_to :user
  has_many :pings

end