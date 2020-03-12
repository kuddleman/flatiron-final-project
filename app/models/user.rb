class User < ApplicationRecord
  validates :first_name, :last_name, presence: true
  validates :email, 
    presence: true, 
    uniqueness: { case_sensitive: false },
    format: { 
      with: /\A[A-Z0-9#-_~!$&'()*+,;=:.]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i 
    }

  has_secure_password

  before_save :downcase_email

  private

  def downcase_email
    self.email.downcase!
  end
end
