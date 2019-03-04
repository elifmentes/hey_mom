class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :tasks

  validates :username, presence: true, uniqueness: true, length: { minimum: 4 }
  validates :gender, presence: true, default: false
  validates :location, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
