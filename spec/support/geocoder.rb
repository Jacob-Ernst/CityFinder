# frozen_string_literal: true

Geocoder.configure(lookup: :test)
Geocoder::Lookup::Test.set_default_stub(
  [
    {
      'coordinates'  => [40.7143528, -74.0059731],
      'address'      => 'New York, NY, USA',
      'state'        => 'New York',
      'state_code'   => 'NY',
      'country'      => 'United States',
      'country_code' => 'US'
    }
  ]
)
Geocoder::Lookup::Test.add_stub(
  [30.267153, -97.7430608], [
    {
      'coordinates'  => [30.267153, -97.7430608],
      'address'      => 'Austin, TX, USA',
      'state'        => 'Texas',
      'state_code'   => 'TX',
      'country'      => 'United States',
      'country_code' => 'US'
    }
  ]
)

Geocoder::Lookup::Test.add_stub(
  'San Marcos, TX, USA', [
    {
      'coordinates'  => [29.8832749, -97.9413941],
      'address'      => 'San Marcos, TX, USA',
      'state'        => 'Texas',
      'state_code'   => 'TX',
      'country'      => 'United States',
      'country_code' => 'US'
    }
  ]
)
