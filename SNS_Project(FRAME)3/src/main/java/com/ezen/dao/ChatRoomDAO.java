package com.ezen.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.dto.ChatRoomVO;

@Repository
public class ChatRoomDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public void insertChatRoom(ChatRoomVO vo) {
		sqlSession.insert("chatRoomMapper.insertChatRoom", vo);
	}

	public void deleteChatRoom(ChatRoomVO vo) {
		sqlSession.delete("chatRoomMapper.deleteChatRoom", vo);
	}

	public List<ChatRoomVO> getChatRoomList(ChatRoomVO vo) {
		return sqlSession.selectList("chatRoomMapper.getChatRoomList", vo);
	}

	public ChatRoomVO getChatRoom(ChatRoomVO vo) {
		return sqlSession.selectOne("chatRoomMapper.getChatRoom", vo);
	}
}