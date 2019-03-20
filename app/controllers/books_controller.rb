class BooksController < ApplicationController
  def index
    @books = Book.all
  end
    
  def show    
    id = params[:id]    
    @book = Book.find(id)
  end

  def new
    @title = 'Insert New Book'
    @book = Book.new
  end
  
  def create
    # seperti DD() di laravel    
    # render plain: params.inspect
    
    # seperti ini di blok
    # @book = Book.new(params[:book])

    @book = Book.new(book_params)
    # @book.save
    # render plain: "Berhasil menyimpan"
    if @book.save
      flash[:success] = "Object successfully created"
      redirect_to @book
    else  
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def edit
    id = params[:id]    
    @book = Book.find(id)
  end

  def update
    @book = Book.find(params[:id])
      if @book.update_attributes(book_params)
        flash[:success] = "Object was successfully updated"
        redirect_to @book
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to books_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to books_url
    end
  end

  def active

    @books = Book.where(status: 1)
    render 'index'
  end
  
  def toggle
    @book = Book.find(params[:id])
    @book.status = 0
    @book.save
    redirect_to books_url
  end
  
  
  

  private
  def book_params
    params.require(:book).permit(:title, :page, :description)
  end
  
    
end
