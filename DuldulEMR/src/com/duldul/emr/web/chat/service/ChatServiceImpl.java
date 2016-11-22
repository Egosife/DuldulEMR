package com.duldul.emr.web.chat.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duldul.emr.web.chat.bean.ChatBean;
import com.duldul.emr.web.chat.dao.IChatDao;

@Service
public class ChatServiceImpl implements IChatService {
	@Autowired
	public IChatDao iChatDao;

	@Override
	public int getMaxNo() throws Throwable {
		return iChatDao.getMaxNo();
	}

	@Override
	public void insertChat(ChatBean chatBean) throws Throwable {
		iChatDao.insertChat(chatBean);
	}

	@Override
	public ArrayList<ChatBean> getChatList(int lastChatNo) throws Throwable {
		return iChatDao.getChatList(lastChatNo);
	}
}
