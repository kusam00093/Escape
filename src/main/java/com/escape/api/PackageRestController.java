package com.escape.api;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;


import com.escape.domain.PackageVo;
import com.escape.domain.Package_BookmarkVo;
import com.escape.login.domain.User;
import com.escape.mapper.PackageRestMapper;

@RestController
public class PackageRestController {

    @Autowired
    private PackageRestMapper packageRestMapper;
    

    @RequestMapping("/Hit")
    public List<PackageVo> getPackageList1(@SessionAttribute(name = "login", required = false) User user) {
    	
    	List<PackageVo> packageList_sub = packageRestMapper.getPackageList_Sub(user.getUser_idx());
    	
    	return packageList_sub;
    }
    @RequestMapping("/Recent")
    public List<PackageVo> getRecentPackageList() {
        List<PackageVo> packageList_sub = packageRestMapper.getRecentPackageList_Sub();
        return packageList_sub;
    }    
    @RequestMapping("/Category/Hit")
    public List<PackageVo> getPackageListCategory(@RequestParam int category_idx) {
    	System.out.println("askdjlfblkasdjfas;jdkf"+category_idx);
        List<PackageVo> packageList_sub = packageRestMapper.getPackageList_Sub_Category(category_idx);
        return packageList_sub;
    }
    @RequestMapping("/Category/Recent")
    public List<PackageVo> getRecentPackageList_Category(@RequestParam int category_idx) {
    	List<PackageVo> packageList_sub = packageRestMapper.getRecentPackageList_Sub_Categor(category_idx);
    	return packageList_sub;
    }    
    @RequestMapping("/Search/Hit")
    public List<PackageVo> getPackageListSearch(@RequestParam String keyword) {
    	System.out.println("askdjlfblkasdjfas;jdkf"+keyword);
    	List<PackageVo> packageList_sub = packageRestMapper.getPackageList_Sub_Search(keyword);
    	return packageList_sub;
    }
    @RequestMapping("/Search/Recent")
    public List<PackageVo> getRecentPackageList_Search(@RequestParam String keyword) {
    	List<PackageVo> packageList_sub = packageRestMapper.getRecentPackageList_Sub_Search(keyword);
    	return packageList_sub;
    }    
    
    @RequestMapping(value = "/Bookmark", method = RequestMethod.POST)
    public ResponseEntity<Map<String, Object>> packageBookmark(
            @RequestBody Package_BookmarkVo request,
            @SessionAttribute(name = "login", required = false) User user) {

        System.out.println("여기까지실행됨1");
        System.out.println("Request state: " + request.getState());

        Map<String, Object> response = new HashMap<>();
        int userIdx = user != null ? user.getUser_idx() : 0;

        if (userIdx == 0) {
            return ResponseEntity.badRequest().body(Collections.singletonMap("message", "User not logged in"));
        }

        if (request.getState() == 1) {
            System.out.println("여기까지실행됨2");
            packageRestMapper.insertBookmark(request.getPackage_idx(), userIdx);
            System.out.println("여기까지실행됨3");
            response.put("state", 1);
        } else if (request.getState() == 0) {
            System.out.println("여기까지실행됨4");
            packageRestMapper.deleteBookmark(request.getPackage_idx(), userIdx);
            System.out.println("여기까지실행됨5");
            response.put("state", 0);
        } else {
            response.put("state", 0);
        }

        return ResponseEntity.ok(response);
    }
    @PostMapping("/Package/Delete/Review")
    public void deleteReview(@RequestParam int package_review_idx) {
        System.out.println("요청받은 package_review_idx: " + package_review_idx);
        packageRestMapper.deleteReview(package_review_idx);
    }
}
    
