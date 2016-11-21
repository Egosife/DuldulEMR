package com.spring.sample.web.chat.dao;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.spring.sample.web.chat.bean.ChatBean;

@Repository
public class ChatDaoImpl implements IChatDao {
	@Autowired
	public SqlMapClient sqlMapClient;

	@Override
	public int getMaxNo() throws Throwable {
		return (int) sqlMapClient.queryForObject("chat.getMaxNo");
	}

	@Override
	public void insertChat(ChatBean chatBean) throws Throwable {
		sqlMapClient.insert("chat.insertChat", chatBean);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<ChatBean> getChatList(int lastChatNo) throws Throwable {
		return (ArrayList<ChatBean>) sqlMapClient.queryForList("chat.getChatList", lastChatNo);
	}
}
