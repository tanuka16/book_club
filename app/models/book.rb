class Book < ApplicationRecord
  # used active storage to add thumbnail
  has_one_attached :thumbnail
  belongs_to :user
  # book has many libraries (rename this to added_books)
  has_many :libraries
  # going through the libraries model, calling it has_many added_books on the book model and its the source of a user
  has_many :added_books, through: :libraries, source: :user
  # many books and many users associate to each other through of libraries
end
