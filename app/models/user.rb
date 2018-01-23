class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum gender: {男性: 1, 女性: 2}

  has_many :interviews

  def age
  (Date.today.strftime("%Y%m%d").to_i - birth.strftime("%Y%m%d").to_i) / 10000
end
end
