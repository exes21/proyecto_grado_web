body = {
  username: 'exes',
  password: 'trajerosa1'
}

headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json'
}

response = HTTParty.post(
  'https://192.168.1.110:8443/api/login',
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





# API: app/controller/api
Recibimos los datos via nuestro API que no es mas que un controlador que recibe request en formato JSON y responde en el mismo formato.
Para recibir los datos primero se valida:
  - Si el usuario es valido, en caso contrario retorna un 403
  - Si el AP se encuentra registrado en caso contrario retorna un 404
  - Si todo hasta este punto va bien, se crea o busca el mobile por su mac address y se agrega al usuario.
  - Finalmente se reciben los datos y se almacena la ubicacion de esta captura retornando un 200.

403: Forbidden, sin acceso
404: Not Found, No encontrado
500: Error Interno del servidor,
200: OK

Cuando los datos son creados y guardados en el sistema, se valida si los mismos se encuentran dentro de los criterios aceptables previamente configurados
Si no es el caso, creamos una alerta la cual inicia como una tarea de baja prioridad y conforme se presenten casos esta prioridad escala.

Una vez una alerta se convierte en critica esta es notificada.



USO INTERNO

En los modelos: app/models/

Datum > Si esta fuera de parametro crea o busca un Issue
Issue > Verifica el estado de la alerta en base a su cantidad y si es critica crea un Notification
Notification > Envia mensajes de correo electronico a los usuarios mediante el NotificationMailer

En el Mailer: app/mailers
NotificationMailer > Utiliza SMTP para enviar via Sendgrid los correos.

Sendgrid es un servicio para envio de correos que permite una mejor fiabilidad ante otros servidores lo que reduce el riesgo de caer en spam tambien nos elimina la necesidad de tener un servidor SMTP interno

El mailer tiene una vista

En la base de datos:
Usamos Postgres y Active Record(ORM)

Credenciales
Se encuentran en el Archivo .env (este contiene variables de entorno)


Vistas: app/views

Tenemos dos layouts, uno para la pagina de inicio que no tiene nada (Portal cautivo)
La otra tiene una plantilla html implementada. Usamos jquery.

El manejo de cada mapa esta en jquery en la misma vista que se usa.

Para el mapa de usuarios cargar en vivo usamos AJAX que es la abreviatura de asincronus javascript, nos permite cargar sin refrescar.
Tambien usamos ajax para crear un ap, cuando cargamos la zona en el mapa segun se selecciona
Tambien en la pagina principal para cargar los puntos de interes


Para exportar:

Usamos una clase para dar el formato que necesitamos, esta en models para esto usamos una libreria
Exportamos en csv.

Archivos:

Tenemos dos archivos para descargar:

APK: public/iarw.apk
Excel: plantilla_de_prueba.xlsx

Para guardar las configuraciones usamos una libreria que se llama rails_setting_cache
esta tiene un archivo para definir las configuraciones por defecto que esta en config/app.yml
Podemos usar esta libreria sola usando el modelo Setting y guardar cualquier configuracion como si fuese un atributo
Ej: Setting.algo = "Algo"
Tambien lo podemos usar como si perteneciera a un modelo para agregar cosas al modelo 
esto lo usamos en los access points para guardar la tolerancia.
Tambien lo usamos para guardar los puntos de la zona general.

TODO LO QUE TIENE QUE VER CON MAPA ESTA EN JQUERY. LOS JQUERY ESTAN EN LA MISMA PAGINA QUE SE USAN.
