require 'httparty'

class ApConnect
  HTTParty::Basement.default_options.update(verify: false)

  attr_accessor :csrf, :unifises

  def initialize
    response = login
    set_cookies(response)
    logged_user
  end

  def login
    HTTParty.post(
      default_url + '/api/login',
      body: controller_credentials,
      headers: default_headers
    )
  end

  def logged_user
    HTTParty.get(
      default_url+'/api/self',
      headers: auth_headers
    )
  end

  def autorize(mac)
    HTTParty.post(
      default_url + '/api/s/default/stat/guest',
      body: body_auth(mac),
      headers: auth_headers
    )
  end

  def logout
    response = HTTParty.get(
      default_url+'/api/logout',
      headers: auth_headers
    )
  end

  def guest_list
    HTTParty.post(
      default_url + '/api/s/default/cmd/stamgr',
      body: {
        within: 8760
      }.to_json,
      headers: auth_headers
    )
  end

  def unauthorize(mac)
    HTTParty.post(
      default_url + '/api/s/default/cmd/stamgr',
      body: {
        cmd: 'unauthorize-guest',
        mac: mac
      },
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
    "https://#{Setting.portal_url}:#{Setting.portal_port}"
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



#mac = "a0:c9:a0:8a:13:f1"