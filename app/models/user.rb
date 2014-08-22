class User < ActiveRecord::Base

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email

  has_many :updates
  has_many :waits
  has_many :goals

end