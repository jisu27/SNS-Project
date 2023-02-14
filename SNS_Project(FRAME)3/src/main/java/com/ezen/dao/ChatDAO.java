package com.ezen.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.dto.ChatVO;

@Repository
public class ChatDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public void insertPrivateChat(ChatVO vo) {
		sqlSession.insert("insertPrivateChat", vo);
	}

	public void insertRoomChat(ChatVO vo) {
		sqlSession.insert("insertRoomChat", vo);
	}

	public void deleteChat(ChatVO vo) {
		sqlSession.delete("deleteChat", vo);
	}

	public List<ChatVO> getPrivateChatList(ChatVO vo) {
		return sqlSession.selectList("getPrivateChatList", vo);
	}

	public List<ChatVO> getRoomChatList(ChatVO vo) {
		return sqlSession.selectList("getRoomChatList", vo);
	}

	public List<ChatVO> getChatList(ChatVO vo) {
		return sqlSession.selectList("getChatList", vo);
	}
	
	public ChatVO getChat(ChatVO vo) {
		return sqlSession.selectOne("getChat", vo);
	}

	public int insertChat(ChatVO vo) {
		return sqlSession.insert("insertChat", vo);
	}
}