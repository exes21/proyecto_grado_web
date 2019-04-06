Role.new(
    name: 'Administrador'
).save

Role.new(
    name: 'Estudiante'
).save

Rake::Task['permissions:permissions'].invoke
Permission.all.each do |permission|
  PermissionRole.create(
    permission: permission,
    role: Role.first
  )
end


User.new(
    name: "Robert",
    password: "123456789",
    password_confirmation: "123456789",
    email: "robert@hotmail.com",
    role: Role.first
).save
User.new(
    name: "Administrador",
    password: "123456789",
    password_confirmation: "123456789",
    email: "administrador@hotmail.com",
    role: Role.first
).save


User.new(
    name: "visitante1",
    password: "123456789",
    password_confirmation: "123456789",
    email: "prueba1@hotmail.com",
    role: Role.last
).save

User.new(
    name: "visitante2",
    password: "123456789",
    password_confirmation: "123456789",
    email: "prueba2@hotmail.com",
    role: Role.last
).save

User.new(
    name: "Tester",
    password: "datos01",
    password_confirmation: "datos01",
    email: "datos@prueba.com",
    role: Role.last
).save




za = Zone.find_or_create_by(
  name: "Zona A"
)
zb= Zone.find_or_create_by(
  name: "Zona B"
)
zc= Zone.find_or_create_by(
  name: "Zona C"
)
zd= Zone.find_or_create_by(
  name: "Zona D"
)
za.coordinates.new(
    latitude: 19.441390 ,
    longitude: -70.683830
)
za.coordinates.new(
    latitude: 19.441003 ,
    longitude: -70.682239
)
za.coordinates.new(
    latitude: 19.440093,
    longitude: -70.682422
)
za.coordinates.new(
    latitude: 19.439992,
    longitude: -70.683580
)
zb.coordinates.new(
    latitude: 19.443300 ,
    longitude: -70.685630
)
zb.coordinates.new(
    latitude: 19.443239,
    longitude: -70.684503
)
zb.coordinates.new(
    latitude: 19.442076,
    longitude: -70.685318
)
zc.coordinates.new(
    latitude: 19.443806,
    longitude: -70.682540
)
zc.coordinates.new(
    latitude: 19.443765,
    longitude: -70.681295
)
zc.coordinates.new(
    latitude: 19.442956,
    longitude: -70.681252
)
zc.coordinates.new(
    latitude: 19.442784,
    longitude: -70.682336
)
zd.coordinates.new(
    latitude: 19.446853,
    longitude: -70.684398
)
zd.coordinates.new(
    latitude: 19.446853,
    longitude: -70.682843
)
zd.coordinates.new(
    latitude: 19.446135,
    longitude: -70.682896
)
zd.coordinates.new(
    latitude: 19.446105,
    longitude: -70.684001
)
ap = AccessPoint.new(
    ip_address: "10.0.0.1",
    mac_address: "AF:AF:AF:AF",
    zone: za,
    ssid: 'ap 1'
)
ap.coordinate= Coordinate.new(
    latitude: 19.441390 ,
    longitude: -70.683830
)
ap.save
ap = AccessPoint.new(
    ip_address: "10.0.0.10",
    mac_address: "BF:BF:BF:BF",
    zone: za,
    ssid: 'ap 2'
)
ap.coordinate= Coordinate.new(
    latitude: 19.441390 ,
    longitude: -70.683830
)
ap.save
ap = AccessPoint.new(
    ip_address: "10.0.0.20",
    mac_address: "CF:CF:CF:CF",
    zone: za,
    ssid: 'ap 3'
)
ap.coordinate= Coordinate.new(
    latitude: 19.441390 ,
    longitude: -70.683830
)
ap.save
ap = AccessPoint.new(
    ip_address: "10.0.0.30",
    mac_address: "DF:DF:DF:DF",
    zone: za,
    ssid: 'ap 4'
)
ap.coordinate= Coordinate.new(
    latitude: 19.441390 ,
    longitude: -70.683830
)
ap.save
ap = AccessPoint.new(
    ip_address: "10.0.0.40",
    mac_address: "FA:FA:FA:FA",
    zone: zb,
    ssid: 'ap 5'
)
ap.coordinate= Coordinate.new(
    latitude: 19.441390 ,
    longitude: -70.683830
)
ap.save
ap = AccessPoint.new(
    ip_address: "10.0.0.45",
    mac_address: "FB:FB:FB:FB",
    zone: zb,
    ssid: 'ap 6'
)
ap.coordinate= Coordinate.new(
    latitude: 19.441390 ,
    longitude: -70.683830
)
ap.save
ap = AccessPoint.new(
    ip_address: "10.0.0.50",
    mac_address: "FC:FC:FC:FC",
    zone: zb,
    ssid: 'ap 7'
)
ap.coordinate= Coordinate.new(
    latitude: 19.441390 ,
    longitude: -70.683830
)
ap.save
ap = AccessPoint.new(
    ip_address: "10.0.0.55",
    mac_address: "FD:FD:FD:FD",
    zone: zb,
    ssid: 'ap 8'
)
ap.coordinate= Coordinate.new(
    latitude: 19.441390 ,
    longitude: -70.683830
)
ap.save
ap = AccessPoint.new(
    ip_address: "10.0.0.60",
    mac_address: "FC:FC:FC:FC",
    zone: zb,
    ssid: 'ap 9'
)
ap.coordinate= Coordinate.new(
    latitude: 19.441390 ,
    longitude: -70.683830
)
ap.save
ap = AccessPoint.new(
    ip_address: "10.0.0.65",
    mac_address: "FD:FD:FD:FD",
    zone: zc,
    ssid: 'ap 10'
)
ap.coordinate= Coordinate.new(
    latitude: 19.441390 ,
    longitude: -70.683830
)
ap.save
ap = AccessPoint.new(
    ip_address: "10.0.0.70",
    mac_address: "FE:FE:FE:FE",
    zone: zc,
    ssid: 'ap 11'
)
ap.coordinate= Coordinate.new(
    latitude: 19.441390 ,
    longitude: -70.683830
)
ap.save
ap = AccessPoint.new(
    ip_address: "10.0.0.75",
    mac_address: "AA:AA:AA:AA",
    zone: zc,
    ssid: 'ap 12'
)
ap.coordinate= Coordinate.new(
    latitude: 19.441390 ,
    longitude: -70.683830
)
ap.save
ap = AccessPoint.new(
    ip_address: "10.0.0.80",
    mac_address: "AB:AB:AB:AB",
    zone: zc,
    ssid: 'ap 13'
)
ap.coordinate= Coordinate.new(
    latitude: 19.441390 ,
    longitude: -70.683830
)
ap.save
ap = AccessPoint.new(
    ip_address: "10.0.0.85",
    mac_address: "AC:AC:AC:AC",
    zone: zc,
    ssid: 'ap 14'
)
ap.coordinate= Coordinate.new(
    latitude: 19.441390 ,
    longitude: -70.683830
)
ap.save
ap = AccessPoint.new(
    ip_address: "10.0.1.1",
    mac_address: "AD:AD:AD:AD",
    zone: zd,
    ssid: 'ap 15'
)
ap.coordinate= Coordinate.new(
    latitude: 19.441390 ,
    longitude: -70.683830
)
ap.save
ap = AccessPoint.new(
    ip_address: "10.0.1.15",
    mac_address: "AE:AE:AE:AE",
    zone: zd,
    ssid: 'ap 16'
)
ap.coordinate= Coordinate.new(
    latitude: 19.441390 ,
    longitude: -70.683830
)
ap.save
ap = AccessPoint.new(
    ip_address: "10.0.1.20",
    mac_address: "AF:AF:AF:AF",
    zone: zd,
    ssid: 'ap 17'
)
ap.coordinate= Coordinate.new(
    latitude: 19.441390 ,
    longitude: -70.683830
)
ap.save
ap = AccessPoint.new(
    ip_address: "10.0.0.1",
    mac_address: "BA:BA:BA:BA",
    zone: zd,
    ssid: "Flia.Marcelino Camilo"
)
ap.coordinate= Coordinate.new(
    latitude: 19.441390 ,
    longitude: -70.683830
)
ap.save
