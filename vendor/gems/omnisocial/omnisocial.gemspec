# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{omnisocial}
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tim Riley"]
  s.date = %q{2010-10-13}
  s.description = %q{Twitter and Facebook logins for your Rails application.}
  s.email = %q{tim@openmonkey.com}
  s.files = ["README.md", "lib/extensions/action_controller/base.rb", "lib/generators/omnisocial/omnisocial_generator.rb", "lib/generators/omnisocial/templates/assets/images/facebook.png", "lib/generators/omnisocial/templates/assets/images/signin_facebook.png", "lib/generators/omnisocial/templates/assets/images/signin_twitter.png", "lib/generators/omnisocial/templates/assets/images/twitter.gif", "lib/generators/omnisocial/templates/assets/stylesheets/omnisocial.css", "lib/generators/omnisocial/templates/migration.rb", "lib/generators/omnisocial/templates/omnisocial.rb", "lib/generators/omnisocial/templates/README", "lib/generators/omnisocial/templates/user.rb", "lib/omnisocial/engine.rb", "lib/omnisocial/service_config.rb", "lib/omnisocial/version.rb", "lib/omnisocial.rb", "app/controllers/omnisocial/auth_controller.rb", "app/helpers/omnisocial/auth_helper.rb", "app/models/omnisocial/facebook_account.rb", "app/models/omnisocial/login_account.rb", "app/models/omnisocial/twitter_account.rb", "app/models/omnisocial/user.rb", "app/views/omnisocial/auth/new.html.erb", "config/routes.rb"]
  s.homepage = %q{http://github.com/icelab/omnisocial}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Twitter and Facebook logins for your Rails application.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<oa-core>, ["~> 0.1.2"])
      s.add_runtime_dependency(%q<oa-oauth>, ["~> 0.1.2"])
      s.add_runtime_dependency(%q<bcrypt-ruby>, ["~> 2.1"])
    else
      s.add_dependency(%q<oa-core>, ["~> 0.1.2"])
      s.add_dependency(%q<oa-oauth>, ["~> 0.1.2"])
      s.add_dependency(%q<bcrypt-ruby>, ["~> 2.1"])
    end
  else
    s.add_dependency(%q<oa-core>, ["~> 0.1.2"])
    s.add_dependency(%q<oa-oauth>, ["~> 0.1.2"])
    s.add_dependency(%q<bcrypt-ruby>, ["~> 2.1"])
  end
end
