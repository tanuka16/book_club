class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy, :library]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  # to create a new book
  def new
    @book = current_user.books.build
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = current_user.books.build(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # add and remove books from/to library for current user

  def library
    # parameter call type
    type = param[:type]
    if type == "add"
      current_user.library_additions << @book
      redirect_to library_index_path notice: "#{@book.title} was added to your library"

    elsif type == "remove"
      current_user.library_additions.delete(@book)
      redirect_to root_path, notice: "#{@book.title} removed from your library"
    else
      # type  is missing nothing should happen
      redirect_to book_path(@book), notice: "Looks like nothing happened. Try again!"
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:tittle, :description, :author, :user_id)
    end
end
