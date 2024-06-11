package com.escape.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.escape.board.domain.BoardVo;
import com.escape.board.domain.CommentVo;
import com.escape.board.domain.NewsVo;
import com.escape.board.domain.NoticeVo;
import com.escape.board.domain.QnaVo;
import com.escape.board.mapper.BoardMapper;
import com.escape.board.mapper.CommentMapper;

@Controller
@RequestMapping("/Board")
public class BoardController {
	
	@Autowired
	private BoardMapper boardMapper;

	@Autowired
	private CommentMapper commentMapper;

	
	@RequestMapping("/Boardhome")
	public  ModelAndView   boardhome(BoardVo boardVo, NewsVo newsVo, QnaVo qnaVo, NoticeVo noticeVo
		//	,@RequestParam(value="news_idx") Long news_idx
			) {
		
		
		/*
		List<JoinVo> postingList = postingMapper.getPostingList();
		int count = postingMapper.getCount();
		*/
		
		List<BoardVo> postingList  = boardMapper.getPostingList(boardVo);
		int count = boardMapper.getCount();
	//	int hit = boardMapper.getHit();
		
		List<NewsVo> newsList = boardMapper.getNewsList(newsVo);
		int ncount = boardMapper.getNcount();
		// 뉴스 조회수
	//	boardMapper.updateNewsHit(newsVo);
		
		List<QnaVo> qnaList = boardMapper.getQnaList(qnaVo);
		int qcount = boardMapper.getQcount();
		
		List<NoticeVo> noticeList = boardMapper.getNoticeList(noticeVo);
		int nocount = boardMapper.getNocount();
		
		
		
		ModelAndView mv = new ModelAndView();
		// mv.addObject("user",userVo);
	//	mv.addObject("news_idx", news_idx);
		mv.addObject("board",boardVo);
		mv.addObject("news",newsVo);
		mv.addObject("qna",qnaVo);
		mv.addObject("notice",noticeVo);
		
		mv.addObject("postingList",postingList);
		mv.addObject("newsList",newsList);
		mv.addObject("qnaList",qnaList);
		mv.addObject("noticeList",noticeList);
		
		mv.addObject("count",count);
		mv.addObject("ncount",ncount);
		mv.addObject("qcount",qcount);
		mv.addObject("nocount",nocount);
		
		mv.setViewName("board/boardhome");
		return mv;
	}
	
	
	// 친구 구하기 글 작성
	@RequestMapping(value = "/FriendWriteForm", method = RequestMethod.GET)
    public ModelAndView friendWriteForm() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("board/friendWrite");
        return mv;
    }
    
    @RequestMapping(value = "/FriendWrite", method = RequestMethod.POST)
    public ModelAndView friendWrite(BoardVo boardVo) {
    	
        System.out.println("Received BoardVo: " + boardVo); // 디버깅 로그 추가
        
        boardMapper.insertFriendwrite(boardVo);
        
        ModelAndView mv = new ModelAndView();
        mv.addObject("boardVo", boardVo);
        mv.setViewName("redirect:/Board/Boardhome");
        return mv;
    }
	
	// 친구 구하기 리스트
	@RequestMapping("/FriendView")
	public ModelAndView friendView(@RequestParam(value="board_idx") Long board_idx) {
		//@RequestParam(value="board_idx", required = true) Long board_idx
		 System.out.println("=========================board_idx:" + board_idx);
		
		//System.out.println("=========================board:" + boardVo);

		//boardMapper.getFriendview(boardVo);
		//List<BoardVo> boardView = boardMapper.getFriendview(boardVo);
		BoardVo boardVo = boardMapper.getFriendview(board_idx);
		//System.out.println("=========================boardView:" +boardView);
		
		// 조회수
		boardMapper.incHit(boardVo);
		
		// 댓글목록조회
		List<CommentVo> commentList = commentMapper.getCommentList(board_idx);
		System.out.println("=========================commentList:" +commentList);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("board",boardVo);
		//mv.addObject("boardView",boardView);
		mv.addObject("board_idx",board_idx);
		mv.addObject("commentList",commentList);
		//mv.addObject("postingList",postingList);
		mv.setViewName("board/friendView");
		return mv;	
	}
	
	
	@RequestMapping("/FriendUpdateForm")
	public ModelAndView friendupdateform( @RequestParam(value="board_idx") Long board_idx ) {
		
		BoardVo boardVo = boardMapper.getFriendview(board_idx);
		System.out.println("=======boardVo: " + boardVo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("board", boardVo);
		mv.setViewName("board/friendUpdate");
		return mv;		
		
	}
	
	// 수정
	@RequestMapping("/FriendUpdate")
	public ModelAndView friendUpdate( BoardVo boardVo ) {
		
		
		boardMapper.updatefriend( boardVo );
		//System.out.println("=========================board:" + boardVo);
		//Long board_idx = boardVo.getBoard_idx();
		
		ModelAndView mv = new ModelAndView();
		//mv.addObject("board", boardVo);
		mv.setViewName("redirect:/Board/Boardhome");
		return mv;
		
	}
	
	// 삭제
	@RequestMapping("/FriendDelete")
	public ModelAndView friendDelete(BoardVo boardVo) {
		boardMapper.deletefriend( boardVo );
		Long board_idx = boardVo.getBoard_idx();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("board_idx",board_idx);
		mv.setViewName("redirect:/Board/Boardhome");
		return mv;
	}
	
	//======================================
	//======================================
	//======================================
	//======================================
	//======================================
	//======================================
	// Qanda 글 작성
		@RequestMapping(value = "/QandaWriteForm", method = RequestMethod.GET)
	    public ModelAndView qandaWriteForm() {
	        ModelAndView mv = new ModelAndView();
	        mv.setViewName("board/qandaWrite");
	        return mv;
	    }
	    
	    @RequestMapping(value = "/QandaWrite", method = RequestMethod.POST)
	    public ModelAndView qandaWrite(QnaVo qnaVo) {
	    	
	        System.out.println("Received qnaVo: " + qnaVo); // 디버깅 로그 추가
	        
	        boardMapper.insertQandawrite(qnaVo);
	        
	        ModelAndView mv = new ModelAndView();
	        mv.addObject("qnaVo", qnaVo);
	        mv.setViewName("redirect:/Board/Boardhome");
	        return mv;
	    }
	   
}
