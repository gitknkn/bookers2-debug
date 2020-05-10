class SearchController < ApplicationController


  def search
    @how = params[:search][:how]
    # viewにてform_tagのsearch[how]で送られたデーターをparamsで受け取る
    @model = params[:search][:model]
    # viewにてform_tagのsearch[model]で送られたデーターをparamsで受け取る
    @content = params[:search][:content]
    # viewにてform_tagのsearch[content※ユーザー任意]で送られたデーターをparamsで受け取る
    @users = search_for(@how, @model, @content)
    @book = Book.new
  end

  private
  def match(model, content)
    if model == "user"
      User.where(name: content)
    else model == "book"
      Book.where(title: content)
    end
  end

  def forward(model, content)
    if model == "user"
      User.where("name LIKE?", "#{content}%")
    else model == "book"
      Book.where("title LIKE?", "#{content}%")
    end
  end

  def backward(model, content)
    if model == "user"
      User.where("name LIKE?", "%#{content}")
    else model == "book"
      Book.hhere("title LIKE?", "%#{content}")
    end
  end

  def parrtical
    if model == "user"
      User.where("name LIKE?", "%#{content}%")
    else model == "book"
      Book.where("title LIKE?", "%#{content}%")
    end
  end

  def search_for(how, model, content)
    case how
    when "match"
      match(model, content)
    when "forward"
      forward(model, content)
    when "backward"
      bacdward(model, content)
    when "partical"
      partical(model, content)
    end
  end
end
