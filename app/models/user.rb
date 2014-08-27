require 'securerandom'
class User < ActiveRecord::Base
  validates :user_name, :password_digest, presence: true
  # validates :session_token

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save!
    self.session_token
  end
  
  def password=(password)
    return unless password.present?
    
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
  
  def is_password?(password)
    # self.password_digest == BCrypt::Password.create(password)

    # allegedly correct:
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
  
  def self.find_by_credentials(username, password)
    user = User.find_by(user_name: username)

    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end
end