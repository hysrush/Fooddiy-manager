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
	
	
	// id 중복
	public int checkMember(String id) {
		
		return signDAOImp.checkMember(id);
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
	
	// 지점 확인
	public int branchCheck(String storeName) {
		
		return signDAOImp.branchCheck(storeName);
	}
	
	// 관리자 등록
	public ManagerVO signUp(ManagerVO managerVO) {
		
		return signDAOImp.signUp(managerVO);

	}
	
	// 로그인
	public ManagerVO login(ManagerVO managerVO) {
		
		return signDAOImp.login(managerVO);
	}
	
	// pw 찾기
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

	// 비밀번호 변경
	public void setPw(ManagerVO up) {
		
		System.out.println(up.toString());
		
		signDAOImp.setPw(up);
		
	}

	// 현재 비밀번호와 변경하려는 비밀번호가 일치하는지 확인
	public int checkpw(ManagerVO check) {
		
		return signDAOImp.checkpw(check);
	}
	
}
