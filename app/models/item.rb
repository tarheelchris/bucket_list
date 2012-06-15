class Item < ActiveRecord::Base
  attr_accessible :details, :title, :image, :complete_status, :count
  
  has_many :list_item
  has_many :votes
  has_many :lists, :through => :list_item
  
  mount_uploader :image, ImageUploader
  
  # def status
  #   @item = item(params[:id])
  #     if @item.complete_status == 1
  #     @item.title.upcase 
  #     end
  # end
  
  # def item_complete 
  #    new_list = List.new
  #    item(params[:id]).list_id = new_list.id
  #  end
  
  
end
