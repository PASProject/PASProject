package com.app.pas.controller.totalboard;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.pas.dto.board.TotalNoticeVo;
import com.app.pas.service.board.TotalNoticeService;

@Controller
@RequestMapping("totalNotice")
public class TotalNoticeController {

	@Autowired
	TotalNoticeService totalNoticeService;

	@RequestMapping("/totalNoticeList")
	public String TotalNotice(Model model) {
		// jsp���ϰ� ����
		String url = "totalNotice/totalNoticeList";

		// ��������Ʈ ����
		List<TotalNoticeVo> totalNoticeList;

		// ����Ʈ�� ������ ����
		try {
			totalNoticeList = totalNoticeService.selectTotalNoticeList();
			model.addAttribute("totalNoticeList", totalNoticeList);

			System.out.println("��Ż��Ƽ�� test : " + totalNoticeList);
		} catch (SQLException e) {

			e.printStackTrace();
		}
		// ���� ����Ʈ�� ȭ�鿡 �ѱ�
		return url;

	}

	@RequestMapping("/totalNotice")
	public String selectTotalNoticeBoard(
			@RequestParam String ttnotice_Num, Model model) {
		String url = "totalNotice/totalNoticeDetail";

		try {
			TotalNoticeVo totalNoticeVo = totalNoticeService
					.selectTotalNoticeBoard(Integer.parseInt(ttnotice_Num));
			model.addAttribute("totalNoticeVo", totalNoticeVo);
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return url;

	}
}
