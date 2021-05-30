package com.borad.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.borad.model.service.BoardService;
import com.borad.model.vo.Board;
import com.borad.model.vo.Files;
import com.common.Paging;


/**
 * Servlet implementation class BoradMain
 */
@WebServlet("/borad/mainBorad")
public class BoradMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoradMainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int cPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		int numPerpage;
		try {
			numPerpage=Integer.parseInt(request.getParameter("numPerpage"));
		}catch(NumberFormatException e) {
			numPerpage=10;
		}
		
		List<Board>list=new BoardService().selectBoardList(cPage,numPerpage);
		//List<Board>list2=new BoardService().selectpopularBoardList(cPage,numPerpage);
		int totalData=new BoardService().selectNoticeCount();
		
		int pageBarSize=5;
		//Paging p=new Paging(totalData,cPage,numPerpage,pageBarSize);
		//String pageBar=p.pageBar();
		//System.out.println(pageBar);
		
				int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		
		String pageBar="";
		if(pageNo==1) {
			pageBar+="<span>[이전]</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()
			+"/borad/mainBorad?cPage="+(pageNo-1)+"'>[이전]</a>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getContextPath()
				+"/borad/mainBorad?cPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<span>[다음]</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()
			+"/borad/mainBorad?cPage="+pageNo+"'>[다음]</a>";
		}
		
		
		List<Board>pplist=new BoardService().selectppBoard();
		
		
		request.setAttribute("pplist", pplist);
		request.setAttribute("pageBar",pageBar);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/borad/mainBorad.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}