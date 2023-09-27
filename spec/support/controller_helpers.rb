# frozen_string_literal: true

# :reek:IrresponsibleModule
module ControllerHelpers
  def set_accept_header_as_json
    request.headers['HTTP_ACCEPT'] = 'application/json'
  end

  def json
    @json ||= JSON.parse(response.body)
  end
end
