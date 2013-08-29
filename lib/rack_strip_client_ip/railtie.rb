module RackStripClientIp
  class Railtie < Rails::Railtie
    initializer "rack_strip_client_ip.insert_middleware" do |app|
      app.config.middleware.insert_before 0, "RackStripClientIp::Middleware"
    end
  end
end
