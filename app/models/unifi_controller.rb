class UnifiController
  include HTTParty  

  attr_accessor :selfbaseuri, :csrf, :unifises, :username, :password, :cookies

  def initialize
    @selfbaseuri = "https://#{Setting.portal_url}:#{Setting.portal_port}/api"
    self.class.base_uri @selfbaseuri
    @username = 'exes'
    @password = 'trajerosa1'
    self.class.default_options.merge!(headers: { 'Content-Type'=>'application/json',
        'Accept'=>'application/json' },
        verify: false)
    login
    self.class.default_options.merge!(headers: { 'Cookie'=>@cookies } )
  end

  def login
    options = {
        headers: {
          Referer: "#{@selfbaseuri}/login"
        },
        body: JSON.generate({
          username: "#{@username}",
          password: "#{@password}"
        })
      }
    response = self.class.post("/login", options)
    puts response
    @cookies = response.headers['set-cookie']
  end

  def logged_user
    self.class.get("/self")
  end

  def guest_sessions(mac)
    guest_list["data"].select { |n| n["mac"] == mac}
  end

  def devises
    response = self.class.get("/s/default/stat/device")
    response.parsed_response
  end

  def is_guest_authorized?(mac)
    guest_sessions(mac).select { |n| n["expired"] == false }.any?
  end

  def logout
    response = self.class.get("/logout")
    @cookies = ''
  end

  def guest_list
    response = self.class.get("/s/default/stat/guest")
    response.parsed_response
  end

  def authorize_guest(mac)
    body = { cmd: 'authorize-guest', mac: mac.downcase, minutes: 60*24 }

    response = self.class.post("/s/default/cmd/stamgr", { body: body.to_json })
    response.parsed_response
  end

  def unauthorize_guest(mac)
    body = { cmd: 'unauthorize-guest', mac: mac.downcase }
    response = self.class.post("/s/default/cmd/stamgr", { body: body.to_json })
    response.parsed_response
  end
end