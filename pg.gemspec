Gem::Specification.new do |s|
	s.name = "project-generator"
	s.version = "0.1.0a"
	s.date = "2012-03-20"
	s.description = "A project generation script."
	s.summary = "A project generation script. Projects are generated using templates stored in the user's home directory."
	s.authors = ["Kenneth Powers"]
	s.email = ["mail@kenpowers.net"]
	s.files = ["lib/pg.rb", "bin/pg", "bin/.pg/sample/.dotfile", "bin/.pg/sample/.pgconfig.rb", "bin/.pg/sample/CHANGELOG.txt", "bin/.pg/sample/index.html"]
	s.homepage = "http://kenpowers.net"
	s.executables << "pg"

	s.add_dependency("tilt")
end