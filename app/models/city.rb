# frozen_string_literal: true

class City < ApplicationRecord
  reverse_geocoded_by :lat, :lng
  after_validation :reverse_geocode, if: :should_reverse_geocode?

  private

  def should_reverse_geocode?
    coordinates_present? && coordinates_changed?
  end

  def coordinates_present?
    lat.present? && lng.present?
  end

  def coordinates_changed?
    lat_changed? || lng_changed?
  end
end
