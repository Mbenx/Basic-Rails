class HomeController < ApplicationController
  layout 'master'
  def index
    # render plain: 'Hello World'
    @langs = ['ruby','on','rails']
    @books = Book.all

    # jika akan menggunakan layout selain yg di define
    render layout:'application'
  end

  def hallo
    @title = params[:title]
  end

  def show
    id = params[:id]
    # without if
    # book = Book.find id

    # use if
    book = Book.find_by id: id
    if book
      @title = book.title
    else
      @title = 'tidak ditemukan'
    end
  end

  def edit
    id = params[:id]
    # without if
    # book = Book.find id

    # use if
    book = Book.find_by id: id
    if book
      @title = book.title
    else
      @title = 'tidak ditemukan'
    end
  end
end