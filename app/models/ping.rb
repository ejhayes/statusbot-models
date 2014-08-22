class Ping < ActiveRecord::Base

  validates_presence_of :description
  validates_presence_of :wait

  belongs_to :wait

end