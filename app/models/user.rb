class User < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :password

  def self.authenticate(email, password)
    existing_user = find_by(email: email)
    if existing_user && (existing_user.password == password)
        existing_user
    else
      return nil
    end
  end

end
