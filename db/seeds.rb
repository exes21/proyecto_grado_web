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
    name: "Sistema",
    password: "123456789",
    password_confirmation: "123456789",
    email: "no-reply@IARW.com",
    role: Role.first
).save

User.new(
    name: "Jurado 1",
    password: "123456789",
    password_confirmation: "123456789",
    email: "jurado1@gmail.com",
    role: Role.first
).save

User.new(
    name: "Jurado 2",
    password: "123456789",
    password_confirmation: "123456789",
    email: "jurado2@gmail.com",
    role: Role.first
).save

User.new(
    name: "Jurado 3",
    password: "123456789",
    password_confirmation: "123456789",
    email: "jurado3@gmail.com",
    role: Role.first
).save

User.new(
    name: "profesor",
    password: "123456789",
    password_confirmation: "123456789",
    email: "profesor@gmail.com",
    role: Role.first
).save

User.new(
    name: "Exes",
    password: "123456789",
    password_confirmation: "123456789",
    email: "exes.itt@gmail.com",
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
    name: "visitante3",
    password: "123456789",
    password_confirmation: "123456789",
    email: "prueba3@hotmail.com",
    role: Role.last
).save

User.new(
    name: "visitante4",
    password: "123456789",
    password_confirmation: "123456789",
    email: "prueba4@hotmail.com",
    role: Role.last
).save

User.new(
    name: "visitante5",
    password: "123456789",
    password_confirmation: "123456789",
    email: "prueba5@hotmail.com",
    role: Role.last
).save

User.new(
    name: "Tester",
    password: "datos01.",
    password_confirmation: "datos01.",
    email: "datos@prueba.com",
    role: Role.last
).save

# Zona General
# ---------------------------------------------------------------------------------

Setting.limits = [["19.444970877841918", "-70.68766718452969"],
["19.445840927278656", "-70.68693762367764"],
["19.446751439136058", "-70.68646555489102"],
["19.448046380533643", "-70.68565016335049"],
["19.448795013814998", "-70.68500643318691"],
["19.44865338075643", "-70.68444853371182"],
["19.448612914145556", "-70.68382626122036"],
["19.44887594693584", "-70.68309670036831"],
["19.44887594693584", "-70.6824100548605"],
["19.448673614058084", "-70.68191652840176"],
["19.448026147153776", "-70.68245297020474"],
["19.44739891112657", "-70.68266754692593"],
["19.447135875942003", "-70.68191652840176"],
["19.446994241435238", "-70.68135862892666"],
["19.44646816932786", "-70.68135862892666"],
["19.446225366241567", "-70.68133717125454"],
["19.446184899025205", "-70.68080072945156"],
["19.445942095515083", "-70.67925577705898"],
["19.445557655881114", "-70.67816143578091"],
["19.443514040434522", "-70.6782687241415"],
["19.44175367778737", "-70.67822580879727"],
["19.441259633205476", "-70.6780659931498"],
["19.44061213672304", "-70.67836640055947"],
["19.440065809557094", "-70.67881701167397"],
["19.43953971499291", "-70.67920324977212"],
["19.439033853227247", "-70.67986843760781"],
["19.438608928125973", "-70.68031904872231"],
["19.438426817027818", "-70.68087694819741"],
["19.438386347867155", "-70.68149922068886"],
["19.438386347867155", "-70.68201420481972"],
["19.438447051604378", "-70.68261501963906"],
["19.438224471123632", "-70.6832158344584"],
["19.4380625942187", "-70.68362353022866"],
["19.438103063460062", "-70.68420288737587"],
["19.440753776799273", "-70.68716404612832"]]

Setting.center = ["19.443469270577268", "-70.68286658883972"]


# Dep. Ingenierias
# ---------------------------------------------------------------------------------

zone = Zone.find_or_create_by(
  name: "Dep. Ingenierias"
)
zone.coordinates.new(
    latitude: 19.44182246 ,
    longitude: -70.68333954
).save
zone.coordinates.new(
    latitude: 19.44183258 ,
    longitude: -70.68274945
).save
zone.coordinates.new(
    latitude: 19.44171117,
    longitude: -70.68273872
).save
zone.coordinates.new(
    latitude: 19.44171117,
    longitude: -70.68333417
).save
######## El Negrito
ap = AccessPoint.new(
    ip_address: "192.168.0.100",
    mac_address: "24:F5:A2:EE:1F:C8",
    zone: zone,
    ssid: "IARW_AP_prueba"
)
ap.coordinate= Coordinate.new(
    latitude: 19.44178705 ,
    longitude: -70.6831035
)

ap.channels.new(bssid: "24:F5:A2:EE:1F:C8")
ap.save


# Aulas III
# ---------------------------------------------------------------------------------

zona= Zone.find_or_create_by(
  name: "Aulas III"
)
zona.coordinates.new(
    latitude: 19.44159988 ,
    longitude: -70.68367213
).save
zona.coordinates.new(
    latitude: 19.44159482 ,
    longitude: -70.68314642
).save
zona.coordinates.new(
    latitude: 19.44120532,
    longitude: -70.68311423
).save
zona.coordinates.new(
    latitude: 19.44124073,
    longitude: -70.68365067
).save

ap = AccessPoint.new(
    ip_address: "192.168.0.150",
    mac_address: "FC:EC:DA:80:EF:DA",
    zone: zona,
    ssid: "IARW_APconPortal"
)
ap.coordinate= Coordinate.new(
    latitude: 19.44149365 ,
    longitude: -70.68340927
)
ap.channels.new(bssid:  "FC:EC:DA:80:EF:DA")
ap.save

# Lab. Ingenieria
# ---------------------------------------------------------------------------------

zone= Zone.find_or_create_by(
  name: "Lab. Ingenieria"
)

zone.coordinates.new(
    latitude: 19.4411345 ,
    longitude: -70.68308204
).save
zone.coordinates.new(
    latitude: 19.4411092,
    longitude: -70.6824705
).save
zone.coordinates.new(
    latitude: 19.44097262,
    longitude: -70.68247586
).save
zone.coordinates.new(
    latitude: 19.4409878,
    longitude: -70.68311423
).save

ap = AccessPoint.new(
    ip_address: "192.168.0.1",
    mac_address: "C0:25:67:11:62:58",
    zone: zone,
    ssid: "IARW_RouterPrincipal"
)
ap.coordinate= Coordinate.new(
    latitude: 19.44107885 ,
    longitude: -70.6828782
)
ap.channels.new(bssid:  "C0:25:67:11:62:58")
ap.save
ap.channels.new(bssid:  "C0:25:67:44:62:58")
ap.save

Setting.portal_url = 'http://192.168.0.95'
Setting.portal_port = '8443'