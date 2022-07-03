import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/websocket")
public class WebSocket {
	@OnOpen
	public void handleOpen() {
		System.out.println("client is now connected...");
	}
	
	@OnMessage
	public String handleMessage(String message) {
		System.out.println("receive from client : " + message);
		String replymessage = "echo " + message;
		System.out.println("send to client : " +replymessage);
		return replymessage;
	}
	
	@OnClose
	public void handleClose() {
		System.out.println("client is now disconnected...");
	}
	
	@OnError
	public void handleError(Throwable ex) {
		ex.printStackTrace();
	}
}
