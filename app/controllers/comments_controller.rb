class CommentsController < ApplicationController
  before_filter :get_item

  def get_item
    @item = Item.find(params[:item_id])
  end

  # GET items/id/comments/1
  # GET items/id/comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET items/id/comments/new
  def new
    @comment = Comment.new

    respond_to do |format|
      format.js
    end
  end

  # POST items/id/comments
  def create
    @comment = Comment.new(params[:comment])
    if( @comment.text.length > 0 )
      @comment.datetime = Time.now
      @comment.save
    else
      @comment = nil
    end

    respond_to do |format|
      format.js
      #format.html { redirect_to items_path}
    end
  end
end
