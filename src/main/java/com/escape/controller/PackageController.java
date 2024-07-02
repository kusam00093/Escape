package com.escape.controller;


import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.escape.domain.CategoryVo;
import com.escape.domain.ConvenienceVo;
import com.escape.domain.LocationVo;
import com.escape.domain.PackageVo;
import com.escape.domain.PackageVo2;
import com.escape.domain.Package_RateVo;
import com.escape.domain.Package_ReservationVo;
import com.escape.domain.Package_ReviewVo;
import com.escape.domain.Package_Review_ImgVo;
import com.escape.domain.Package_imageVo;
import com.escape.domain.Package_imageVo2;
import com.escape.login.domain.User;
import com.escape.login.mapper.UserMapper;
import com.escape.mapper.PackageMapper;

@Controller
@RequestMapping("/Package")
public class PackageController {

	
	@Autowired
	private PackageMapper packageMapper;
	
	@Autowired
	private UserMapper userMapper;
	

	@RequestMapping("/Home")
	public ModelAndView home(@SessionAttribute(name = "login", required = false) User user) {
	    ModelAndView mv = new ModelAndView();

	    List<CategoryVo> categoryList = packageMapper.getCategory();
	    List<PackageVo> packageList = packageMapper.getPackageList();

	    mv.addObject("categoryList", categoryList);
	    mv.addObject("packageList", packageList);

	    int userIdx = user != null ? user.getUser_idx() : 0; // user가 null이면 userIdx를 0으로 설정

	    if (userIdx > 0) {
	        // userIdx가 0보다 크면(user.getUser_idx()가 존재할 때)
	        User usertype = userMapper.findUserType(userIdx);
	        mv.addObject("usertype", usertype);
	    }

	    mv.setViewName("package/package_home");
	    return mv;

	}

	@RequestMapping("/Home/Sub")
	public ModelAndView subHome(
	        @RequestParam(name = "category_idx", required = false) Integer category_idx,
	        @RequestParam(name = "keyword", required = false) String keyword,
	        @SessionAttribute(name = "login", required = false) User user
	) {
	    ModelAndView mv = new ModelAndView();

	    List<PackageVo> packageListSub;
	    CategoryVo categoryVo = null;
	    if (category_idx != null) {
	        packageListSub = packageMapper.getPackageList_Sub_Category(category_idx);
	        categoryVo = packageMapper.getCategoryName(category_idx);
	    } else if (keyword != null && !keyword.isEmpty()) {
	        packageListSub = packageMapper.getPackageList_Search(keyword);
	    } else {
	        packageListSub = packageMapper.getPackageList();
	    }

	    mv.addObject("packageList_sub", packageListSub);

	    int userIdx = user != null ? user.getUser_idx() : 0; // user가 null이면 userIdx를 0으로 설정

	    if (userIdx > 0) {
	        // userIdx가 0보다 크면(user.getUser_idx()가 존재할 때)
	        User usertype = userMapper.findUserType(userIdx);
	        mv.addObject("usertype", usertype);
	        mv.addObject("user_idx",userIdx);
	    }

	    if (categoryVo != null) {
	        mv.addObject("categoryVo", categoryVo);
	        mv.addObject("user_idx",userIdx);
	        System.out.println("카테고리 이름"+categoryVo.getName());
	    } else if (keyword != null && !keyword.isEmpty()) {
	        mv.addObject("keyword", keyword);
	        mv.addObject("user_idx",userIdx);
	    }
	    mv.addObject("user_idx",userIdx);
	    mv.setViewName("package/package_sub_home");
	    
	    return mv;
	}
	
	@RequestMapping("/Detail")
	public  ModelAndView   detail(
			@RequestParam("package_idx") int package_idx,
			@SessionAttribute(name = "login", required = false) User user) {		
		
		List<ConvenienceVo> coList = packageMapper.getConvenience(package_idx);
		PackageVo packageVo = packageMapper.getPackage(package_idx);
		List<Package_ReviewVo> reviewList = packageMapper.getReviews(packageVo.getPackage_idx());
		
		List<Package_imageVo> package_imageList1 = packageMapper.getPackageImg1(packageVo.getPackage_idx());
		List<Package_imageVo> package_imageList2 = packageMapper.getPackageImg2(packageVo.getPackage_idx());
		List<Package_imageVo> package_imageList3 = packageMapper.getPackageImg3(packageVo.getPackage_idx());
		Package_ReviewVo package_Rate = packageMapper.getAverageRate(packageVo.getPackage_idx());
		Package_ReviewVo package_Rate_Max = packageMapper.getMaxRate(packageVo.getPackage_idx());
		Package_ReviewVo package_ReviewCount = packageMapper.getReviewCount(packageVo.getPackage_idx());
		
		//int paycount = packageMapper.countPay(user.getUser_idx());
		
		ModelAndView mv = new ModelAndView();
		
		
	    int userIdx = user != null ? user.getUser_idx() : 0; // user가 null이면 userIdx를 0으로 설정

	    if (userIdx > 0) {
	        // userIdx가 0보다 크면(user.getUser_idx()가 존재할 때)
	        User usertype = userMapper.findUserType(userIdx);
			int paycount = packageMapper.countPay(user.getUser_idx());
	        mv.addObject("usertype", usertype);
	        mv.addObject("user_idx",userIdx);
	        mv.addObject("paycount",paycount);
	    }else {
	    	
	    	
	    }
	    
		
		mv.addObject("coList", coList);
		mv.addObject("package_idx", package_idx);
		mv.addObject("packageVo", packageVo);
		mv.addObject("reviewList", reviewList);
		mv.addObject("package_ReviewCount", package_ReviewCount);
		mv.addObject("package_Rate", package_Rate);
		mv.addObject("package_Rate_Max", package_Rate_Max);
		mv.addObject("package_imageList1", package_imageList1);
		mv.addObject("package_imageList2", package_imageList2);
		mv.addObject("package_imageList3", package_imageList3);
		
		
		mv.setViewName("package/package_detail");
		return mv;
	}
	
	
	
	
	@RequestMapping("/Reservation")
	public ModelAndView reservation(
			@RequestParam("reservation_price") int reservation_price,
			@RequestParam("package_idx") int package_idx,
			@RequestParam("reservation_su") int reservation_su,
			@SessionAttribute(name = "login", required = false) User user) {
		
		PackageVo packageVo = packageMapper.getPackage(package_idx);
		
		User usertype = userMapper.findUserType(user.getUser_idx());
		
		
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("reservation_price", reservation_price);
		mv.addObject("package_idx", package_idx);
		mv.addObject("reservation_su", reservation_su);
		mv.addObject("packageVo", packageVo);
		mv.addObject("usertype", usertype);
		mv.addObject("user_idx", user.getUser_idx());
		mv.setViewName("package/package_reservation");
		return mv;
	}
	
	@RequestMapping("/Reservation/Insert")
	public ModelAndView reservationInsert(
			@RequestParam("reservation_price") int reservation_price,
			@RequestParam("package_idx") int package_idx,
			@RequestParam("reservation_su") int reservation_su,
			Package_ReservationVo prVo,
			PackageVo packageVo) {
		
		
		packageMapper.insertPackageReservation(prVo);
		
		
		System.out.println("insert 됬음");
		
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("reservation_price", reservation_price);
		mv.addObject("package_idx", package_idx);
		mv.addObject("reservation_su", reservation_su);
		mv.setViewName("rediret:/mypage");
		return mv;
	}
	

	@RequestMapping("/Insert/Review")
	public ModelAndView insertReview(
	        Package_ReviewVo reviewVo,
	        Package_RateVo rateVo,
	        @SessionAttribute(name = "login", required = false) User user,
	        @RequestParam("package_idx") int package_idx,
	        @RequestParam("file") MultipartFile[] files, // Multiple files can be received
	        @Value("${file.upload-dir}") String uploadDir) { // 업로드 디렉토리 경로

	    if (user == null) {
	        return new ModelAndView("redirect:/login"); // 로그인 페이지로 리다이렉트
	    }

	    int person_idx = packageMapper.findByPersonIdx(user.getUser_idx());
	    reviewVo.setPerson_idx(person_idx);
	    packageMapper.insertReview(reviewVo);
	    packageMapper.insertReviewRaterate(user.getUser_idx(), rateVo.getRate());

	    List<String> imagePaths = new ArrayList<>(); // 파일 경로를 저장할 리스트

	    if (files != null && files.length > 0) {
	        for (MultipartFile file : files) {
	            if (file.isEmpty()) {
	                System.out.println("파일이 비어 있습니다.");
	                continue;  // 파일이 비어 있으면 처리하지 않고 다음 파일로 넘어갑니다.
	            }

	            System.out.println("파일이 성공적으로 수신되었습니다: " + file.getOriginalFilename());

	            try {
	                String baseDir = System.getProperty("user.dir");
	                String imagesDirPath = baseDir + "/" + uploadDir;
	                System.out.println("현재 작업 디렉토리: " + baseDir);
	                System.out.println("파일 업로드 경로: " + imagesDirPath);

	                File directory = new File(imagesDirPath);
	                if (!directory.exists()) {
	                    directory.mkdirs();
	                    System.out.println("디렉토리가 생성되었습니다: " + imagesDirPath);
	                } else {
	                    System.out.println("디렉토리가 이미 존재합니다: " + imagesDirPath);
	                }

	                DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyyMMdd");
	                ZonedDateTime current = ZonedDateTime.now();
	                String namePattern = current.format(format);

	                String originalFileName = file.getOriginalFilename();
	                if (originalFileName == null) {
	                    throw new IOException("Original file name is null");
	                }
	                System.out.println("파일 이름: " + originalFileName);

	                String extension = "";
	                if (originalFileName.contains(".")) {
	                    extension = originalFileName.substring(originalFileName.lastIndexOf("."));
	                }

	                String fileName = namePattern + "_" + originalFileName;
	                String filePath = Paths.get(imagesDirPath, fileName).toString();

	                Files.copy(file.getInputStream(), Paths.get(filePath), StandardCopyOption.REPLACE_EXISTING);
	                System.out.println("파일이 성공적으로 저장되었습니다: " + filePath);

	                String relativePath = "/package_image/" + fileName; // 상대 경로 설정
	                imagePaths.add(relativePath); // 경로를 리스트에 추가

	            } catch (IOException e) {
	                e.printStackTrace();
	                System.out.println("파일 저장 중 오류가 발생했습니다.");
	                return new ModelAndView("errorPage"); // 에러 페이지로 리다이렉트 (적절한 페이지로 변경)
	            }
	        }
	    }

	    List<Package_Review_ImgVo> reviewImgList = new ArrayList<>();
	    for (String path : imagePaths) {
	        reviewImgList.add(new Package_Review_ImgVo(path)); // 각 이미지 경로로 객체 생성
	    }

	    packageMapper.insertReviewimage(reviewImgList); // 이미지 리스트를 DB에 저장

	    // 리뷰 등록 후 상세 페이지로 리다이렉트
	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("redirect:/Package/Detail?package_idx=" + package_idx);
	    //mv.setViewName("/Package/Home");
	    return mv;
	}
	
	@RequestMapping("/WriteForm")
	public ModelAndView packageWriteForm(
			@SessionAttribute(name = "login", required = false) User user
			) {
		
		List<CategoryVo> categoryList = packageMapper.getCategory();
		List<LocationVo> locationList = packageMapper.getLocation();
		List<ConvenienceVo> convenienceList = packageMapper.getConvenienceList();
		
		
		
	    ModelAndView mv = new ModelAndView();
	    mv.addObject("categoryList",categoryList);
	    mv.addObject("convenienceList",convenienceList);
	    mv.addObject("locationList",locationList);
	    mv.addObject("user_idx", user.getUser_idx());
	    mv.setViewName("package/package_write");
	    return mv;
	}
	
	@RequestMapping("/Write")
	public ModelAndView packageWrite(
	        @SessionAttribute(name = "login", required = false) User user,
	        PackageVo2 packageVo,
	        Package_imageVo2 imageVo,
	        @RequestParam("file") MultipartFile[] files, // 여러 파일을 받을 수 있도록 설정
	        @Value("${file.upload-dir}") String uploadDir,
	        @RequestParam("category_idx") String categoryIdxString,
	        @RequestParam("location_idx") String LocationIdxString,
	        @RequestParam("convenience_idx") String ConvenienceIdxString
	) {

	    List<String> imagePaths = new ArrayList<>(); // 파일 경로를 저장할 리스트

	    if (files != null && files.length > 0) {
	        for (MultipartFile file : files) {
	            if (file.isEmpty()) {
	                System.out.println("파일이 비어 있습니다.");
	                continue;  // 파일이 비어 있으면 처리하지 않고 다음 파일로 넘어갑니다.
	            }

	            System.out.println("파일이 성공적으로 수신되었습니다: " + file.getOriginalFilename());

	            try {
	                String baseDir = System.getProperty("user.dir");
	                String imagesDirPath = baseDir + "/" + uploadDir;
	                System.out.println("현재 작업 디렉토리: " + baseDir);
	                System.out.println("파일 업로드 경로: " + imagesDirPath);

	                File directory = new File(imagesDirPath);
	                if (!directory.exists()) {
	                    directory.mkdirs();
	                    System.out.println("디렉토리가 생성되었습니다: " + imagesDirPath);
	                } else {
	                    System.out.println("디렉토리가 이미 존재합니다: " + imagesDirPath);
	                }

	                DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyyMMdd");
	                ZonedDateTime current = ZonedDateTime.now();
	                String namePattern = current.format(format);

	                String originalFileName = file.getOriginalFilename();
	                if (originalFileName == null) {
	                    throw new IOException("Original file name is null");
	                }
	                System.out.println("파일 이름: " + originalFileName);

	                String extension = "";
	                if (originalFileName.contains(".")) {
	                    extension = originalFileName.substring(originalFileName.lastIndexOf("."));
	                }

	                String fileName = namePattern + "_" + originalFileName;
	                String filePath = Paths.get(imagesDirPath, fileName).toString();

	                Files.copy(file.getInputStream(), Paths.get(filePath), StandardCopyOption.REPLACE_EXISTING);
	                System.out.println("파일이 성공적으로 저장되었습니다: " + filePath);

	                String relativePath = "/package_image/" + fileName; // 상대 경로 설정
	                imagePaths.add(relativePath); // 경로를 리스트에 추가

	            } catch (IOException e) {
	                e.printStackTrace();
	                System.out.println("파일 저장 중 오류가 발생했습니다.");
	                return new ModelAndView("errorPage"); // 에러 페이지로 리다이렉트 (적절한 페이지로 변경)
	            }
	        }
	    }

	    // packageVo 저장
	    packageMapper.insertPackage(packageVo);
	    
	    
	    List<Package_imageVo> imageList = new ArrayList<>();
	    for (String path : imagePaths) {
	    	imageList.add(new Package_imageVo(path));
	    }
	    System.out.println("=--=-=-=-======================================================="+imageList);
	    // 이미지 정보 저장
	    packageMapper.insertPackageImg(imageList); // 이미지 리스트를 DB에 저장
	    
	    String[] categoryArray = categoryIdxString.split(",");

	    // 문자열 배열을 int 배열로 변환
	    int[] categoryIdxArrayList = Arrays.stream(categoryArray)
	                                   .map(String::trim)  // 문자열의 공백 제거
	                                   .mapToInt(Integer::parseInt)  // 문자열을 정수로 변환
	                                   .toArray();  // int 배열로 변환
	    packageMapper.insertPackageCategory(categoryIdxArrayList);
	    	
	    
//	    String[] locationArray = categoryIdxString.split(",");
//	    
//	    int[] locationIdxArrayList = Arrays.stream(locationArray)
//                .map(String::trim)  // 문자열의 공백 제거
//                .mapToInt(Integer::parseInt)  // 문자열을 정수로 변환
//                .toArray();  // int 배열로 변환
//	    
//	    packageMapper.insertPackageLocation(locationIdxArrayList);
	    
	    

	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("redirect:/Package/Home/Sub");
	    return mv;
	}
	
}
