require 'rails_helper'

RSpec.describe 'Short Link API', type: :request do
  describe 'POST /short_link' do
    context 'No short link exists for the given long url' do
      let(:long_url) { "http://www.kapost.com" }
      let(:short_url_regex) { /http:\/\/www.example.com\/\d+/ }  # RSpec uses www.example.com as the hostname for request specs

      it 'Creates a new short link' do
        post '/short_link', params: { long_url: long_url }

        expect(response.content_type).to eq("application/json")
        expect(response).to have_http_status(:created)

        json = JSON.parse(response.body)
        expect(json['long_url']).to eq(long_url)
        expect(json['short_url']).to match(short_url_regex)
      end
    end
  end
end
