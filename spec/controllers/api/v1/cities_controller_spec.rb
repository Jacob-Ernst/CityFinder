# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::CitiesController do
  describe '#nearest' do
    context 'when search could not be geocoded' do
      before { Geocoder::Lookup::Test.add_stub('Fake City 123', []) }

      it 'returns unprocessable_entity with error', :aggregate_failures do
        post(
          :nearest,
          params: { search: 'Fake City 123' },
          xhr: true
        )
        expect(response).to have_http_status(:unprocessable_entity)
        expect(json['error']).to eq(
          'We could not find coordinates for your search'
        )
      end
    end

    context 'when no city in range' do
      it 'returns not_found with error', :aggregate_failures do
        post(
          :nearest,
          params: { search: 'Austin, Texas, United States' },
          xhr: true
        )
        expect(response).to have_http_status(:not_found)
        expect(json['error']).to eq(
          'No matching city within 50 miles of your search'
        )
      end
    end

    context 'when no search param given' do
      it 'returns unprocessable_entity with error', :aggregate_failures do
        post(:nearest, params: {}, xhr: true)
        expect(response).to have_http_status(:unprocessable_entity)
        expect(json['error']).to eq(
          'The "search" param is required but it was not provided'
        )
      end
    end

    context 'when a city is in range' do
      it 'returns success with city data', :aggregate_failures do
        city = create(:city, lat: 30.267153, lng: -97.7430608)
        post(
          :nearest,
          params: { search: 'San Marcos, TX, USA' },
          xhr: true
        )
        expect(response).to be_successful
        expect(json).to include(city.as_json)
      end
    end
  end
end
