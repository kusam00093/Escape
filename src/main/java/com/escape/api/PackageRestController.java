package com.escape.api;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;


import com.escape.domain.PackageVo;
import com.escape.mapper.PackageRestMapper;

@RestController
public class PackageRestController {

    @Autowired
    private PackageRestMapper packageRestMapper;
    

    @RequestMapping("/Hit")
    public List<PackageVo> getPackageList1() {
    	
    	List<PackageVo> packageList_sub = packageRestMapper.getPackageList_Sub();
    	
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
    

}
    
