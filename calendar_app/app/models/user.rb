class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable
<<<<<<< HEAD
  validates :fname, presence: true, format: {with: /\A[a-zA-Z]+\z/, message: "Firstname can only be letter"}
  has_many :events
=======
  validates :fname, presence: true, format: {with: /\A[a-zA-Z]+\z/, message: "Firstname can only be letter"}
>>>>>>> d99fca787a0ef4c4fe73e427baee835246b88349
  has_many :comprises
  has_many :administrates
  has_many :groups, through: :comprises
  has_many :lead_groups, through: :administrates, source: :groups

end
