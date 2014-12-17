class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable
  has_many :authorizations, dependent: :destroy
  has_many :shares, foreign_key: 'from_user_id'

  before_save :ensure_authentication_token
end
