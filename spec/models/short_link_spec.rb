require 'rails_helper'

RSpec.describe ShortLink, type: :model do

  describe "generate_link" do
    let(:long_url) { "http://www.kapost.com" }
    let!(:short_link) { ShortLink.create(long_url: long_url) }
    let(:short_url_regex) { /http:\/\/localhost:3000\/\d+/ }
    let(:url_prefix) { "http://localhost:3000" }

    subject do
      short_link.generate_link(url_prefix)
      short_link
    end

    it "Generates a short link for the given long url" do
      expect(subject.short_url).to match(short_url_regex)
    end
  end
end
