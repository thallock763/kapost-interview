class ShortLink < ApplicationRecord

  def generate_link(url_prefix)
    self.update(short_url: "#{url_prefix}/#{self.id}")
  end
end
