class BlogsController < ApplicationController
    
    def index
        @blogs = Blog.all
        @replies = Reply.all
    end

    def create
        if params[:body] != '' then
            Blog.create(body: params[:body], like: 0)
        end 
        redirect_to '/blogs'
    end

    def show
        @blog = Blog.find(params[:id])
        @replies = Reply.where(blog_id: params[:id])
    end

    def create_reply
        Reply.create(blog_id: params[:id], comment: params[:comment])
        redirect_to blog_url(id: params[:id]), id: params[:id]
    end

    def like
        blog = Blog.find(params[:id])
        blog.increment(:like, 1)
        blog.save     
        redirect_back(fallback_location: blogs_path)
    end    

end
