class BookmarkedVenuesController < ApplicationController
  def index
    @q = BookmarkedVenue.ransack(params[:q])
    @bookmarked_venues = @q.result(:distinct => true).includes(:dish, :venue).page(params[:page]).per(10)

    render("bookmarked_venues/index.html.erb")
  end

  def show
    @bookmarked_venue = BookmarkedVenue.find(params[:id])

    render("bookmarked_venues/show.html.erb")
  end

  def new
    @bookmarked_venue = BookmarkedVenue.new

    render("bookmarked_venues/new.html.erb")
  end

  def create
    @bookmarked_venue = BookmarkedVenue.new

    @bookmarked_venue.dish_id = params[:dish_id]
    @bookmarked_venue.venue_id = params[:venue_id]

    save_status = @bookmarked_venue.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/bookmarked_venues/new", "/create_bookmarked_venue"
        redirect_to("/bookmarked_venues")
      else
        redirect_back(:fallback_location => "/", :notice => "Bookmarked venue created successfully.")
      end
    else
      render("bookmarked_venues/new.html.erb")
    end
  end

  def edit
    @bookmarked_venue = BookmarkedVenue.find(params[:id])

    render("bookmarked_venues/edit.html.erb")
  end

  def update
    @bookmarked_venue = BookmarkedVenue.find(params[:id])

    @bookmarked_venue.dish_id = params[:dish_id]
    @bookmarked_venue.venue_id = params[:venue_id]

    save_status = @bookmarked_venue.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/bookmarked_venues/#{@bookmarked_venue.id}/edit", "/update_bookmarked_venue"
        redirect_to("/bookmarked_venues/#{@bookmarked_venue.id}", :notice => "Bookmarked venue updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Bookmarked venue updated successfully.")
      end
    else
      render("bookmarked_venues/edit.html.erb")
    end
  end

  def destroy
    @bookmarked_venue = BookmarkedVenue.find(params[:id])

    @bookmarked_venue.destroy

    if URI(request.referer).path == "/bookmarked_venues/#{@bookmarked_venue.id}"
      redirect_to("/", :notice => "Bookmarked venue deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Bookmarked venue deleted.")
    end
  end
end
