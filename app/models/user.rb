class User < ApplicationRecord
  has_many :calendars, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:twitter], :authentication_keys => [:uid, :username]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.username = auth.info.nickname
        user.email = ""
        user.password = Devise.friendly_token[0,20]
      end
  end

  def has_email?
    self.email != ""
  end
end
