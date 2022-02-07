require 'rails_helper'

RSpec.describe 'Ketchup Learn', type: :request do
  let(:user) { create(:user) }
  let!(:courses) { create_list(:course, 5) }
  let(:headers) { valid_headers }

  describe 'GET /courses' do
    # make HTTP get request

    before { get '/courses', params: {}, headers: headers }

    it 'returns courses' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
