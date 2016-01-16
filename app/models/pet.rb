class Pet < ActiveRecord::Base
  belongs_to :user

  validates :name,:race,:age, presence: true 


  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "80x80>" }, default_url: "/images/:style/any.jpg"
  # validates_attachment_presence :avatar
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

end

