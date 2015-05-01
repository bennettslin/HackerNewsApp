class PostsController < ApplicationController

  before_action :is_authenticated?, unless: [:index, :show]
  respond_to :html, :js

  def index

    @posts = Post.all

    # declare an empty vote
    @vote = Vote.new

    # for Ajax
    # respond_to do |format|
    #   format.html
    #   format.js
    # end
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.create(post_params)
    if @post.save
      flash[:success] = "Post successful."
      redirect_to @post
    else
      flash[:danger] = "Post was not created."
      render 'new'
    end
  end

  def show
    @vote = Vote.new
    @comment = Comment.new
    @post = Post.find(params[:id])
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    @post.update(post_params)
    redirect_to @post
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :link)
  end

end