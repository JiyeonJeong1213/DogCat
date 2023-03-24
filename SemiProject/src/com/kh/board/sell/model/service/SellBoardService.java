package com.kh.board.sell.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.board.sell.model.dao.SellBoardDao;

public class SellBoardService {

	public int insertSellBoard(Board b, ArrayList<Attachment> list) {
		Connection conn = getConnection();
		int result = new SellBoardDao().insertSellBoard(conn, b);
		int result2 = new SellBoardDao().insertAttachmentList(conn, list);
		
		if(result>0 && result2>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result * result2;
	}
}
