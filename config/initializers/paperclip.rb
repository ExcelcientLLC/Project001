require "paperclip"
 
Paperclip.options[:command_path] = 'C:\Program Files (x86)\ImageMagick-6.8.5-Q16'
Paperclip.options[:swallow_stderr] = false

puts Paperclip.options[:command_path]

case Config::CONFIG['host_os']
    when /mswin|mingw/  # Windows
        Paperclip.options[:command_path] = 'C:\Program Files (x86)\ImageMagick-6.8.5-Q16'
end

class Paperclip::CommandLine
  def full_path(binary)
    [self.class.path, binary].compact.join((File::ALT_SEPARATOR||File::SEPARATOR))
  end
end if defined?(Paperclip::CommandLine)