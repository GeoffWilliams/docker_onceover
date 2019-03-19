FROM ruby:2.3.5
RUN apt-get update && apt-get install -y build-essential cmake

# capture the list of gems from your bundle...
# bundle list | sed 's/(/--version /g' | tr -d ')' | sed 's/*/gem install/g' | sed 's/$/ \&\& \\/'
RUN   gem install backticks --version 1.0.2 && \
  gem install blockenspiel --version 0.5.0 && \
  gem install bundler --version 1.16.6 && \
  gem install coderay --version 1.1.2 && \
  gem install colored --version 1.2 && \
  gem install cri --version 2.15.3 && \
  gem install deep_merge --version 1.2.1 && \
  gem install diff-lcs --version 1.3 && \
  gem install facter --version 2.5.1 && \
  gem install faraday --version 0.13.1 && \
  gem install faraday_middleware --version 0.12.2 && \
  gem install fast_gettext --version 1.1.2 && \
  gem install gettext --version 3.2.9 && \
  gem install gettext-setup --version 0.30 && \
  gem install git --version 1.5.0 && \
  gem install hiera --version 3.5.0 && \
  gem install json --version 2.2.0 && \
  gem install little-plugger --version 1.1.4 && \
  gem install locale --version 2.1.2 && \
  gem install log4r --version 1.1.10 && \
  gem install logging --version 2.2.2 && \
  gem install metaclass --version 0.0.4 && \
  gem install method_source --version 0.9.2 && \
  gem install minitar --version 0.8 && \
  gem install mocha --version 1.8.0 && \
  gem install multi_json --version 1.13.1 && \
  gem install multipart-post --version 2.0.0 && \
#  gem install onceover --version 3.12.1 && \
  gem install onceover-codequality --version 0.4.2 && \
  gem install onceover-lookup --version 0.1.1 && \
  gem install parallel --version 1.14.0 && \
  gem install parallel_tests --version 2.28.0 && \
  gem install pathspec --version 0.2.1 && \
  gem install pry --version 0.12.2 && \
  gem install puppet --version 5.5.3 && \
  gem install puppet-lint --version 2.3.6 && \
  gem install puppet-strings --version 2.1.0 && \
  gem install puppet-syntax --version 2.4.3 && \
  gem install puppet_forge --version 2.2.9 && \
  gem install puppetlabs_spec_helper --version 2.13.1 && \
  gem install r10k --version 3.1.1 && \
  gem install rake --version 12.3.2 && \
  gem install rgen --version 0.8.2 && \
  gem install rspec --version 3.8.0 && \
  gem install rspec-core --version 3.8.0 && \
  gem install rspec-expectations --version 3.8.2 && \
  gem install rspec-mocks --version 3.8.0 && \
  gem install rspec-puppet --version 2.7.3 && \
  gem install rspec-support --version 3.8.0 && \
  gem install rspec_junit_formatter --version 0.4.1 && \
  gem install rugged --version 0.28.1 && \
  gem install semantic_puppet --version 1.0.2 && \
  gem install table_print --version 1.5.6 && \
  gem install text --version 1.3.1 && \
  gem install versionomy --version 0.5.0 && \
  gem install yard --version 0.9.18

# Fix for https://github.com/dylanratcliffe/onceover/issues/207
RUN cd /root && \
  git clone https://github.com/geoffwilliams/onceover && \
  cd onceover && \
  git checkout fix_ut8err && \
  gem build onceover.gemspec && \
  gem install onceover-3.12.1.gem

# you must unset BUNDLER_VERSION `docker run ... -e BUNDLER_VERSION` when you run
# or bundler 1x will be forced...

VOLUME /shared
