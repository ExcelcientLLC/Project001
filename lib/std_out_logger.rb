###################################
# RAILS_ROOT/lib/std_out_logger
###################################
class StdOutLogger
  public
  def write(s)
    f = File.open("log/stdout.log", "w+")
    f.puts s.inspect
    f.close
  end
  
  def print(s)
    f = File.open("log/stdout.log", "w+")
    f.puts s.inspect
    f.close
  end
end