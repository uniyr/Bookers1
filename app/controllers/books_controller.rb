class BooksController < ApplicationController
  def top
  end
  
  def index
    @books = Book.all
    @book = Book.new  #合ってないかも　合ってた
  end

  def create
    @book = Book.new(book_params)
    
    if @book.save 
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @books = Book.all 
      render "index"  #render :editは？
    end
  end
  
  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    # newアクションの定義と、new.html.erb いらない？
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update #@book と book の違いは？動作同じ
    @book = Book.find(params[:id])
    
    
    if @book.update(book_params) 
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      render :edit  
    end
  end
  
  # def update　　　　#元のコード
  #   book = Book.find(params[:id])
  #   book.update(book_params)
    
  #   flash[:notice] = "Book was successfully updated."
  #   redirect_to book_path(book.id)  
  # end
  

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
    
end
