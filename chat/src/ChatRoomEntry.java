package chat;

public class ChatRoomEntry {
	
	private String profileName;
	private String message;
	public ChatRoomEntry(String s, String s1) {
		profileName = s;
		message = s1;
	}
	public String getProfileName() {
		return profileName;
	}
	public void setProfileName(String s) {
		profileName = s;
	}
	public String getMessage() {
		return message;
	}

}
