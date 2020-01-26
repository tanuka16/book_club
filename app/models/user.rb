class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
# user has many books; if the user destroys make sure that doesn't matter really
  has_many :books, dependent: :destroy
  has_many :libraries
  has_many :library_additions, through: :libraries, source: :book           # has many library_additions (libraries) through libraries,
  # tie into books and libraries through user model, its soucing a book

# add a quick helper that determines if a user subscribed, which checks the stripe subscription id, if there is that means they're subscribed
  def subscribed?
    stripe_subscription_id?
  end

end
