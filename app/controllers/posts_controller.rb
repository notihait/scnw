class PostsController < ApplicationController
  allow_unauthenticated_access only: %i[ index show ]
  before_action :set_post, only: %i[ show edit update destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  def post_params
    params.expect(post: [ :name, :description ])
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.expect(post: [ :name ])
    end
end
