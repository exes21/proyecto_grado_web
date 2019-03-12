User.find_or_create_by(
    name: "Robert",
    password: "123456789",
    password_confirmation: "123456789",
    email: "robert@hotmail.com"
)
User.find_or_create_by(
    name: "Administrador",
    password: "123456789",
    password_confirmation: "123456789",
    email: "administrador@hotmail.com"
)
User.find_or_create_by(
    name: "visitante1",
    password: "123456789",
    password_confirmation: "123456789",
    email: "prueba1@hotmail.com"
)
User.find_or_create_by(
    name: "visitante2",
    password: "123456789",
    password_confirmation: "123456789",
    email: "prueba2@hotmail.com"
)
User.find_or_create_by(
    name: "visitante3",
    password: "123456789",
    password_confirmation: "123456789",
    email: "prueba3@hotmail.com"
)
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
za.coordinates.find_or_create_by(
    latitude: 19.441390 ,
    longitude: -70.683830
)
za.coordinates.find_or_create_by(
    latitude: 19.441003 ,
    longitude: -70.682239
)
za.coordinates.find_or_create_by(
    latitude: 19.440093,
    longitude: -70.682422
)
za.coordinates.find_or_create_by(
    latitude: 19.439992,
    longitude: -70.683580
)
zb.coordinates.find_or_create_by(
    latitude: 19.443300 ,
    longitude: -70.685630
)
zb.coordinates.find_or_create_by(
    latitude: 19.443239,
    longitude: -70.684503
)
zb.coordinates.find_or_create_by(
    latitude: 19.442076,
    longitude: -70.685318
)
zc.coordinates.find_or_create_by(
    latitude: 19.443806,
    longitude: -70.682540
)
zc.coordinates.find_or_create_by(
    latitude: 19.443765,
    longitude: -70.681295
)
zc.coordinates.find_or_create_by(
    latitude: 19.442956,
    longitude: -70.681252
)
zc.coordinates.find_or_create_by(
    latitude: 19.442784,
    longitude: -70.682336
)
zd.coordinates.find_or_create_by(
    latitude: 19.446853,
    longitude: -70.684398
)
zd.coordinates.find_or_create_by(
    latitude: 19.446853,
    longitude: -70.682843
)
zd.coordinates.find_or_create_by(
    latitude: 19.446135,
    longitude: -70.682896
)
zd.coordinates.find_or_create_by(
    latitude: 19.446105,
    longitude: -70.684001
)
AccessPoint.find_or_create_by(
    ip_address: "10.0.0.1",
    mac_address: "AF:AF:AF:AF",
    zone: za,
)
AccessPoint.find_or_create_by(
    ip_address: "10.0.0.10",
    mac_address: "BF:BF:BF:BF",
    zone: za,
)
AccessPoint.find_or_create_by(
    ip_address: "10.0.0.20",
    mac_address: "CF:CF:CF:CF",
    zone: za,
)
AccessPoint.find_or_create_by(
    ip_address: "10.0.0.30",
    mac_address: "DF:DF:DF:DF",
    zone: za,
)
AccessPoint.find_or_create_by(
    ip_address: "10.0.0.40",
    mac_address: "FA:FA:FA:FA",
    zone: zb,
)
AccessPoint.find_or_create_by(
    ip_address: "10.0.0.45",
    mac_address: "FB:FB:FB:FB",
    zone: zb,
)
AccessPoint.find_or_create_by(
    ip_address: "10.0.0.50",
    mac_address: "FC:FC:FC:FC",
    zone: zb,
)
AccessPoint.find_or_create_by(
    ip_address: "10.0.0.55",
    mac_address: "FD:FD:FD:FD",
    zone: zb,
)
AccessPoint.find_or_create_by(
    ip_address: "10.0.0.60",
    mac_address: "FC:FC:FC:FC",
    zone: zb,
)
AccessPoint.find_or_create_by(
    ip_address: "10.0.0.65",
    mac_address: "FD:FD:FD:FD",
    zone: zc,
)
AccessPoint.find_or_create_by(
    ip_address: "10.0.0.70",
    mac_address: "FE:FE:FE:FE",
    zone: zc,
)
AccessPoint.find_or_create_by(
    ip_address: "10.0.0.75",
    mac_address: "AA:AA:AA:AA",
    zone: zc,
)
AccessPoint.find_or_create_by(
    ip_address: "10.0.0.80",
    mac_address: "AB:AB:AB:AB",
    zone: zc,
)
AccessPoint.find_or_create_by(
    ip_address: "10.0.0.85",
    mac_address: "AC:AC:AC:AC",
    zone: zc,
)
AccessPoint.find_or_create_by(
    ip_address: "10.0.1.1",
    mac_address: "AD:AD:AD:AD",
    zone: zd,
)
AccessPoint.find_or_create_by(
    ip_address: "10.0.1.15",
    mac_address: "AE:AE:AE:AE",
    zone: zd,
)
AccessPoint.find_or_create_by(
    ip_address: "10.0.1.20",
    mac_address: "AF:AF:AF:AF",
    zone: zd,
)
AccessPoint.find_or_create_by(
    ip_address: "10.0.1.25",
    mac_address: "BA:BA:BA:BA",
    zone: zd,
)
