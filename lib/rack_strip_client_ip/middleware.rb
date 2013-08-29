module RackStripClientIp
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      @app.call(strip_client_ip_header(env))
    end

    private

    def strip_client_ip_header(env)
      env.reject {|key, _| key.upcase == "HTTP_CLIENT_IP" }
    end
  end
end
