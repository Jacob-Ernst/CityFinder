# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::NotFoundController do
  describe '#not_found' do
    it 'returns not_found with correct error', :aggregate_failures do
      post(api('fake-path'), xhr: true)
      json = Oj.load(response.body, symbol_keys: true)
      expect(response).to have_http_status(:not_found)
      expect(json[:error]).to eq(
        "Could not find matching route for POST /api/v1/fake-path"
      )
    end
  end
end
