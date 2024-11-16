package chat;

import java.util.Stack;

public class ChatRooms extends Stack{
	
	private String name;
	private String description;
	public ChatRooms (String s, String s1, int i) {
		
		name = s;
		description = s1;
		setSize(i);
		
	}
	public void joinchatEntry(ChatRoomEntry chatentry) {
		push(chatentry);
	}
	public String getDescription() {
		return description;
	}
	public String getName() {
		return name;
	}

}
