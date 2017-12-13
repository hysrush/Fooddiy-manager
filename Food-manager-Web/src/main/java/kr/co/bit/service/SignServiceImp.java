package kr.co.bit.service;

import java.util.UUID;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import kr.co.bit.dao.SignDAO;
import kr.co.bit.vo.MailKey;
import kr.co.bit.vo.MailVO;
import kr.co.bit.vo.ManagerVO;

@Service
public class SignServiceImp implements SignService {

	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private SignDAO signDAOImp;
	
	
	// 가입했는지 확인
	public int checkMember(ManagerVO managerVO) {
		
		return signDAOImp.checkMember(managerVO);
	}
	
	// 관리자 인증 코드
	public String managerCheck(String id) {
		
		MailVO mail = new MailVO();
		String code = new MailKey().getkey().trim();
		
		mail.setSender("skdml132@gamil.com");
		mail.setSubject("[Subway] 관리자 인증 코드");
		mail.setContent("관리자 인증 코드는 [" + code + "] 입니다." );
		mail.setReceiver(id);

		try {
			
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8" );
			
			messageHelper.setFrom(mail.getSender());
			messageHelper.setTo(mail.getReceiver());
			messageHelper.setSubject(mail.getSubject());
			messageHelper.setText(mail.getContent());
			
			mailSender.send(message);
			
		}catch(Exception e) {
			e.getMessage();
		}
		
		return code;
	}
	
	//회원 가입
	public ManagerVO signUp(ManagerVO managerVO) {

		// 지점이 몇 개 있는지 확인
		String[] a = managerVO.getAddr2().split(" ");
		String[] b = managerVO.getAddr2().split(" ");
		
		System.out.println(a[2]);
		managerVO.setBranch(a[2]);
		
		int num = signDAOImp.branchCheck(a[2]);
		
		if(num == 0) {
			managerVO.setBranch(b[2].substring(0, 2)+" 1호점");
			return signDAOImp.signUp(managerVO);
		}
		
		managerVO.setBranch(b[2].substring(0, 2)+" "+(num+1)+"호점");
		
		return signDAOImp.signUp(managerVO);

	}
	
	// 로그인
	public ManagerVO login(ManagerVO managerVO) {
		
		return signDAOImp.login(managerVO);
	}
	
	//pw 찾기
	public ManagerVO lostPw(ManagerVO lost) {
		
		// 이메일로 임시 비밀번호 전송
		ManagerVO lostVO = signDAOImp.lostPw(lost);
		
		if(lostVO == null) {
			return lostVO;
		}
		
		// 1. 임시 비밀번호
		String uuid = UUID.randomUUID().toString().replace("-", "").substring(0, 10);
		
		// 2. 임시 비밀번호 저장
		lostVO.setPw(uuid);
		signDAOImp.setPw(lostVO);
		
		// 3. 메일 전송
		MailVO mail = new MailVO();
		
		mail.setSender("skdml132@gamil.com");
		mail.setReceiver(lostVO.getId());
		mail.setSubject("[SubWay] 관리자 비밀번호 찾기");
		mail.setContent(lostVO.getName()+" 님의 임시 비밀번호는 ["+uuid+"]입니다. ");

		try {
			// 메일 보내기
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			
			messageHelper.setFrom(mail.getSender()); // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(mail.getReceiver()); // 받는사람 이메일
			messageHelper.setSubject(mail.getSubject()); // 메일제목은 생략이 가능하다
			messageHelper.setText(mail.getContent()); // 메일 내용

			mailSender.send(message);
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return lostVO;
	}
	
}
