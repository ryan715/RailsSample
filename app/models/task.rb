class Task < ActiveRecord::Base
  belongs_to :project
  
  validates :name, presence: true
  validates :description, presence: true
  
  # before_save :default_values
  
  def default_values
    self.done ||= false
  end

end
