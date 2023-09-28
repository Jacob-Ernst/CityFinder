# frozen_string_literal: true

# Represents data for a given city.
# @note Uses `geocoder` gem to reverse geocode based on #lat & #lng.
class City < ApplicationRecord
  # @internal Constants =====================================================

  # @internal Attributes ====================================================

  # @internal Extensions ====================================================
  reverse_geocoded_by :lat, :lng

  # @internal Relationships =================================================

  # @internal Validations ===================================================
  validates(:name, :state, presence: true)
  validates(
    :lat,
    :lng,
    :population,
    numericality: { allow_nil: true }
  )

  # @internal Scopes ========================================================

  # @internal Callbacks =====================================================
  after_validation :reverse_geocode, if: :should_reverse_geocode?

  # @internal Class Methods =================================================

  # @internal Instance Methods ==============================================

  private

  # Meant to prevent unnecessary reverse geocoding when possible.
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
