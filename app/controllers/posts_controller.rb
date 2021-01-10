class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	# def create
	#   @post = Post.new(params["post"])
	#   @post.save
	#   redirect_to post_path(@post)
	# end
	# def create #rails want to know parameters are allowed to be submitted thru the form to the db as the default is to let nothing thru
	# 	@post = Post.new(params.require(:post).permit(:title, :description))
	# 	@post.save
	# 	redirect_to post_path(@post)
	#   end
	def create
		@post = Post.new(post_params)
		@post.save
		redirect_to post_path(@post)
	  end
	# def update
	#   @post = Post.find(params[:id])
	#   @post.update(params["post"])
	#   redirect_to post_path(@post)
	# end

	# def update
	# 	@post = Post.find(params[:id])
	# 	@post.update(params.require(:post).permit(:title))
	# 	redirect_to post_path(@post)
	#   end

	def update
		@post = Post.find(params[:id])
		@post.update(post_params)
		redirect_to post_path(@post)
	  end
	   
	def edit
	  @post = Post.find(params[:id])
	end


	private
		def post_params
			params.require(:post).permit(:title, :description)
		end

end
