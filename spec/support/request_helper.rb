module Requests
  module JsonHelpers
    # This method finds the json responce.
    def json
      @json ||= JSON.parse(response.body)
    end

    # This method set headers for api reuest.
    def set_headers(url, app=nil)
      app_id, timestamp, signature = AuthSignature.create_signature(url, app)
      request.env['HTTP_AUTH_APP_ID'] = app_id
      request.env['HTTP_AUTH_SIGNATURE'] = signature
      request.env['HTTP_AUTH_TIMESTAMP'] = timestamp
    end
  end
end
