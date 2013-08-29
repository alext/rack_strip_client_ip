require 'spec_helper'
require 'rack/test'

require 'rack_strip_client_ip'

describe RackStripClientIp::Middleware do
  include Rack::Test::Methods

  def app
    RackStripClientIp::Middleware.new( proc {|env| @inner_app_env = env.dup; [200, {}, "Inner app response"] } )
  end

  it "should pass the request to the inner app" do
    get "/"
    expect(last_response.status).to eq(200)
    expect(last_response.body).to match(/Inner app response/)
    expect(@inner_app_env).not_to be_nil
  end

  it "should remove the Client-Ip header" do
    get "/", {}, {"HTTP_CLIENT_IP" => "1.2.3.4"}
    expect(@inner_app_env["HTTP_CLIENT_IP"]).to be_nil
  end

  it "should match the Client-Ip header in a case-insensitive manner" do
    get "/", {}, {"HtTp_CLieNT_Ip" => "1.2.3.4"}
    expect(@inner_app_env["HtTp_CLieNT_Ip"]).to be_nil
  end

  it "should pass other headers through unmodified" do
    get "/", {}, {"HTTP_CLIENT_IP" => "1.2.3.4", "Foo" => "bar"}
    expect(@inner_app_env["Foo"]).to eq("bar")
  end
end
