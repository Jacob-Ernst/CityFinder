# frozen_string_literal: true

class Api::V1::CitiesController < ApplicationController
  before_action :check_coordinates

  # @note GET /api/v1/cities/nearest
  def nearest
    if city
      render json: city.as_json, status: :ok
    else
      render(
        json: {
          error: 'No matching city within 50 miles of your search'
        },
        status: :not_found
      )
    end
  end

  private

  def check_coordinates
    unless coordinates
      render(
        json: { error: 'We could not find coordinates for your search' },
        status: :unprocessable_entity
      )
    end
  end

  def city
    @city ||= City.near(coordinates, 50).first
  end

  def coordinates
    @coordinates ||= Geocoder.search(nearest_params).first&.coordinates
  end

  def nearest_params
    params.require(:search)
  end
end
