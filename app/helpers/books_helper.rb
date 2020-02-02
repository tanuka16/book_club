module BooksHelper

  # check if user added a book to the library
  def user_add_to_library? user, book
    user.libraries.where(user: user, book: book).any?
  end
end
