require "tilt"

def ask(question)
	print "#{question} "
	STDIN.gets.strip
end

def prompt(key, question = "#{key.to_s}:")
	value = ask question
	@template_variables.add(key, value)
end

def filter(engine, glob)
	files = Dir.glob(File.join(@template_path, glob), File::FNM_DOTMATCH)
	files.each do |file|
		@filter_files[engine] << file
	end
end

def ignore(glob)
	files = Dir.glob(File.join @template_path, glob)
	files.each do |file|
		@ignore_files << file
	end
end

def run_filters(filter_files, origin, target)
	filter_files.each do |engine, files|
		files.each do |file|
			run_filter engine, file, file.gsub(origin, target)
		end
	end
end

def run_filter(engine, source, target)
	template = get_template(engine, source)
	File.open target, "w" do |file|
		puts "#{engine}: #{source} to #{target}"
		file.write template.render(@template_variables)
	end
end

def get_template(engine, file)
	case engine
	when :erb
		Tilt::ERBTemplate.new(file)
	when :str
		Tilt::StringTemplate.new(file)
	when :erb
		Tilt::ERBTemplate.new(file)
	when :haml
		Tilt::HamlTemplate.new(file)
	when :sass
		Tilt::SassTemplate.new(file)
	when :scss
		Tilt::ScssTemplate.new(file)
	when :less
		Tilt::LessTemplate.new(file)
	when :builder
		Tilt::BuilderTemplate.new(file)
	when :liquid
		Tilt::LiquidTemplate.new(file)
	when :rdiscount
		Tilt::RDiscountTemplate.new(file)
	when :redcarpet
		Tilt::RedcarpetTemplate.new(file)
	when :bluecloth
		Tilt::BlueClothTemplate.new(file)
	when :kramdown
		Tilt::KramdownTemplate.new(file)
	when :maruku
		Tilt::MarukuTemplate.new(file)
	when :redcloth
		Tilt::RedClothTemplate.new(file)
	when :rdoc
		Tilt::RDocTemplate.new(file)
	when :radius
		Tilt::RadiusTemplate.new(file)
	when :markaby
		Tilt::MarkabyTemplate.new(file)
	when :nokogiri
		Tilt::NokogiriTemplate.new(file)
	when :coffeescript
		Tilt::CoffeeScriptTemplate.new(file)
	when :creole
		Tilt::CreoleTemplate.new(file)
	when :wikicloth
		Tilt::WikiClothTemplate.new(file)
	when :yajl
		Tilt::YajlTemplate.new(file)
	else
		puts "ERROR: filter #{engine} not supported!"
		puts "HALTING"
		exit
	end
end

class Context
	def initialize
		@storage = Hash.new
	end

	def add(key, value)
		@storage[key.to_sym] = value
	end

	def method_missing(key)
		@storage[key]
	end
end