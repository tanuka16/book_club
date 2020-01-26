class LibraryController < ApplicationController
  before_action :authenticate_user!

# go through the library model through user
  def index
    @library_books = current_user.library_additions
  end
end
