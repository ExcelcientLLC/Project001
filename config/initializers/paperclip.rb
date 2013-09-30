require "paperclip"
 
case RbConfig::CONFIG['host_os']
    when /mswin|mingw/  # Windows
      if File.directory?('C:\Program Files (x86)')
        Paperclip.options[:command_path] = 'C:\Program Files (x86)\ImageMagick-6.8.5-Q16'
      else
        Paperclip.options[:command_path] = 'C:\Program Files\ImageMagick-6.8.5-Q16'
      end
end