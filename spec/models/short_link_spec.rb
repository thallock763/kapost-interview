require 'rails_helper'

RSpec.describe ShortLink, type: :model do
  let(:long_url) { "http://www.kapost.com" }
  let!(:short_link) { create_short_link(long_url) }

  describe "generate_link" do
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

  describe "create" do
    context "Multiple records with the same long url" do
      it "Only creates one record with the given url" do
        expect(short_link).to be_present
        expect { create_short_link(long_url) }.to raise_error(ActiveRecord::RecordNotUnique)
      end
    end
  end

  def create_short_link(url)
    ShortLink.create(long_url: url)
  end
end
