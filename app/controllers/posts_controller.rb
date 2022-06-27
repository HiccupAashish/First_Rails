class PostsController < ApplicationController
    def index
        @post=Post.all
    end

    def show 
        @post=Post.find(params[:id])
    end
    
    def create
    #   raise params.inspect
        @post= Post.new(post_params)
        respond_to do |format|
            if @post.save
              format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
              format.json { render :show, status: :ok, location: @post }

            else
              format.html { render :edit, status: :unprocessable_entity }
              format.json { render json: @post.errors, status: :unprocessable_entity }
            end
        end
    end

    def new
        @post=Post.new
        # @post.categories.build
       
    end
    
    def destroy
        Post.find(params[:id]).destroy
        redirect_to Post
    end

    def edit
        @post=Post.find(params[:id])
    end

    def update
        @post=Post.find(params[:id])
        respond_to do |format|
            if @post.update(post_params)
              format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
              format.json { render :show, status: :ok, location: @post }
          
            else
              format.html { render :edit, status: :unprocessable_entity }
              format.json { render json: @post.errors, status: :unprocessable_entity }
            end
          end
     
    end

    private
    def post_params
        params.require(:post).permit([:title, :description, :status, category_ids:[], categories_attributes: [:name]])
    end
end
