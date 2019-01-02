class ShortLinkController < ApplicationController

  def create
    short_link_params = params.permit(:short_link)
    short_link = ShortLink.create(short_link_params)

    render json: short_link, status: :created
  end
end
