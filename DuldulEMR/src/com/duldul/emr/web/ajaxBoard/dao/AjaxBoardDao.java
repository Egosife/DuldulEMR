package com.duldul.emr.web.ajaxBoard.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.duldul.emr.web.ajaxBoard.bean.AjaxBoardBean;

@Repository
public class AjaxBoardDao implements IAjaxBoardDao {
	@Autowired
	public SqlMapClient sqlMapClient;

	@Override
	public void insertBoard(AjaxBoardBean abb) throws Throwable {
		sqlMapClient.insert("ajaxBoard.insertBoard", abb);
	}
	
	@Override
	public int getBoardCount(HashMap<String, Object> params) throws Throwable {
		return (int) sqlMapClient.queryForObject("ajaxBoard.getBoardCount", params);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<AjaxBoardBean> getBoardList(HashMap<String, Object> params)
			throws Throwable {
		return (ArrayList<AjaxBoardBean>) sqlMapClient.queryForList("ajaxBoard.getBoardList", params);
	}

	@Override
	public AjaxBoardBean getBoardDetail(String boardNo) throws Throwable {
		return (AjaxBoardBean) sqlMapClient.queryForObject("ajaxBoard.getBoardDetail", boardNo);
	}

	@Override
	public void updateHitCnt(String boardNo) throws Throwable {
		sqlMapClient.update("ajaxBoard.updateHitCnt", boardNo);
	}

	@Override
	public String checkPass(AjaxBoardBean abb) throws Throwable {
		return (String) sqlMapClient.queryForObject("ajaxBoard.checkPass", abb);
	}

	@Override
	public void updateBoard(AjaxBoardBean abb) throws Throwable {
		sqlMapClient.update("ajaxBoard.updateBoard", abb);
	}

	@Override
	public void deleteBoard(AjaxBoardBean abb) throws Throwable {
		sqlMapClient.delete("ajaxBoard.deleteBoard", abb);
	}
}
