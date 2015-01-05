class ItemsController < ApplicationController

  def new

    @activity = Activity.find(params[:activity_id])

    @item = @activity.items.new
    
  end

  def create

    @activity = Activity.find(params[:activity_id])

    @item = @activity.items.new(item_params)

      if @item.save
        respond_to do |format|
          format.html { redirect_to user_activity_path(@activity.user_id, @activity) }
          format.js
        end  
      else

        redirect_to :back

      end 
  end

  def destroy
   
    @activity = Activity.find(params[:activity_id])
    @item = Item.find(params[:id])
    @item.destroy
    
    respond_to do |format|
      format.html {redirect_to user_activity_path(@activity.user_id, @activity)}
      format.js
    end
  end

  def item_params

    params.require(:item).permit(:name, :cost)
    
  end
end
