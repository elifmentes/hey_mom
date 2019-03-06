class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :user_tasks
  has_many :tasks, through: :user_tasks
  has_many :transactions

  validates :username, presence: true, uniqueness: true, length: { minimum: 4 }
  validates :gender, inclusion: { in: [true, false] }, default: false
  validates :location, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
