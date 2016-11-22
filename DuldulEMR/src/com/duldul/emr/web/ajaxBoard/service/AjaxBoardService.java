package com.duldul.emr.web.ajaxBoard.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duldul.emr.web.ajaxBoard.bean.AjaxBoardBean;
import com.duldul.emr.web.ajaxBoard.dao.IAjaxBoardDao;

@Service
public class AjaxBoardService implements IAjaxBoardService {
	@Autowired
	public IAjaxBoardDao iAjaxBoardDao;

	@Override
	public void insertBoard(AjaxBoardBean abb) throws Throwable {
		iAjaxBoardDao.insertBoard(abb);
	}

	@Override
	public int getBoardCount(HashMap<String, Object> params) throws Throwable {
		return iAjaxBoardDao.getBoardCount(params);
	}
	
	@Override
	public ArrayList<AjaxBoardBean> getBoardList(HashMap<String, Object> params)
			throws Throwable {
		return iAjaxBoardDao.getBoardList(params);
	}

	@Override
	public AjaxBoardBean getBoardDetail(String boardNo) throws Throwable {
		return iAjaxBoardDao.getBoardDetail(boardNo);
	}

	@Override
	public void updateHitCnt(String boardNo) throws Throwable {
		iAjaxBoardDao.updateHitCnt(boardNo);
	}

	@Override
	public String checkPass(AjaxBoardBean abb) throws Throwable {
		return iAjaxBoardDao.checkPass(abb);
	}

	@Override
	public void updateBoard(AjaxBoardBean abb) throws Throwable {
		iAjaxBoardDao.updateBoard(abb);
	}

	@Override
	public void deleteBoard(AjaxBoardBean abb) throws Throwable {
		iAjaxBoardDao.deleteBoard(abb);
	}
}
