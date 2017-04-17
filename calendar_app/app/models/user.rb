class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable
  validates :fname, presence: true
  has_many :comprises
  has_many :administrates
  has_many :groups, through: :comprises
  has_many :lead_groups, through: :administrates, source: :groups

end
