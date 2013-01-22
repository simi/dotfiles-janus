require('bundler')
require('bundler/runtime')
::Bundler.configure
definition = ::Bundler::Definition.build('Gemfile', 'Gemfile.lock', nil)
runtime = ::Bundler::Runtime.new(Dir.pwd, definition)
paths = runtime.requested_specs.map(&:full_gem_path)
cmd = "find #{paths.join(' ').strip} -type f -name \\*.rb | ctags -f ./gems.tags -L -"
system(cmd)
print "Done! Be awesome!"
