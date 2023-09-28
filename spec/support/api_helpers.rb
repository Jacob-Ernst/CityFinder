# frozen_string_literal: true

module ApiHelpers
  # Prepend a request path with the path to the API
  def api(path, version: 'v1/')
    "/api/#{version}#{path}"
  end
end
