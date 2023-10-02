require "socket"

class PLCService

  def send_udp_command(command)
    udp_socket = UDPSocket.new(Socket::AF_INET)
    # command = "incoming"
    begin
      udp_socket.send(command, 0, @plc_ip, @plc_port)

      puts "Command sent successfully to #{@plc_ip}:#{@plc_port}: #{command}!"
    rescue => e
      puts "Error #{e.message}"
    ensure
      udp_socket.close if udp_socket
    end
  end
end