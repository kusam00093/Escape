package com.escape.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.escape.board.domain.BoardVo;
import com.escape.board.domain.NewsVo;
import com.escape.board.domain.NoticeVo;
import com.escape.board.domain.QnaVo;
import com.escape.login.domain.User;

@Mapper
public interface BoardMapper {

	List<BoardVo> getPostingList(BoardVo boardVo);
	int getCount();
	

	List<NewsVo> getNewsList(NewsVo newsVo);
	int getNcount();
	

	List<QnaVo> getQnaList(QnaVo qnaVo);
	int getQcount();
	
	List<NoticeVo> getNoticeList(NoticeVo noticeVo);
	int getNocount();
	
	//void insertFriendwrite(BoardVo boardVo);
	BoardVo insertFriendwrite(Long board_idx);
	//void insertFriendwrite(BoardVo boardVo);
	
	//void getFriendview( BoardVo boardVo);
	List<BoardVo> getFriendview(BoardVo boardVo);
	BoardVo getFriendview(Long board_idx);
	
	void updatefriend(BoardVo boardVo);
	
	List<BoardVo> getFriendupdate(BoardVo boardVo);
	void deletefriend(BoardVo boardVo);
	
	void incHit(BoardVo boardVo);

	void insertQandawrite(QnaVo qnaVo);
	
	// 뉴스 조회수
	void updateNewsHit(Long news_idx);
	Long getNewsHit(Long news_idx);
	
	void selectUser(User user);
	void insertFriendwrite(BoardVo boardVo);
	List<User> getUserList(User user);
	User getUserId(int user_idx);
	
	void insertBoard(BoardVo boardVo);
	

	

	
	//int getHit();


}
