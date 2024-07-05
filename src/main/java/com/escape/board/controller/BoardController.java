package com.escape.board.controller;

import java.text.MessageFormat;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.escape.board.domain.BoardVo;
import com.escape.board.domain.CommentVo;
import com.escape.board.domain.NewsVo;
import com.escape.board.domain.NoticeVo;
import com.escape.board.domain.Pagination;
import com.escape.board.domain.PagingResponse;
import com.escape.board.domain.QnaVo;
import com.escape.board.domain.SearchVo;
import com.escape.board.mapper.BoardMapper;
import com.escape.board.mapper.BoardPagingMapper;
import com.escape.board.mapper.CommentMapper;
import com.escape.login.domain.User;
import com.escape.login.mapper.UserMapper;

@Controller
@RequestMapping("/Board")
public class BoardController {
	
	//@Value("${part4.upload-path}")
	//private String uploadPath;
	
	@Autowired
	private BoardMapper boardMapper;

	@Autowired
	private CommentMapper commentMapper;
	
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private BoardPagingMapper boardPagingMapper;

	
	@RequestMapping("/Boardhome")
	public  ModelAndView   boardhome(BoardVo boardVo, NewsVo newsVo, QnaVo qnaVo, NoticeVo noticeVo, User user, @RequestParam(value="id") String id 
			//,@RequestParam HashMap<String,Object> map
			,int nowpage
			//,@RequestParam(value="nowpage") int nowpage
			) {
				
		System.out.println("Received id============id============///////////: " + id); // 디버깅 로그 추가
		
		//boardMapper.selectUser(user);
		List<User> userList = boardMapper.getUserList(user);
		int userIdx = userList.get(0).getUser_idx();
		System.out.println("Received userIdx============userIdx============///////////: " + userIdx); // 디버깅 로그 추가
		//int user_idx = user.getUser_idx();
		//User user = user.getUser_idx();
        System.out.println("Received user============userList============///////////: " + userList); // 디버깅 로그 추가
		
		// 포스팅리스트 페이징리스트로 바꿔보기
		// List<BoardVo> postingList  = boardMapper.getPostingList(boardVo);
		int count = boardMapper.getCount();
	//	int hit = boardMapper.getHit();
		
		
		// 페이징
		 int pcount = boardPagingMapper.pcount( boardVo );
		// int pageSize = 4;
	        PagingResponse<BoardVo> response = null;
	        if (pcount < 1) {
	        	response =  new PagingResponse<>(Collections.emptyList(), null);
	        }
		
	     // 페이징을 위한 초기설정값
	        SearchVo    searchVo   =  new SearchVo();
	        searchVo.setPage(nowpage);
	        searchVo.setPageSize(10);
	        
	        Pagination pagination = new Pagination(pcount, searchVo);
	        searchVo.setPagination(pagination);
		
	        Long   board_idx = boardVo.getBoard_idx();
	        String title     = boardVo.getTitle();
	        String content   = boardVo.getContent();
	        int    offset    =  searchVo.getOffset();
	        int    pageSize  =  searchVo.getPageSize();
		
	        //List<BoardVo> postingList  = boardMapper.getPostingList(boardVo);
	        List<BoardVo> postingList = boardPagingMapper.getBoardPagingList(
	        		board_idx, title, content, offset, pageSize);
	        System.out.println("======================BoardVo페이지리스트: " + postingList );
	        System.out.println("======================BoardVo페이지사이즈: " + pageSize );
	        System.out.println("======================BoardVooffset: " + offset );
	        //response =  new PagingResponse<>(list, pagination);
	        response =  new PagingResponse<>(postingList, pagination);
			
			System.out.println( response );
			
		
			
		List<NewsVo> newsList = boardMapper.getNewsList(newsVo);
		int ncount = boardMapper.getNcount();
		// 뉴스 조회수
		//boardMapper.updateNewsHit(newsVo);
		
		List<QnaVo> qnaList = boardMapper.getQnaList(qnaVo);
		int qcount = boardMapper.getQcount();
		
		List<NoticeVo> noticeList = boardMapper.getNoticeList(noticeVo);
		int nocount = boardMapper.getNocount();
		
		
		
		ModelAndView mv = new ModelAndView();
		// mv.addObject("user",userVo);
	//	mv.addObject("news_idx", news_idx);
		mv.addObject("user",user);
		mv.addObject("board",boardVo);
		mv.addObject("news",newsVo);
		mv.addObject("qna",qnaVo);
		mv.addObject("notice",noticeVo);
		
		mv.addObject("userList",userList);
		mv.addObject("postingList",postingList);
		mv.addObject("newsList",newsList);
		mv.addObject("qnaList",qnaList);
		mv.addObject("noticeList",noticeList);
		
		mv.addObject("id", id);
		mv.addObject("user_idx", userIdx);
		mv.addObject("count",count);
		mv.addObject("ncount",ncount);
		mv.addObject("qcount",qcount);
		mv.addObject("nocount",nocount);
		//mv.addObject("news_idx",news_idx);
		
		mv.addObject("nowpage",    nowpage );
		mv.addObject("response",   response ); 
		mv.addObject("searchVo",   searchVo );
		
		mv.setViewName("board/boardhome");
		return mv;
	}
	
	
	// 친구 구하기 글 작성
	@RequestMapping(value = "/FriendWriteForm", method = RequestMethod.GET)
    public ModelAndView friendWriteForm(User user) {
		List<User> userList = boardMapper.getUserList(user);
		//System.out.println("===== FriendWriteForm=== userList: " + userList);

        ModelAndView mv = new ModelAndView();
        //mv.addObject("userList",userList);
        mv.addObject("user_idx", user.getUser_idx());
        mv.addObject("id", user.getId());
        mv.setViewName("board/friendWrite");
        return mv;
    }
    
    @RequestMapping(value = "/FriendWrite", method = RequestMethod.POST)
    public ModelAndView friendWrite(BoardVo boardVo, User user, int nowpage) {
    	
    	String id = user.getId();
    	
    	//List<User> userList = boardMapper.getUserList(user);
       //System.out.println("Received user============user============///////////: " + user); // 디버깅 로그 추가
        //int userIdx = userList.get(0).getUser_idx();
    	//boardMapper.selectUser(user);

       // System.out.println("Received BoardVo: " + boardVo); // 디버깅 로그 추가
        //System.out.println("Received user: " + user); // 디버깅 로그 추가
        
        boardMapper.insertFriendwrite(boardVo);
        boardMapper.insertBoard(boardVo);
       // System.out.println("Received user========================///////////: " + user); // 디버깅 로그 추가

        ModelAndView mv = new ModelAndView();
        mv.addObject("boardVo", boardVo);
        //mv.addObject("id", user.getId());
        //mv.addObject("user_idx", userIdx);
        //mv.addObject("userList", userList);
        
        String fmt = "redirect:/Board/Boardhome?id=${id}&nowpage={1}";
		String loc = MessageFormat.format(fmt, user.getId(), nowpage );
		mv.setViewName(loc);
		return mv;
        
       // mv.setViewName("redirect:/Board/Boardhome?id=" + id);
       // return mv;
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
		//List<User> userList = boardMapper.getUserList(user);
		//   int userIdx = userList.get(0).getUser_idx();
		
		// 조회수
		boardMapper.incHit(boardVo);
		
		// 댓글목록조회
		List<CommentVo> commentList = commentMapper.getCommentList(board_idx);
		System.out.println("=========================commentList:" +commentList);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("board",boardVo);
		//mv.addObject("user",user);
		//mv.addObject("boardView",boardView);
		mv.addObject("board_idx",board_idx);
		//mv.addObject("user_idx",userIdx);
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
	public ModelAndView friendUpdate( BoardVo boardVo, @RequestParam(value="id") String id ) {
		
		System.out.println("어디까지 가나?111111111111111111111111111");
		boardMapper.updatefriend( boardVo );
		System.out.println("어디까지 가나?2222222222222222222222222222222211");
		System.out.println("=========================board:" + boardVo);
		//Long board_idx = boardVo.getBoard_idx();
		
		ModelAndView mv = new ModelAndView();
		System.out.println("어디까지 가나?3333333333333333333333333333333");
		//mv.addObject("board", boardVo);
		mv.setViewName("redirect:/Board/Boardhome?id=" + id);
		return mv;
		
	} 
	  

	
	// 삭제
	@RequestMapping("/FriendDelete")
	public ModelAndView friendDelete(BoardVo boardVo, User user ,@RequestParam("user_idx") int user_idx) {
		
		
		User user1 = boardMapper.getUserId(user_idx);
		
		
		System.out.println("user찍어보기(딜리트 컨트롤러):" + user );
		String id = user1.getId();
		System.out.println("딜리트 컨트롤러입니다" + id);
		System.out.println("=======================id:" + id);
		
		if(id == null) {
			System.out.println("아이디가 널입니다");
			
		}else {
			
			System.out.println("아이디가 널이 아닙니다");
			
		}
		boardMapper.deletefriend( boardVo );
		Long board_idx = boardVo.getBoard_idx();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("board_idx",board_idx);
		mv.setViewName("redirect:/Board/Boardhome?id=" + id);
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
	    
	    //======================================
	    //======================================
	    //======================================
	    //======================================
	    //======================================
	    //======================================
	    
	 // 뉴스 조회수
	    /*
	    @RequestMapping("/Api/Board/updateNewsHit")
	    @ResponseBody
	    public ResponseEntity<String> updateNewsHit(@PathVariable Long news_idx, @RequestBody NewsVo newsVo ) {
	        boardMapper.updateNewsHit(news_idx);
	        
	        return new ResponseEntity<>("Success", HttpStatus.OK);
	    }
	   */
	    /*
	    @PostMapping("/Api/updateNewsHit")
	    @ResponseBody
	    public ResponseEntity<Map<String, Long>> updateNewsHit(@RequestParam("news_idx") Long news_idx) {
	        boardMapper.updateNewsHit(news_idx);
	        Long updatedHit = boardMapper.getNewsHit(news_idx); // 업데이트된 조회수를 가져옴
	        Map<String, Long> response = new HashMap<>();
	        response.put("news_idx", news_idx);
	        response.put("hitCount", updatedHit);
	        return new ResponseEntity<>(response, HttpStatus.OK); // 업데이트된 조회수를 반환
	    }

*/
	   
}
