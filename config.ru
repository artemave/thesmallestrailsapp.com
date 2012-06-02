%w(action_controller/railtie coderay).map &method(:require)

run Class.new(Rails::Application) {
  config.secret_token = routes.append { root to: 'hello#world' }.inspect
  initialize!
}

class HelloController < ActionController::Base
  def world
    render inline: "
      <!DOCTYPE html>
      <title>The Smallest Rails App</title>
      <h3>I am the smallest rails app!</h3>
      <p>Here is my source code:</p>
      #{CodeRay.scan_file(__FILE__, :ruby).div(line_numbers: :table)}
      <a href='http://goo.gl/YdRpy'>Make me smaller</a>
    "
  end
end
