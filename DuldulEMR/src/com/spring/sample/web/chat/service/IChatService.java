package com.spring.sample.web.chat.service;

import java.util.ArrayList;

import com.spring.sample.web.chat.bean.ChatBean;

public interface IChatService {

	public int getMaxNo() throws Throwable;

	public void insertChat(ChatBean chatBean) throws Throwable;

	public ArrayList<ChatBean> getChatList(int lastChatNo) throws Throwable;

}
