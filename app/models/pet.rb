class Pet < ActiveRecord::Base
  belongs_to :user

  validates :name,:race,:age, presence: true 

end
