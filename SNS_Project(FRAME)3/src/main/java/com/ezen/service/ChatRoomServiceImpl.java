package com.ezen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.dao.ChatRoomDAO;
import com.ezen.dto.ChatRoomVO;

@Service
public class ChatRoomServiceImpl implements ChatRoomService {
	@Autowired
	ChatRoomDAO crDAO;

	@Override
	public void insertChatRoom(ChatRoomVO vo) {
		crDAO.insertChatRoom(vo);
	}

	@Override
	public void deleteChatRoom(ChatRoomVO vo) {
		crDAO.deleteChatRoom(vo);
	}

	@Override
	public List<ChatRoomVO> getChatRoomList(ChatRoomVO vo) {
		return crDAO.getChatRoomList(vo);
	}

	@Override
	public ChatRoomVO getChatRoom(ChatRoomVO vo) {
		return crDAO.getChatRoom(vo);
	}

}
