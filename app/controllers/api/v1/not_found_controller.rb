# frozen_string_literal: true

# Handles any requests for paths with no other matching routes.
class Api::V1::NotFoundController < ApplicationController
  # @note ANY /api/v1/*
  def not_found
    render(
      json: {
        error: "Could not find matching route for #{request.method} #{request.original_fullpath}"
      },
      status: :not_found
    )
  end
end
