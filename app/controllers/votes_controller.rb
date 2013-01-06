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

  # This is handling the yes/no/clear actions so does new/create/update/destroy
  # TODO: rename this action to something clearer like "vote"
  # GET /items/1/votes/new
  def new
    current_user.units.each do |unit|
      if :choice.nil?
        vote = Vote.find_by_item_id_and_unit_id(@item.id, unit.id)
        vote.destroy if !vote.nil?
      else
        @vote = Vote.find_or_create_by_item_id_and_unit_id(@item.id, unit.id)
        @vote.update_attributes( :choice => params[:choice] )
      end
    end

    respond_to do |format|
      format.js
    end
  end

end