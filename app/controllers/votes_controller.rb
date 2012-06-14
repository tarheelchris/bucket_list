class VotesController < ApplicationController

def create
  v = Vote.new
  v.user_id = @current_user.id
  # raise params.inspect
  v.item_id = params[:id]
  item = Item.find_by_id(v.item_id)
  if v.save
    item.count += 1
    item.save
  end
  # redirect_to list_items_url(item.list)
  redirect_to :back
end


def destroy
   # raise @current_user.votes.inspect
  v = @current_user.votes.find_by_id(params[:id])
  if v.destroy
    item = Item.find(v.item_id)
    item.count -= 1
    item.save
  end
   redirect_to :back
end


end
