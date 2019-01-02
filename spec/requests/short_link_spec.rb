require 'rails_helper'

RSpec.describe 'Short Link API', type: :request do
  describe 'POST /short_link' do
    context 'No short link exists for the given long url' do
      let(:long_url) { "http://www.kapost.com" }

      it 'Creates a new short link' do
        post '/short_link', params: { long_url: long_url }

        expect(response.content_type).to eq("application/json")
        expect(response).to have_http_status(:created)
      end
    end
  end
end
