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
	
	//id 찾기
	public ManagerVO lostId(ManagerVO lost) {
		
		// id 목록
		ManagerVO lostId = signDAOImp.lostId(lost);
		
		if(lostId == null) {
			return lostId;
		}
		
		String id = lostId.getId().substring(0, lostId.getId().length()-2);
		id+="**";
		
		lostId.setId(id);
		
		return lostId;
	}
	
	//pw 찾기
	public ManagerVO lostPw(ManagerVO lost) {
		
		ManagerVO lostPw = new ManagerVO();
		
		// 이메일로 임시 비밀번호 전송
		ManagerVO lostVO = signDAOImp.lostPw(lostPw);
		
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
		mail.setSubject("[SubWay] 비밀번호 찾기");
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
	
	// 비회원 메일 인증
	public String sender(ManagerVO nonMember) {
		
		// 메일 정보
		MailVO mail = new MailVO();
		String key = new MailKey().getkey().trim();
		
		mail.setSender("skdml132@gamil.com");
		mail.setReceiver(nonMember.getId());
		mail.setSubject("[SubWay] 비회원 인증코드");
		mail.setContent(nonMember.getName()+" 님이 요청하신 인증 코드는 ["+key+"]입니다.");

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
		
		return key;
	}

	// 비회원 가입
	public ManagerVO nonSignUp(ManagerVO mail) {
		
		ManagerVO nonMember = new ManagerVO();
		
		// 아이디 & 패스워드 랜덤으로 만들기
		String uuid = UUID.randomUUID().toString().replace("-", "").substring(0, 5);
		
		nonMember.setName(mail.getName());
		nonMember.setId(mail.getId());
		nonMember.setId(uuid);
		nonMember.setPw(uuid);
		
		/*signDAOImp.signUp(nonMember);*/
		//자동 로그인 
		return nonMember;
	}

	// 가입했는지 확인
	public int checkMember(ManagerVO managerVO) {
		
		return signDAOImp.checkMember(managerVO);
	}

}
