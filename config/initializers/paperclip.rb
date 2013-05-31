require "paperclip"
 
case Config::CONFIG['host_os']
    when /mswin|mingw/  # Windows
        Paperclip.options[:command_path] = 'C:\Program Files (x86)\ImageMagick-6.8.5-Q16'
end