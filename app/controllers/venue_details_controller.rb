class VenueDetailsController < ApplicationController
  def index
    @venue_details = VenueDetail.page(params[:page]).per(10)

    render("venue_details/index.html.erb")
  end

  def show
    @bookmarked_venue = BookmarkedVenue.new
    @venue_detail = VenueDetail.find(params[:id])

    render("venue_details/show.html.erb")
  end

  def new
    @venue_detail = VenueDetail.new

    render("venue_details/new.html.erb")
  end

  def create
    @venue_detail = VenueDetail.new

    @venue_detail.venue_name = params[:venue_name]
    @venue_detail.venue_address = params[:venue_address]

    save_status = @venue_detail.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/venue_details/new", "/create_venue_detail"
        redirect_to("/venue_details")
      else
        redirect_back(:fallback_location => "/", :notice => "Venue detail created successfully.")
      end
    else
      render("venue_details/new.html.erb")
    end
  end

  def edit
    @venue_detail = VenueDetail.find(params[:id])

    render("venue_details/edit.html.erb")
  end

  def update
    @venue_detail = VenueDetail.find(params[:id])

    @venue_detail.venue_name = params[:venue_name]
    @venue_detail.venue_address = params[:venue_address]

    save_status = @venue_detail.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/venue_details/#{@venue_detail.id}/edit", "/update_venue_detail"
        redirect_to("/venue_details/#{@venue_detail.id}", :notice => "Venue detail updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Venue detail updated successfully.")
      end
    else
      render("venue_details/edit.html.erb")
    end
  end

  def destroy
    @venue_detail = VenueDetail.find(params[:id])

    @venue_detail.destroy

    if URI(request.referer).path == "/venue_details/#{@venue_detail.id}"
      redirect_to("/", :notice => "Venue detail deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Venue detail deleted.")
    end
  end
end
