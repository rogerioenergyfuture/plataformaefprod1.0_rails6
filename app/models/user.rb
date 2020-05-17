class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,:trackable,
         :recoverable, :rememberable, :validatable
         
  attr_accessor :liberar
  enum typeclasse: [ :'User_Normal',:'UserStartup']

  
  validates :email, uniqueness: {message: "já cadastrado" }
  validates_presence_of :email

end
