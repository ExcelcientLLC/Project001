require 'std_out_logger'

class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # Comment this out to allow logging to stdout/stderr
  # This is added, because Windows services have no stdout/stderr
  before_filter {
    #$stdout = $stderr = StdOutLogger.new
  }
end
