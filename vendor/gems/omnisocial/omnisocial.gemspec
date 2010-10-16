--- !ruby/object:Gem::Specification 
name: omnisocial
version: !ruby/object:Gem::Version 
  prerelease: false
  segments: 
  - 0
  - 1
  - 2
  version: 0.1.2
platform: ruby
authors: 
- Tim Riley
autorequire: 
bindir: bin
cert_chain: []

date: 2010-10-13 00:00:00 +11:00
default_executable: 
dependencies: 
- !ruby/object:Gem::Dependency 
  name: oa-core
  prerelease: false
  requirement: &id001 !ruby/object:Gem::Requirement 
    none: false
    requirements: 
    - - ~>
      - !ruby/object:Gem::Version 
        segments: 
        - 0
        - 1
        - 2
        version: 0.1.2
  type: :runtime
  version_requirements: *id001
- !ruby/object:Gem::Dependency 
  name: oa-oauth
  prerelease: false
  requirement: &id002 !ruby/object:Gem::Requirement 
    none: false
    requirements: 
    - - ~>
      - !ruby/object:Gem::Version 
        segments: 
        - 0
        - 1
        - 2
        version: 0.1.2
  type: :runtime
  version_requirements: *id002
- !ruby/object:Gem::Dependency 
  name: bcrypt-ruby
  prerelease: false
  requirement: &id003 !ruby/object:Gem::Requirement 
    none: false
    requirements: 
    - - ~>
      - !ruby/object:Gem::Version 
        segments: 
        - 2
        - 1
        version: "2.1"
  type: :runtime
  version_requirements: *id003
description: Twitter and Facebook logins for your Rails application.
email: tim@openmonkey.com
executables: []

extensions: []

extra_rdoc_files: []

files: 
- README.md
- lib/extensions/action_controller/base.rb
- lib/generators/omnisocial/omnisocial_generator.rb
- lib/generators/omnisocial/templates/assets/images/facebook.png
- lib/generators/omnisocial/templates/assets/images/signin_facebook.png
- lib/generators/omnisocial/templates/assets/images/signin_twitter.png
- lib/generators/omnisocial/templates/assets/images/twitter.gif
- lib/generators/omnisocial/templates/assets/stylesheets/omnisocial.css
- lib/generators/omnisocial/templates/migration.rb
- lib/generators/omnisocial/templates/omnisocial.rb
- lib/generators/omnisocial/templates/README
- lib/generators/omnisocial/templates/user.rb
- lib/omnisocial/engine.rb
- lib/omnisocial/service_config.rb
- lib/omnisocial/version.rb
- lib/omnisocial.rb
- app/controllers/omnisocial/auth_controller.rb
- app/helpers/omnisocial/auth_helper.rb
- app/models/omnisocial/facebook_account.rb
- app/models/omnisocial/login_account.rb
- app/models/omnisocial/twitter_account.rb
- app/models/omnisocial/user.rb
- app/views/omnisocial/auth/new.html.erb
- config/routes.rb
has_rdoc: true
homepage: http://github.com/icelab/omnisocial
licenses: []

post_install_message: 
rdoc_options: []

require_paths: 
- lib
required_ruby_version: !ruby/object:Gem::Requirement 
  none: false
  requirements: 
  - - ">="
    - !ruby/object:Gem::Version 
      segments: 
      - 0
      version: "0"
required_rubygems_version: !ruby/object:Gem::Requirement 
  none: false
  requirements: 
  - - ">="
    - !ruby/object:Gem::Version 
      segments: 
      - 0
      version: "0"
requirements: []

rubyforge_project: 
rubygems_version: 1.3.7
signing_key: 
specification_version: 3
summary: Twitter and Facebook logins for your Rails application.
test_files: []


