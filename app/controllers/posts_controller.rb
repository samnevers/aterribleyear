class PostsController < ApplicationController

  def index
    @posts = Post.all
  end


  def show
    @post = Post.find_by :id => params[:id]
    @comment = Comment.new
    @author_id = @post.user_id
  end


  def new
    @post = Post.new
  end


  def create
    post = Post.new post_params
    post.user_id = @current_user.id

    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])
      post.image = req['public_id']
    end

    post.save
    redirect_to "/posts/#{post.id}"
  end


  def edit
    @post = Post.find_by :id => params[:id]
  end


  def update
    # @user = User.find_by :id => params[:id]
    post = Post.find_by :id => params[:id]
    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])
      post.image = req['public_id']
    end
      post.assign_attributes(post_params)
    if post.save
    # post.update post_params
      redirect_to "/posts/#{post.id}"
    else
      render :edit
    end
  end


  def destroy
    post = Post.find_by :id => params[:id]
    post.destroy
    redirect_to posts_path
  end


  def rate
    post = Post.find_by :id => params[:id]
    ratings = post.ratings.where :user_id => @current_user.id

    if ratings.empty?
      # If there are no ratings attached to this post with the current_user id
        # Create a new one

      r = Rating.new
      r.post_id = post.id
      r.user_id = @current_user.id
      r.save
    else
      flash[:error] = "You have already rated this"
    end
    if destroy_2016?()
      redirect_to posts_path
    else
      redirect_to :back
    end
  end


  def comment
    post = Post.find_by :id => params[:id]
    comments = post.comments.where :user_id => @current_user.id

      @comment = Comment.new comment_params
      @comment.post_id = post.id
      @comment.user_id = @current_user.id
      @comment.save

    redirect_to post
  end


  def destroy_2016?
    post = Post.find_by(:id => params[:id], :pinnedpost => true)

    if post && post.ratings.length >= 2
      Post.destroy_all
      flash[:destroyed] = "Oh no! 2016 got too terrible! So we heard your cries and deleted it from history. If only it was that simple... Why not bitch about it by creating a new post?"
      return true
    end
    return false
  end


  private
    def post_params
      params.require(:post).permit(:title, :user_id, :image, :text, :date)
    end

    def comment_params
      params.require(:comment).permit(:text, :user_id)
    end

end
