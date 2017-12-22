package com.metro.udp;

import java.io.IOException;
import java.net.InetSocketAddress;
import org.apache.mina.core.buffer.IoBuffer;
import org.apache.mina.core.service.IoHandlerAdapter;
import org.apache.mina.core.session.IdleStatus;
import org.apache.mina.core.session.IoSession;
import org.apache.mina.transport.socket.DatagramSessionConfig;
import org.apache.mina.transport.socket.nio.NioDatagramAcceptor;
import org.springframework.beans.factory.annotation.Autowired;
import com.metro.service.SystemService;


public class UdpServer extends IoHandlerAdapter {
	@Autowired
	SystemService systemService;
	
	NioDatagramAcceptor acceptor;
	private final int UDP_PORT = 5555;
	
	public void initUdpServer() throws IOException {
		this.acceptor = new NioDatagramAcceptor();
		this.acceptor.setHandler(this);
		DatagramSessionConfig datagramSessionConfig = this.acceptor.getSessionConfig();
		
		datagramSessionConfig.setReuseAddress(true);
		this.acceptor.bind(new InetSocketAddress(UDP_PORT));
		
		System.out.println("init udp server...");
	}
	
    public void disposeUdpServer() {
        try {
            if (acceptor != null) {
                acceptor.dispose();
            }
        } catch (Exception exception){
        	exception.printStackTrace();
        }
    }
	
	@Override
	public void exceptionCaught(IoSession session, Throwable cause) 
					throws Exception {
		cause.printStackTrace();
		session.closeNow();
	}
	
	@Override
	public void messageReceived(IoSession session, Object message) 
					throws Exception {               
        // System.out.println("message received...");
		
		if ((message instanceof IoBuffer) == false) {
			return;
        }
        
        byte[] data = ((IoBuffer)message).array();
                
        // some code the check if the data is valid        
        if (DatagramPacketCheck.isProcessFrame(data)) {
        	System.out.println("process frame");
        } else if (DatagramPacketCheck.isFaultFrame(data)) {
        	System.out.println("fault frame");
        	
        	FeedbackFrame frame = new FeedbackFrame();
        	
        	frame.setProjectCode((byte)1);
        	frame.setWirelessDeviceCode(0);
        	frame.setSourceDeviceCode((byte)2);
        	frame.setSinkDeviceCode((byte)3);
        	frame.setSourcePort((byte)2);
        	frame.setSinkPort((byte)4);
        	frame.setFeedbackFlag((byte)0);
        	frame.setMetroCodeFlag((byte)0);
        	frame.setMessageType(0x0201);
        	frame.setDataLength(2);
        	frame.setData(0x0708);
        	frame.setCrc16();
           
        	session.write(IoBuffer.wrap(frame.getFrame()));
        } else {
        	System.out.println("illegal message type");
        }
	}
	
	@Override
	public void sessionClosed(IoSession session) 
					throws Exception {
		System.out.println("session closed...");
	}
	
	@Override
	public void sessionCreated(IoSession session)
					throws Exception {
		System.out.println("session created...");
	}
	
	@Override
	public void sessionIdle(IoSession session, IdleStatus status)
					throws Exception {
		System.out.println("session opened...");
	}
}