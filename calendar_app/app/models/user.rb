class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :omniauthable
  devise :confirmable, :lockable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable
end
