# Author: RH
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

  validates :fname, presence: true, format: {with: /\A[a-zA-Z]+\z/, message: "Firstname can only be letter"}
  has_many :events
  has_many :calendars
  has_many :comprises
  has_many :administrates
  has_many :groups, through: :comprises
  has_many :lead_groups, through: :administrates, source: :groups
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
