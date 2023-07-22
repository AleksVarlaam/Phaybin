# frozen_string_literal: true

namespace :fly do
  desc 'Start'
  task :start do
    sh 'fly ssh console --pty -C "/rails/bin/rails admin:start"'
  end

  task :console do
    sh 'fly ssh console --pty -C "/rails/bin/rails console"'
  end

  task :dbconsole do
    sh 'fly ssh console --pty -C "/rails/bin/rails dbconsole"'
  end

  task :tmp_clear do
    sh 'fly ssh console --pty -C "/rails/bin/rails tmp:clear"'
  end

  task :assets_clean do
    sh 'fly ssh console --pty -C "/rails/bin/rails assets:clean"'
  end

  task :assets_clobber do
    sh 'fly ssh console --pty -C "/rails/bin/rails assets:clobber"'
  end

  task :assets_precompile do
    sh 'fly ssh console --pty -C "/rails/bin/rails assets:precompile"'
  end
end
