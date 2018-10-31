module MailValidator
  extend self

  BASE_URL = "https://apilayer.net/api/check"

  def validate_email(email)
    response = HTTParty.get(
      "#{BASE_URL}?access_key=#{authorization_header}&email=#{email}",
      headers: headers
    )

    json_response(response)
  end

  private

  def headers
    {
      "Content-Type" => 'application/json',
      "Accept" => 'application/json'
    }
  end

  def authorization_header
   MAILBOXLAYER[:access_key]
  end

  def json_response(response)
    result = JSON.parse(response.body)
    result.is_a?(Hash) ? result.with_indifferent_access : result
  rescue JSON::ParserError
    raise "JSON couldn't parse response with code: (#{response.code}) and \
    body: #{response.body}"
  end
end
