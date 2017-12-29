package kr.co.bit.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.bit.dao.FileDAO;
import kr.co.bit.vo.FileVO;

@Service
public class FileServiceImp implements FileService{

	@Autowired
	private FileDAO fileDAO;
	
	// 실제 파일 저장 경로
	private static String adminDir = "C:\\Users\\bit-user\\git\\Fooddiy-manager\\Food-manager-Web\\src\\main\\webapp\\upload";
	private static String userDir = "C:\\Users\\bit-user\\git\\Fooddiy\\Food-diy-Web\\src\\main\\webapp\\upload";
	private String formattedDate;
	// 폴더 경로
	private String adminFolderPath;
	private String userFolderPath;
	
	// <File Service>
	// File 업로드
	@Override
	public String uploadFile(HttpServletRequest request, int boardNo) {
		
		String fileOX = "X";

		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
	    Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
	    MultipartFile multipartFile = null;
        
        while(iterator.hasNext()){
            multipartFile = multipartHttpServletRequest.getFile(iterator.next());
            // 파일 존재할때,
            if(multipartFile.isEmpty() == false){
            	// multipartFile에서 필요로하는 요소 가져오기
            	String name = multipartFile.getName();
                // 이름에 따라, 파일 경로 생성
                if (name.equals("noticeFile")) {
                	// 날짜 폴더 생성
                	this.formattedDate = "\\notice\\" + new SimpleDateFormat("yyyy" + File.separator + "MM" + File.separator + "dd").format(new Date());
                	// 폴더 경로
                	this.adminFolderPath = adminDir + formattedDate;
                	this.userFolderPath = userDir + formattedDate;
                	
                	// 파일 생성
                	// 1) 관리자
                	File adminFile = new File(adminFolderPath);
                	if(adminFile.exists() == false){		// 파일이 존재하지 않는다면
                		adminFile.mkdirs();				// 해당 디렉토리를 만든다. 하위폴더까지 한꺼번에 만든다.
                	}
                	// 2) 사용자
                	File userFile = new File(userFolderPath);
                	if(userFile.exists() == false){		// 파일이 존재하지 않는다면
                		userFile.mkdirs();				// 해당 디렉토리를 만든다. 하위폴더까지 한꺼번에 만든다.
                	}
				} else if (name.equals("claimFile")) {
					// 날짜 폴더 생성
					this.formattedDate = "\\claim\\" + new SimpleDateFormat("yyyy" + File.separator + "MM" + File.separator + "dd").format(new Date());
					// 폴더 경로
                	this.adminFolderPath = adminDir + formattedDate;
                	this.userFolderPath = userDir + formattedDate;
                	
					// 파일 생성
					// 1) 관리자
					File adminFile = new File(adminFolderPath);
					if(adminFile.exists() == false){		// 파일이 존재하지 않는다면
						adminFile.mkdirs();				// 해당 디렉토리를 만든다. 하위폴더까지 한꺼번에 만든다.
					}
					// 2) 사용자
					File userFile = new File(userFolderPath);
					if(userFile.exists() == false){		// 파일이 존재하지 않는다면
						userFile.mkdirs();				// 해당 디렉토리를 만든다. 하위폴더까지 한꺼번에 만든다.
					}
					
				}
                String fileOriName = multipartFile.getOriginalFilename();
            	String uuid = UUID.randomUUID().toString(); // 중복될 일이 거의 없다.
            	String fileSaveName = uuid + "_" + fileOriName;
                long fileSize = multipartFile.getSize();
                String contentType = multipartFile.getContentType();
                String filePath = formattedDate + File.separator + fileSaveName;
                
                // 파일 업로드 경로
    			String adminPath = adminFolderPath + File.separator + fileSaveName; // 실제 저장되는 파일의 절대 경로
    			String userPath = userFolderPath + File.separator + fileSaveName; // 실제 저장되는 파일의 절대 경로
                
    			// 실제 파일을 저장함. try-with-resource 구문.
                try {
    				// 1) 관리자
    				byte[] bytes;
    				bytes = multipartFile.getBytes();
    				BufferedOutputStream buffStream = new BufferedOutputStream(new FileOutputStream(new File(adminPath)));
    				buffStream.write(bytes);
    				buffStream.close();
    				// 2) 사용자
    				byte[] userByte;
    				userByte = multipartFile.getBytes();
    				BufferedOutputStream buffStream2 = new BufferedOutputStream(new FileOutputStream(new File(userPath)));
    				buffStream2.write(userByte);
    				buffStream2.close();	
    			} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
                
                /* 파일 정보 */
                FileVO fileVO = new FileVO();
                fileVO.setBoardNo(boardNo);
    			fileVO.setName(name);
    			fileVO.setFileOriName(fileOriName);
    			fileVO.setFileSaveName(fileSaveName);
    			fileVO.setFileSize(fileSize);
    			fileVO.setFilePath(filePath);
    			fileVO.setContentType(contentType);
	            
				// 첨부파일VO 저장
				fileDAO.insert(fileVO);
				System.out.println(fileVO.toString());
				
				// 파일 존재 유무
				fileOX = "O";
            } else {
            	// 파일 없을때,
            	fileOX = "X";
            }
        }
        return fileOX;
	}
	// File 다운로드
	@Override
	public void downloadFile(HttpServletResponse response, int no) throws Exception {
		
		// 해당 파일 불러오기
		FileVO fileVO = fileDAO.selectOne(no);
	    String fileOriName = fileVO.getFileOriName();
	    String filePath = fileVO.getFilePath();
	    double fileSize = fileVO.getFileSize();
	    String contentType = fileVO.getContentType();
	     
	    byte fileByte[] = FileUtils.readFileToByteArray(new File(adminDir + filePath));
	     
	    response.setContentType("application/octet-stream");
	    response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(fileOriName,"UTF-8")+"\";");
	    response.setHeader("Content-Transfer-Encoding", "binary");
	    response.setHeader("Content-Type", contentType);
        response.setHeader("Content-Length", ""+ fileSize);
        response.setHeader("Pragma", "no-cache;");
        response.setHeader("Expires", "-1;");
        
	    response.getOutputStream().write(fileByte);
	    response.getOutputStream().flush();
	    response.getOutputStream().close();

	}
	// File 수정
	@Override
	public String modifyFile(HttpServletRequest request, int boardNo) {
		
		String fileOX = "X";

		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
	    Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
	    MultipartFile multipartFile = null;
		
		 while(iterator.hasNext()){
            multipartFile = multipartHttpServletRequest.getFile(iterator.next());
            if(multipartFile.isEmpty() == false){
            	// multipartFile에서 필요로하는 요소 가져오기
            	String name = multipartFile.getName();
            	 // 이름에 따라, 파일 경로 생성
                if (name.equals("noticeFile")) {
                	// 날짜 폴더 생성
                	this.formattedDate = "\\notice\\" + new SimpleDateFormat("yyyy" + File.separator + "MM" + File.separator + "dd").format(new Date());
                	// 폴더 경로
                	this.adminFolderPath = adminDir + formattedDate;
                	this.userFolderPath = userDir + formattedDate;
                	
                	// 파일 생성
                	// 1) 관리자
                	File adminFile = new File(adminFolderPath);
                	if(adminFile.exists() == false){		// 파일이 존재하지 않는다면
                		adminFile.mkdirs();				// 해당 디렉토리를 만든다. 하위폴더까지 한꺼번에 만든다.
                	}
                	// 2) 사용자
                	File userFile = new File(userFolderPath);
                	if(userFile.exists() == false){		// 파일이 존재하지 않는다면
                		userFile.mkdirs();				// 해당 디렉토리를 만든다. 하위폴더까지 한꺼번에 만든다.
                	}
					
				} else if (name.equals("claimFile")) {
					// 날짜 폴더 생성
					this.formattedDate = "\\claim\\" + new SimpleDateFormat("yyyy" + File.separator + "MM" + File.separator + "dd").format(new Date());
					// 폴더 경로
                	this.adminFolderPath = adminDir + formattedDate;
                	this.userFolderPath = userDir + formattedDate;
                	
					// 파일 생성
					// 1) 관리자
					File adminFile = new File(adminFolderPath);
					if(adminFile.exists() == false){		// 파일이 존재하지 않는다면
						adminFile.mkdirs();				// 해당 디렉토리를 만든다. 하위폴더까지 한꺼번에 만든다.
					}
					// 2) 사용자
					File userFile = new File(userFolderPath);
					if(userFile.exists() == false){		// 파일이 존재하지 않는다면
						userFile.mkdirs();				// 해당 디렉토리를 만든다. 하위폴더까지 한꺼번에 만든다.
					}
					
				}
            	String fileOriName = multipartFile.getOriginalFilename();
            	String uuid = UUID.randomUUID().toString(); // 중복될 일이 거의 없다.
            	String fileSaveName = uuid + "_" + fileOriName;
                long fileSize = multipartFile.getSize();
                String filePath = formattedDate + File.separator + fileSaveName;
                String contentType = multipartFile.getContentType();
                
                // 파일 업로드 경로
    			String adminPath = adminFolderPath + File.separator + fileSaveName; // 실제 저장되는 파일의 절대 경로
    			String userPath = userFolderPath + File.separator + fileSaveName; // 실제 저장되는 파일의 절대 경로
                
    			// 실제 파일을 저장함. try-with-resource 구문
    			try {
    				// 1) 관리자
    				byte[] bytes;
    				bytes = multipartFile.getBytes();
    				BufferedOutputStream buffStream = new BufferedOutputStream(new FileOutputStream(new File(adminPath)));
    				buffStream.write(bytes);
    				buffStream.close();
    				// 2) 사용자
    				byte[] userByte;
    				userByte = multipartFile.getBytes();
    				BufferedOutputStream buffStream2 = new BufferedOutputStream(new FileOutputStream(new File(userPath)));
    				buffStream2.write(userByte);
    				buffStream2.close();	
    			} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
        		
    			/* 파일 정보 */
    			FileVO fileVO_NEW = new FileVO();
    			fileVO_NEW.setBoardNo(boardNo);
    			fileVO_NEW.setName(name);
    			fileVO_NEW.setFileOriName(fileOriName);
    			fileVO_NEW.setFileSaveName(fileSaveName);
    			fileVO_NEW.setFileSize(fileSize);
    			fileVO_NEW.setFilePath(filePath);
    			fileVO_NEW.setContentType(contentType);
	            
				// 첨부파일 수정
				fileDAO.update(fileVO_NEW);
				System.out.println(fileVO_NEW.toString());
				
				// 파일 존재 유무
				fileOX = "O";
            }
            else{
            	System.out.println("파일 안 올림~");
            	fileOX = "X";
            }
        }
		return fileOX;
	}
	// File 조회	
	@Override
	public FileVO selectOneFile(int no) {
		// 게시판 번호에 해당하는 파일 가져오기
		FileVO fileDetail = fileDAO.selectOne(no);
		double sizeLong = fileDetail.getFileSize();
		double size = Math.round((sizeLong/(double)1024)*10)/10.0; 	//소숫점 첫째자리 까지 표시
		
		System.out.println(size);
		fileDetail.setFileSize(size);
		
		return fileDetail;
	}
	// File List 조회
	@Override
	public List<FileVO> selectFileList(int boardNo, String name) {
		// 게시판 번호에 해당하는 파일 가져오기
		List<FileVO> fileList = fileDAO.selectList(boardNo, name);
		
		for (FileVO fileVO : fileList) {
			System.out.println(fileVO.toString());
			double sizeLong = fileVO.getFileSize();
			double size = Math.round((sizeLong/(double)1024)*10)/10.0; 	//소숫점 첫째자리 까지 표시
			System.out.println(size);
			fileVO.setFileSize(size);
		}
		
		return fileList;
	}
	// File 삭제
	@Override
	public void removeFile(int no) {
		// 실제 저장 파일 삭제
		deleteFile(no);
		// DB 삭제 
		fileDAO.delete(no);
	}
	// 실제 저장된 파일 삭제 (번호용)
	@Override
	public void deleteFile(int no) {
		// 관리자
		String adminPath = adminDir + File.separator + fileDAO.selectOne(no).getFilePath();
		File file2 = new File(adminPath);
		if(file2.exists() == true){
			file2.delete();
		}
		// 사용자
		String userPath = userDir + File.separator + fileDAO.selectOne(no).getFilePath();
		File file = new File(userPath);
		if(file.exists() == true){
			file.delete();
		}
	}
	// 실제 저장된 파일 삭제 (주소용)
	@Override
	public void deleteFile(String filePath) {
		// 관리자
		String adminPath = adminDir + File.separator + filePath;
		File file2 = new File(adminPath);
		if(file2.exists() == true){
			file2.delete();
		}
		// 사용자
		String userPath = userDir + File.separator + filePath;
		File file = new File(userPath);
		if(file.exists() == true){
			file.delete();
		}
	}
	// File 다중 삭제
	@Override
	public void removeFileSome(List<Integer> list) {
		// DB 삭제 
		fileDAO.deleteSome(list);
	}

}

