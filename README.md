# JPIR
## Sobre el proyecto

## Versiones y dependencias

## Estructura de los directorios

- El archivo '.env' se utiliza para definir variables de enviroment, este no debe ser subido al repositorio o compartido sin autorizacion, contiene claves privadas.
- Dentro de la carpeta app se encuentra toda la logica propia del proyecto como son los modelos, vistas, controladores, estilos, javascripts y helpers
- Vendor es una carpeta especial que contiene el codigo que no es propio, osea las librerias de terceros como boostrap, jquery entre otras.

## Notas importantes

## Sobre la base de datos
```
# Crear la base de datos, se debe tener las credenciales en config/database.yml
bundle exec rake db:create

# Realizar cambios en la base de datos, se ejecutan una sola vez en orden de creacion los archivos en db/migrations
bundle exec rake db:migrate

# Este comando borra la base de datos
bundle exec rake db:drop
```

## Comandos mas usados

```bash
  # Crear nuevo proyecto
  rails new jpir --database=postgresql
  
  # Este comando crea una migracion y un modelo asociado a esta
  # La migracion indica un cambio en la base de datos.
  rails g model <nombre_del_modelo> <campo1>:<tipo_de_dato> <campo2>:<tipo_de_dato>
 
```

## Sobre el servidor de produccion

## Como probar los correos

## Sobre la plantilla

- Utilizamos slim para hacer html mas bonito y mas facil de leer

## Seguridad

- Utilizamos a Devise para manejar la parte del acceso al sistema, controla el registro, recuperacion de clave, cambio y sesiones.
- AASM es una gema para manejar la transicion entre un estado y otro, con esta colocamos las acciones que se deben dar para cambiar los estados y de que estado a cual se puede cambiar.
