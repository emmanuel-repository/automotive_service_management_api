# README

Hola!

Para el proyecto estas son los pasos que necesita para hacerlos correr:

    *Terner instalado ruby en la version:
        v3.4.1
    
    *Instalar ruby on rails:

        gem install rails

    *Verificar la instalacion

        rails --version
        
      Este proyecto se encuentra realizado en ruby on rail v8.0.0 

    * instalacion de dependemcias (gemas)

        bundle install

    * Si no se tiene la gema de bundle la puede instalar de esta manera:

        gem install bundler

    * Antes de ejecutar el servidor, proporcione un archivo para almacenar sus
        variables de entorno esta se encuentra guardado en

        config -> application.yml
        
        Este archivo tiene las variables para la configuracion de base de datos
    
    * Ademas del archivo database.yml y secrets.yml, este ultimo se ocupa para cifrar 
        jwt.

    * Ejecutamos el comando de rails para realiza la migracion de base de datos

        rails db:migrate

        por si algun motivo no se puede realizar la migracion adjunte el script 
        de base de datos en la carpeta de db.

    * configuramos Cors, para esta configuracion se encuentra en la carpeta:

        config -> initializer -> cors.rb

            Rails.application.config.middleware.insert_before 0, Rack::Cors do
            allow do
            origins ENV['url_cors'] || '' # Cambia esto al dominio permitido
            
                resource '*',
                         headers: :any,
                         methods: [:get, :post, :put, :patch, :delete, :options, :head]
            end
            end

        y en el archivo application.yml esta la variabe de ENV['url_cors'] y agregar la 
        url desde donde quiere usar los recursos.

    * Por ultimo levantamos el servidor
        
        
    


