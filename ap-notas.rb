body = {
  username: 'exes',
  password: 'trajerosa1'
}

headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json'
}

response = HTTParty.post(
  'https://10.0.0.3:8443/api/login',
  body: body.to_json,
  headers: headers
)

# unifises = response.headers['set-cookie'].split(';')[0]
# csrf = response.headers['set-cookie'].split(';')[3].split(', ')[1]
#Paso  2 : intentar usar los cookies - Par apruebas /api/self . Si me devuelve algo, está correcto el uso.
  # xsrfCookieName: csrf.split('=')[1],
  # xsrfHeaderName: 'X-Csrf-Token'


headers = {
  'Cookie': unifises + '; ' + csrf,
  'X-CSRF-Token': csrf.split('=')[1],
  'Content-Type': 'application/json',
  'Accept': 'application/json'
}

HTTParty.get(
  'https://10.0.0.3:8443/api/self',
  headers: headers
)

#Paso 2 real - Autorizar dispositivo
#endpoint - /api/s/default/cmd/stamgr
#body:{
#cmd:"authorize-guest"
#mac: string
#}

Mac = 'b8:d7:af:1c:93:55'
body_auth = {
  cmd:"authorize-guest" ,
  mac: Mac
}

headers = {
  'Cookie': unifises + '; ' + csrf,
  'X-CSRF-Token': csrf.split('=')[1],
  'Content-Type': 'application/json',
  'Accept': 'application/json'
}

HTTParty.post(
  'https://10.0.0.3:8443/api/s/default/cmd/stamgr',
  body: body_auth.to_json,
  headers: headers
)
