source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'
gem 'rails', '~> 5.2.2'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'pg' # Base de datos
gem 'whenever' # Cron Jobs para correr tareas a determinada hora
gem 'sidekiq' # Manejo de tareas en segundo plano
gem 'redis' # Base de datos en memoria para guardar tareas en segundo plano
gem 'devise' # Manejo de accesos de usuarios
gem 'cancan' # Manejo de permisos
gem 'slim-rails' # Hacer HTML mas legible
gem 'dotenv' # Gema para manejar claves y variables de la maquina
gem 'aasm' # Gema para manejar estados
gem 'font-awesome-rails'
gem "rails-settings-cached"

# Gemas solo para usar en la maquina local
group :development, :test do
  gem 'pry-rails' # Debug permite hacer paradas en el codigo y correr lineas de comando
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'letter_opener' # Probar correos en maquina local
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'erd' # Permite generar un diagrama de la base de datos
end
