class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :hotels, inverse_of: :manager, foreign_key: 'manager_id'
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true, allow_blank: false
  validates :last_name, presence: true, allow_blank: false
end
