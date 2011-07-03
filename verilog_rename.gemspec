
NAME="verilog-rename"

Dir.chdir( './lib/')
puts require NAME
Dir.chdir( './../')

spec = Gem::Specification.new do |s|
   s.name         = NAME
   s.version      = Verilog::VERSION
   s.platform     = Gem::Platform::RUBY
   s.summary      = 'Extension to the verilog gem for renaming verilog files'
   s.homepage     = "http://amaras-tech.co.uk/software/#{NAME}"
   s.authors      = "Morgan Prior"
   s.email        = "#{NAME}_gem@amaras-tech.co.uk"
   s.description  = %{Extension to the verilog gem, adds rename functionality and updates instatiations}
   s.files        = [Dir.glob("LICENSE.rtf")]
   s.files        += Dir.glob("README.md")
   s.files        += Dir.glob("HISTORY.md")
   s.files        += Dir.glob("Rakefile")
   s.files        += Dir.glob("lib/**/*")
   s.files        += Dir.glob("spec/**/*")
   s.has_rdoc     = false

end

