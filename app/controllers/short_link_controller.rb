class ShortLinkController < ApplicationController

  def create
    short_link_params = params.permit(:long_url)
    short_link = ShortLink.find_by(long_url: short_link_params[:long_url])

    if short_link.present?
      render json: short_link, status: :ok if short_link.present?
    else
      short_link = ShortLink.create(short_link_params)
      short_link.generate_link("#{request.protocol}#{request.host_with_port}")

      short_link = short_link.slice(:short_url, :long_url)
      render json: short_link, status: :created
    end
  end

  def resolve_link
    short_url = "#{request.protocol}#{request.host_with_port}#{request.fullpath}"
    short_link = ShortLink.find_by(short_url: short_url)

    if short_link.present?
      redirect_to short_link.long_url, status: :moved_permanently
    else
      render json: { message: "The URL provided is not valid. Please check the link and sure it is correct" }, status: :not_found
    end
  end
end
