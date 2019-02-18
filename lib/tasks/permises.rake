namespace 'permissions' do
  desc "Identifiar controladores para crear permisos"
  task(:permissions => :environment) do
    arr = []
    # Buscar la carpeta controladores y recorrer su contenido.
    controllers = Dir.new("#{Rails.root}/app/controllers").entries
    controllers.each do |entry|
      if entry =~ /_controller/
        # Solo necesitamos los archivos de ruby
        arr << entry.camelize.gsub('.rb', '').constantize
      elsif entry =~ /^[a-z]*$/ #Ingresar a sub directorios dentro de controladores
        Dir.new("#{Rails.root}/app/controllers/#{entry}").entries.each do |x|
          if x =~ /_controller/
            arr << "#{entry.titleize}::#{x.camelize.gsub('.rb', '')}".constantize
          end
        end
      end
    end

    arr.each do |controller|
      if controller.permission
        binding.pry
        write_permission(controller.permission, "manage", 'manage') #add permission to do CRUD for every model.
        controller.action_methods.each do |method|
          if method =~ /^([A-Za-z\d*]+)+([\w]*)+([A-Za-z\d*]+)$/
            name, cancan_action = eval_cancan_action(method)
            write_permission(controller.permission, cancan_action, name)
          end
        end
      end
    end
  end
end

# Identificar el nombre del permiso en el manejador de permisos CANCAN
def eval_cancan_action(action)
  case action.to_s
  when "index"
    name = 'list'
    cancan_action = "index"
    action_desc = I18n.t :list
  when "new", "create"
    name = 'create and update'
    cancan_action = "create"
    action_desc = I18n.t :create
  when "show"
    name = 'view'
    cancan_action = "view"
    action_desc = I18n.t :view
  when "edit", "update"
    name = 'create and update'
    cancan_action = "update"
    action_desc = I18n.t :update
  when "delete", "destroy"
    name = 'delete'
    cancan_action = "destroy"
    action_desc = I18n.t :destroy
  else
    name = action.to_s
    cancan_action = action.to_s
    action_desc = "Other: " < cancan_action
  end
  return name, cancan_action
end

# Buscar si el permiso existe o se crea
def write_permission(model, cancan_action, name)
  permission = Permise.find(:first, :conditions => ["subject_class = ? and action = ?", model, cancan_action])
  unless permission
    permission = Permise.new
    permission.name = name
    permission.object = model
    permission.method = cancan_action
    permission.save
  end
end