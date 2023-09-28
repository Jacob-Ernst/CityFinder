# frozen_string_literal: true

require 'rails_helper'

RSpec.describe City do
  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :state }
    it do
      is_expected.to validate_numericality_of(:lat).allow_nil
    end
    it do
      is_expected.to validate_numericality_of(:lng).allow_nil
    end
    it do
      is_expected.to validate_numericality_of(:population).allow_nil
    end
  end

  describe 'after_validation' do
    context 'when creating new city and coordinates present' do
      subject(:city) do
        build(:city, lat: 30.267153, lng: -97.7430608)
      end

      it 'reverse geocodes the city' do
        city.save
        expect(city.address).to eq('Austin, TX, USA')
      end
    end

    context 'when creating new city and coordinates missing' do
      subject(:city) { build(:city, lat: nil, lng: nil) }

      it 'does not reverse geocode the city' do
        city.save
        expect(city.address).to be_nil
      end
    end

    context 'when updating city and coordinates unchanged' do
      subject(:city) { create(:city, lat: nil, lng: nil) }

      it 'does not reverse geocode the city' do
        expect do
          city.name = 'Doge City'
          city.save
        end.not_to change(city, :address)
      end
    end

    context 'when updating city and coordinates changed' do
      subject(:city) { create(:city) }

      it 'reverse geocodes the city' do
        expect do
          city.lat = 30.267153
          city.lng = -97.7430608
          city.save
        end.to change(city, :address)
        expect(city.address).to eq('Austin, TX, USA')
      end
    end
  end
end
