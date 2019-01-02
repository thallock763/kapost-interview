class ShortLinkController < ApplicationController

  def create
    short_link_params = params.permit(:long_url)
    short_link = ShortLink.create(short_link_params)
    short_link.generate_link("#{request.protocol}#{request.host_with_port}")

    short_link = short_link.slice(:short_url, :long_url)
    render json: short_link, status: :created
  end
end
