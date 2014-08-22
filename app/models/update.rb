class Update < ActiveRecord::Base

  validates_presence_of :description
  validates_presence_of :user
  validates_presence_of :start_time

  belongs_to :user
  
  validate :stop_time_after_start_time

  private

  def stop_time_after_start_time
    unless stop_time.nil? || start_time.nil?
      errors.add :stop_time, "stop_time must be after start_time" if stop_time < start_time
    end
  end
end