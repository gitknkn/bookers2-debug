class PostCommentsController < ApplicationController

def create
  book = Book.find(params[:book_id])
  comment = PostComment.new(post_comment_params)
  comment.user_id = current_user.id
  comment.book_id = book.id
  comment.save
  redirect_to book_path(book)
end

def destroy
  comment = PostComment.find(params[:id])
  if comment.user == current_user
    comment.destroy
    redirect_back(fallback_location: books_path)
  else
    redirect_to books_path
  end
end

private
  def post_comment_params
    params.require(:post_comment).permit(:comment, :user_id, :book_id)
  end
end
