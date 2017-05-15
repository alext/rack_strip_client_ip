module RackStripClientIp
  class Railtie < Rails::Railtie
    initializer "rack_strip_client_ip.insert_middleware" do |app|
      if Rails::VERSION::MAJOR >= 5
        app.config.middleware.insert_before 0, RackStripClientIp::Middleware
      else
        app.config.middleware.insert_before 0, "RackStripClientIp::Middleware"
      end
    end
  end
end
