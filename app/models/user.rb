class User < ActiveRecord::Base
  has_secure_password

  has_many :posts
  has_many :comments

  # votes ABOUT this user
  has_many :votes, as: :votable

  # votes cast BY the user
  has_many :ratings, class_name: "Vote"

  validates :name,
  # length: { maximum: 20 },
  presence: true

  validates :email,
    presence: true
    # email_format: { message: "not a valid email address" },
    # uniqueness: { case_sensitive: false }

  validates :password,
    presence: true,
    :on => :create

  def self.authenticate email, password
    User.find_by_email(email).try(:authenticate, password)
  end

    # for mailer
  def set_password_reset
    self.code = SecureRandom.urlsafe_base64
    self.expires_at = 4.hours.from_now
    self.save

  end
end
