class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # validates :name, presence: true #elemento no puede estar vacio
  # # validates :body, presence: true #elemento no puede estar vacio

  # validates :email, uniqueness: true # no se puede guardar dos campos email iguales
  # validates :password, length: {minimum: 10} #numero minimo de caracteres
end
