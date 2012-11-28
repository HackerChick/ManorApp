class VotesController < ApplicationController
  before_filter :get_item

  def get_item
    @item = Item.find(params[:item_id])
  end

  # GET /items/1/votes
  # GET /items/1//votes.json
  def index
    @votes = @item.votes.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @votes }
    end
  end

  # GET /items/1/votes/1
  # GET /items/1//votes/1.json
  def show
    @vote = Vote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vote }
    end
  end

  # GET /items/1/votes/new
  # GET /items/1/votes/new.json
  def new
    current_user.units.each do |unit|
      if :choice.nil?
        vote = Vote.find_by_item_id_and_unit_id(@item.id, unit.id)
        vote.destroy if !vote.nil?
      else
        vote = Vote.find_or_create_by_item_id_and_unit_id(@item.id, unit.id)
        vote.update_attributes( :choice => params[:choice] )
      end
    end

    respond_to do |format|
      format.html { redirect_to items_path, notice: 'Vote was successfully created.' }
      format.json { render json: @vote }
    end
  end

  # GET /items/1/votes/1/edit
  def edit
    @vote = Vote.find(params[:id])
  end

  # POST /items/1/votes
  # POST /items/1/votes.json
  def create
    @vote = Vote.new(params[:vote])

    respond_to do |format|
      if @vote.save
        format.html { redirect_to [@item,@vote], notice: 'Vote was successfully created.' }
        format.json { render json: @vote, status: :created, location: @vote }
      else
        format.html { render action: "new" }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /items/1/votes/1
  # PUT /items/1/votes/1.json
  def update
    @vote = Vote.find(params[:id])

    respond_to do |format|
      if @vote.update_attributes(params[:vote])
        format.html { redirect_to [@item,@vote], notice: 'Vote was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1/votes/1
  # DELETE /items/1/votes/1.json
  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy

    respond_to do |format|
      format.html { redirect_to new_url }
      format.json { head :no_content }
    end
  end
end