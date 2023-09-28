# frozen_string_literal: true

# Return city data for the nearest city from the given "search" param.
class Api::V1::CitiesController < ApplicationController
  before_action :check_coordinates
  rescue_from ActionController::ParameterMissing, with: :params_error

  # @note POST /api/v1/cities/nearest
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

  # Using a fixed distance of 50 miles for now.
  # In the future we could accept a `distance` param and validate that it does
  # not exceed a certain threshold.
  # PROS
  # - predictable API responses which allow for easier testing.
  # - fixed distances are good in many business scenarios, i.e. finding a City for a day trip.
  # - prevents retrieving too many DB results at once
  # CONS
  # - may seem opaque or arbitrary to the user
  # - may not account for all use cases
  def city
    @city ||= City.near(coordinates, 50).first
  end

  def coordinates
    @coordinates ||= Geocoder.search(nearest_params).first&.coordinates
  end

  def nearest_params
    params.require(:search)
  end

  def params_error
    render(
      json: {
        error: 'The "search" param is required but it was not provided'
      },
      status: :unprocessable_entity
    )
  end
end
