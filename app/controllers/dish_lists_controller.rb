class DishListsController < ApplicationController
  def index
    @dish_lists = DishList.page(params[:page]).per(10)

    render("dish_lists/index.html.erb")
  end

  def show
    @bookmarked_venue = BookmarkedVenue.new
    @dish_list = DishList.find(params[:id])

    render("dish_lists/show.html.erb")
  end

  def new
    @dish_list = DishList.new

    render("dish_lists/new.html.erb")
  end

  def create
    @dish_list = DishList.new

    @dish_list.dish_names = params[:dish_names]
    @dish_list.dish_desc = params[:dish_desc]
    @dish_list.cuisine = params[:cuisine]

    save_status = @dish_list.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/dish_lists/new", "/create_dish_list"
        redirect_to("/dish_lists")
      else
        redirect_back(:fallback_location => "/", :notice => "Dish list created successfully.")
      end
    else
      render("dish_lists/new.html.erb")
    end
  end

  def edit
    @dish_list = DishList.find(params[:id])

    render("dish_lists/edit.html.erb")
  end

  def update
    @dish_list = DishList.find(params[:id])

    @dish_list.dish_names = params[:dish_names]
    @dish_list.dish_desc = params[:dish_desc]
    @dish_list.cuisine = params[:cuisine]

    save_status = @dish_list.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/dish_lists/#{@dish_list.id}/edit", "/update_dish_list"
        redirect_to("/dish_lists/#{@dish_list.id}", :notice => "Dish list updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Dish list updated successfully.")
      end
    else
      render("dish_lists/edit.html.erb")
    end
  end

  def destroy
    @dish_list = DishList.find(params[:id])

    @dish_list.destroy

    if URI(request.referer).path == "/dish_lists/#{@dish_list.id}"
      redirect_to("/", :notice => "Dish list deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Dish list deleted.")
    end
  end
end
