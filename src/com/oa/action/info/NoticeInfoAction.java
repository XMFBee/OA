package com.oa.action.info;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Date;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.json.annotations.JSON;

import com.oa.action.NoticeAction;
import com.oa.bean.Notice;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.TempDate;
import com.oa.common.web.WebUtil;
import com.oa.service.NoticeService;

public class NoticeInfoAction  implements ServletRequestAware,ServletResponseAware{
	private HttpServletRequest request;
	private HttpServletResponse response;
	private NoticeService	noticeService;
	private Pager4EasyUI<Notice> pager = new Pager4EasyUI<Notice>();
	
	public  void outImg() throws IOException{
		
		pager.setPageNo(WebUtil.getPageSize(request));
		pager.setPageSize(1);
		noticeService.queryPager("Notice", pager);
		
		Notice notice= pager.getRows().get(0);
		
		String dateStr = TempDate.date2Str(notice.getNoticeDay());
		BufferedImage img = msg2Img(notice.getNoticetype().getName(),notice.getName(),notice.getDes(),dateStr,notice.getEmp().getName());
		HttpSession session = request.getSession();
		response.setContentType("image/jpeg");
		ServletOutputStream out = response.getOutputStream();
		ImageIO.write(img, "jpg", out);
		out.flush();
		out.close();
		
	}
	
	private BufferedImage msg2Img(String type,String title,String message,String dateStr, String sou){
		BufferedImage img = new BufferedImage(500, 300, BufferedImage.TYPE_INT_RGB);
		Graphics g = img.getGraphics();
		title = "["+type+"] "+title;
		g.setColor(Color.BLACK);
		g.fillRect(0, 0, 500, 300);
		
		g.setColor(Color.WHITE);
		g.setFont(new Font("微软雅黑", Font.BOLD, 18));
		g.drawString(title,30, 50);
		
		g.setColor(Color.WHITE);
		g.setFont(new Font("微软雅黑", Font.PLAIN, 16));
		g.drawString(message,50, 90);
		
		g.setColor(Color.WHITE);
		g.drawString(sou,400, 300-55);
		
		g.setColor(Color.WHITE);
		g.drawString(dateStr,400, 300-30);
		
		return img;
	}

	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	@JSON(serialize=false)
	public NoticeService getNoticeService() {
		return noticeService;
	}

	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}
}
