class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable,  :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,# :lockable,
         :recoverable, :rememberable, :validatable

  belongs_to :role
  has_many :mobiles

  validates_presence_of :role


  def active_for_authentication?
    super && active?
  end
end
