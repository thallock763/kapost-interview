class ShortLink < ApplicationRecord

  def generate_link(url_prefix)
    # Use the database record's id as the basis for the short link
    current_value = self.id
    link = ''

    # Map the record's database id to this set of characters
    chars = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a

    while current_value > 0
      link += chars[current_value % chars.length]
      current_value /= chars.length
    end

    self.update(short_url: "#{url_prefix}/#{link.reverse}")
  end
end
