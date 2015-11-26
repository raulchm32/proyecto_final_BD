require 'rails/all'
require 'pdfkit'
require File.expand_path('../boot', __FILE__)
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
# Bower asset paths


module SampleApp
  class Application < Rails::Application
    root.join('vendor', 'assets', 'bower_components').to_s.tap do |bower_path|
      config.sass.load_paths << bower_path
      config.assets.paths << bower_path 
    end
# Precompile Bootstrap fonts
    config.assets.precompile << %r(bootstrap-sass-official/assets/fonts/bootstrap/[\w-]+\.(?:eot|svg|ttf|woff2?)$)
# Minimum Sass number precision required by bootstrap-sass
    ::Sass::Script::Value::Number.precision = [8, ::Sass::Script::Value::Number.precision].max
    config.active_record.raise_in_transactional_callbacks = true
    config.exceptions_app = self.routes
    config.middleware.use PDFKit::Middleware, :print_media_type => true
  end
end
