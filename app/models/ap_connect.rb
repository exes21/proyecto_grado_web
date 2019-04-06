require 'httparty'

class ApConnect
  HTTParty::Basement.default_options.update(verify: false)

  attr_accessor :csrf, :unifises

  def initialize
    response = HTTParty.post(
      default_url + '/api/login',
      body: controller_credentials,
      headers: default_headers
    )

    set_cookies(response)

    response = HTTParty.get(
      default_url+'/api/self',
      headers: auth_headers
    )
  end

  def autorize(mac)
    HTTParty.post(
      default_url + '/api/s/default/cmd/stamgr',
      body: body_auth(mac),
      headers: auth_headers
    )
  end

  private

  def body_auth(mac)
    body_auth = {
      cmd:"authorize-guest" ,
      mac: mac
    }.to_json
  end

  def set_cookies(response)
    @csrf = response.headers['set-cookie'].split(';')[3].split(', ')[1]
    @unifises = response.headers['set-cookie'].split(';')[0]
  end

  def default_url
    'https://10.0.0.3:8443'
  end

  def auth_headers
    {
      'Cookie': @unifises + '; ' + @csrf,
      'X-CSRF-Token': @csrf.split('=')[1],
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }
  end

  def default_headers
    {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }
  end

  def controller_credentials
    cred = {
      username: 'exes',
      password: 'trajerosa1'
    }
    cred.to_json
  end
end
