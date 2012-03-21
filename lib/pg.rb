def ask(question)
	print "#{question} "
	STDIN.gets.strip
end

def prompt(key, question = "#{key.to_s}:")
	value = ask question
	@template_variables.add(key, value)
end

def filter(engine, glob)
	files = Dir.glob(File.join @template_path, glob)
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