require 'socket'

class RArtNet

   UDP_RECV_TIMEOUT  = 3  # seconds
   ART_NET_ID = "Art-Net" << 0.chr

   OpOutput = 0.chr << 0x50.chr
   ProtVerH = 0
   ProtVer = 14
   Sequence = 0
   Physical = 0
   Universe = 0.chr << 0.chr
   LengthHi = 2
   Length = 0

   def initialize(local_ip, server_ip, port = 6454)
     @local = local_ip
     @server = server_ip
     @port = port
   end

   def artdmx(channel_data)
      header =  '' << ART_NET_ID << OpOutput << ProtVerH << ProtVer << Sequence << Physical << Universe << LengthHi << Length
      cmd = header << channel_data
      send(cmd)
   end

   def send(cmd_str)
      resp, sock = nil, nil
      begin
         sock = UDPSocket.open
         sock.bind(@local, @port)
         sock.send(cmd_str, 0, @server, @port)
      rescue IOError, SystemCallError
      ensure
         sock.close if sock
      end
   end

end

