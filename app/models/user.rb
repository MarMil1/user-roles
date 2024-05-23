class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :assign_default_role

  def assign_default_role
    # if the user form does not match Faculty or Admin information
    if admin_user_credentials_valid?
      self.add_role(:admin)
    elsif faculty_user_credentials_valid?
      self.add_role(:faculty)
    else
      self.add_role(:student)
    end
  end

  private

  def admin_user_credentials_valid?
    admin_users_credentials = Rails.application.credentials.admin_users
    admin_users_credentials.each do |admin|
      user_email = admin[:email]
      user_password = admin[:password]

      return true if self.email == user_email && self.valid_password?(user_password)
    end 

    return false
  end

  def faculty_user_credentials_valid?
    faculty_users_credentials = Rails.application.credentials.faculty_users
    faculty_users_credentials.each do |faculty|
      user_email = faculty[:email]
      user_password = faculty[:password]
      
      return true if self.email == user_email && self.valid_password?(user_password)
    end

    return false
  end

end
