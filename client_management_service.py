
import os
import servicemanager
import subprocess
import socket
import time
import win32serviceutil
import win32service
import win32event

__server_name__ = "Client Management Server"

class ProsperionClientManagementServerService (win32serviceutil.ServiceFramework):
    _svc_name_ = __server_name__
    _svc_display_name_ = __server_name__
    _svc_description_ = "Prosperion {0} from Excelcient LLC".format(__server_name__)
    
    PROSPERION_DIR = r"C:\{0}".format(__server_name__.replace(' ', ''))
    RUBY_BIN_DIR = r"C:\RailsInstaller\Ruby1.9.3\bin"

    def __init__(self,args):
        win32serviceutil.ServiceFramework.__init__(self,args)
        self.hWaitStop = win32event.CreateEvent(None,0,0,None)
        socket.setdefaulttimeout(60)
        self.running = True
        self.process = None

    def SvcStop(self):
        self.ReportServiceStatus(win32service.SERVICE_STOP_PENDING)
        win32event.SetEvent(self.hWaitStop)
        self.writeToFile("Stopping Process")
        self.running = False
        if self.process is not None:
            pid_filename = os.path.join(self.PROSPERION_DIR, r"tmp\pids\server.pid")
            pid_file = open(pid_filename)
            pid = pid_file.readlines()[0].strip()
            pid_file.close()
            self.writeToFile("Process Killed: {0}".format(pid))
            subprocess.call(["taskkill", "/F", "/T", "/PID", "{0}".format(pid)])
            self.writeToFile("Process Killed")
            os.remove(pid_filename)
        self.stdoutFile.close()
        self.stderrFile.close()

    def SvcDoRun(self):
        servicemanager.LogMsg(servicemanager.EVENTLOG_INFORMATION_TYPE,
                              servicemanager.PYS_SERVICE_STARTED,
                              (self._svc_name_,''))
        self.stdoutFile = open(os.path.join(self.PROSPERION_DIR, r"log\service.stdout.log"), 'w')
        self.stderrFile = open(os.path.join(self.PROSPERION_DIR, r"log\service.stderr.log"), 'w')
        self.main()

    def main(self):
        self.writeToFile("Starting main")
        os.chdir(self.PROSPERION_DIR)
        self.writeToFile("Changed directory")
        self.process = subprocess.Popen([os.path.join(self.RUBY_BIN_DIR, "rails.bat"), "server", "mongrel"], stdin=subprocess.PIPE, stdout=self.stdoutFile, stderr=self.stderrFile)
        self.writeToFile("Started Rails Process")
        self.running = True
        while self.running:
            self.process.wait()
        
    def writeToFile(self, line):
        self.stdoutFile.write("{0}\n".format(line))

if __name__ == '__main__':
    win32serviceutil.HandleCommandLine(ProsperionClientManagementServerService )