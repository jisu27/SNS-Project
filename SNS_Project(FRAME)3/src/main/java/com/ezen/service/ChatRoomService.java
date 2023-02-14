package com.ezen.service;

import java.util.List;

import com.ezen.dto.ChatRoomVO;

public interface ChatRoomService {
	public void insertChatRoom(ChatRoomVO vo);

	public void deleteChatRoom(ChatRoomVO vo);

	public List<ChatRoomVO> getChatRoomList(ChatRoomVO vo);

	public ChatRoomVO getChatRoom(ChatRoomVO vo);
}
