package com.escape.airplane.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.escape.airplane.domain.AirplaneTimeVo;
import com.escape.airplane.domain.AirplaneVo;
import com.escape.airplane.mapper.AirplaneMapper;
import com.escape.kakao.domain.PaymentVo;
import com.escape.kakao.exception.DuplicateReservationException;
import com.escape.kakao.mapper.PaymentMapper;
import com.escape.kakao.service.KakaoPayService;
import com.escape.login.domain.User;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/Airplane")
public class AirplaneController {

	@Autowired
	private AirplaneMapper airplaneMapper;
	
	@Autowired
	private KakaoPayService kakaoPayService;
	
	@Autowired
    private PaymentMapper paymentMapper;
	
	@RequestMapping("/Main")
	public ModelAndView main( AirplaneVo airplaneVo, HttpServletRequest request, User user ) {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("airplane/airplanemain");
		return mv;
		
	}
	
	@RequestMapping("/Search")
    @ResponseBody
    public ModelAndView search( @RequestParam Map<String, Object> params, AirplaneTimeVo airplaneTimeVo ) {

		String id = (String) params.get("id");
		String depCity1 = (String) params.get("depCity1");
        String depCity2 = (String) params.get("depCity2");
        String arrCity1 = (String) params.get("arrCity1");
        String arrCity2 = (String) params.get("arrCity2");
        String depCityCode1 = (String) params.get("depCityCode1");
        String depCityCode2 = (String) params.get("depCityCode2");
        String arrCityCode1 = (String) params.get("arrCityCode1");
        String arrCityCode2 = (String) params.get("arrCityCode2");
        String depDate = (String) params.get("depDate");
        String arrDate = (String) params.get("arrDate");
        String initform = (String) params.get("initform");
        String seatClass = (String) params.get("seatClass");
        int stype = Integer.parseInt( (String) params.get("stype") );
        int adultCount = Integer.parseInt( (String) params.get("adultCount") );
        int childCount = Integer.parseInt( (String) params.get("childCount") );
        int infantCount = Integer.parseInt( (String) params.get("infantCount") );
        
        ModelAndView mv = new ModelAndView();
        mv.addObject("params", params);
        mv.addObject("id", id);
        mv.addObject("depCity1", depCity1);
        mv.addObject("depCity2", depCity2);
        mv.addObject("arrCity1", arrCity1);
        mv.addObject("arrCity2", arrCity2);
        mv.addObject("depCityCode1", depCityCode1);
        mv.addObject("depCityCode2", depCityCode2);
        mv.addObject("arrCityCode1", arrCityCode1);
        mv.addObject("arrCityCode2", arrCityCode2);
        mv.addObject("depDate", depDate);
        mv.addObject("arrDate", arrDate);
        mv.addObject("initform", initform);
        mv.addObject("seatClass", seatClass);
        mv.addObject("stype", stype);
        mv.addObject("adultCount", adultCount);
        mv.addObject("childCount", childCount);
        mv.addObject("infantCount", infantCount);
        mv.setViewName("airplane/airplanesearch");
        return mv;
        
    }
	
	@RequestMapping("/AirplanePay")
    public ModelAndView airplanepay(
        @RequestParam Map<Object, Object> params,
        AirplaneTimeVo airplaneTimeVo
    ) {

        System.out.println("===== AirplanePay === params: " + params);

        int user_idx = airplaneMapper.getUserIdx(params.get("userId"));
        System.out.println("===== Airplane/AirplanePay === user_idx: " + user_idx);

        int orderId1 = Integer.parseInt((String) params.get("orderId1"));
        int orderId2 = Integer.parseInt((String) params.get("orderId2"));
        String userId = (String) params.get("userId");
        String itemName1 = (String) params.get("itemName1");
        String itemName2 = (String) params.get("itemName2");
        String seatClass = (String) params.get("seatClass");
        int stype = Integer.parseInt((String) params.get("stype"));
        int adultCount = Integer.parseInt((String) params.get("adultCount"));
        int childCount = Integer.parseInt((String) params.get("childCount"));
        int infantCount = Integer.parseInt((String) params.get("infantCount"));
        int totalCount = adultCount + childCount + infantCount;
        String initform = (String) params.get("initform");

        // ptype_idx 별 가격 계산
        int adultPrice1 = airplaneMapper.getPriceInfo(orderId1, 1, stype) * adultCount;
        int childPrice1 = airplaneMapper.getPriceInfo(orderId1, 2, stype) * childCount;
        int infantPrice1 = airplaneMapper.getPriceInfo(orderId1, 3, stype) * infantCount;
        int price1 = adultPrice1 + childPrice1 + infantPrice1;
        int adultPrice2 = airplaneMapper.getPriceInfo(orderId2, 1, stype) * adultCount;
        int childPrice2 = airplaneMapper.getPriceInfo(orderId2, 2, stype) * childCount;
        int infantPrice2 = airplaneMapper.getPriceInfo(orderId2, 3, stype) * infantCount;
        int price2 = adultPrice2 + childPrice2 + infantPrice2;
        String totalPrice = (String) params.get("totalPrice");
        
        int known1 = Integer.parseInt((String) params.get("known1"));
        int known2 = Integer.parseInt((String) params.get("known2"));
        int seat_su1 = Integer.parseInt((String) params.get("seat_su1"));
        int seat_su2 = Integer.parseInt((String) params.get("seat_su2"));
        
        System.out.println("===== AirplanePay === orderId1: " + orderId1);
		System.out.println("===== AirplanePay === orderId2: " + orderId2);
		System.out.println("===== AirplanePay === userId: " + userId);
		System.out.println("===== AirplanePay === itemName1: " + itemName1);
		System.out.println("===== AirplanePay === itemName2: " + itemName2);
		System.out.println("===== AirplanePay === seatClass: " + seatClass);
		System.out.println("===== AirplanePay === stype: " + stype);
		System.out.println("===== AirplanePay === adultCount: " + adultCount);
		System.out.println("===== AirplanePay === childCount: " + childCount);
		System.out.println("===== AirplanePay === infantCount: " + infantCount);
		System.out.println("===== AirplanePay === totalCount: " + totalCount);
		System.out.println("===== AirplanePay === initform: " + initform);
		System.out.println("===== AirplanePay === adultPrice1: " + adultPrice1);
		System.out.println("===== AirplanePay === childPrice1: " + childPrice1);
		System.out.println("===== AirplanePay === infantPrice1: " + infantPrice1);
		System.out.println("===== AirplanePay === price1: " + price1);
		System.out.println("===== AirplanePay === adultPrice2: " + adultPrice2);
		System.out.println("===== AirplanePay === childPrice2: " + childPrice2);
		System.out.println("===== AirplanePay === infantPrice2: " + infantPrice2);
		System.out.println("===== AirplanePay === price2: " + price2);
		System.out.println("===== AirplanePay === totalPrice: " + totalPrice);

        String paymentUrl = kakaoPayService.readyToPay(orderId1, orderId2, userId, itemName1, itemName2, seatClass, adultCount, childCount, infantCount, totalPrice, user_idx, airplaneTimeVo );
        System.out.println("===== AirplanePay === paymentUrl: " + paymentUrl);
        
        ModelAndView mv = new ModelAndView();
        mv.addObject("orderId1", orderId1);
        mv.addObject("orderId2", orderId2);
        mv.addObject("userId", userId);
        mv.addObject("user_idx", user_idx);
        mv.addObject("itemName1", itemName1);
        mv.addObject("itemName2", itemName2);
        mv.addObject("seatClass", seatClass);
        mv.addObject("adultCount", adultCount);
        mv.addObject("childCount", childCount);
        mv.addObject("infantCount", infantCount);
        mv.addObject("totalCount", totalCount);
        mv.addObject("adultPrice1", adultPrice1);
        mv.addObject("childPrice1", childPrice1);
        mv.addObject("infantPrice1", infantPrice1);
        mv.addObject("price1", price1);
        mv.addObject("adultPrice2", adultPrice2);
        mv.addObject("childPrice2", childPrice2);
        mv.addObject("infantPrice2", infantPrice2);
        mv.addObject("price2", price2);
        mv.addObject("totalPrice", totalPrice);
        mv.addObject("known1", known1);
        mv.addObject("known2", known2);
        mv.addObject("seat_su1", seat_su1);
        mv.addObject("seat_su2", seat_su2);
        mv.addObject("paymentUrl", paymentUrl); // 결제 URL 추가
        mv.setViewName("airplane/airplanepay");
        //mv.setViewName("airplane/airplanepaybefore");
        return mv;
    }
	
	@RequestMapping("/AirplanePayOW")
	public ModelAndView airplanepayOW(
			@RequestParam Map<Object, Object> params,
			AirplaneTimeVo airplaneTimeVo
			) {
		
		System.out.println("===== AirplanePayOW === params: " + params);
		
		int user_idx = airplaneMapper.getUserIdx(params.get("userId"));
		System.out.println("===== AirplanePayOW === user_idx: " + user_idx);
		
		int orderId1 = Integer.parseInt((String) params.get("orderId1"));
		String userId = (String) params.get("userId");
		String itemName1 = (String) params.get("itemName1");
		String seatClass = (String) params.get("seatClass");
		int stype = Integer.parseInt((String) params.get("stype"));
		int adultCount = Integer.parseInt((String) params.get("adultCount"));
		int childCount = Integer.parseInt((String) params.get("childCount"));
		int infantCount = Integer.parseInt((String) params.get("infantCount"));
		int totalCount = adultCount + childCount + infantCount;
		String initform = (String) params.get("initform");
		
		int known1 = Integer.parseInt((String) params.get("known1"));
        int seat_su1 = Integer.parseInt((String) params.get("seat_su1"));
		
		// ptype_idx 별 가격 계산
		int adultPrice1 = airplaneMapper.getPriceInfo(orderId1, 1, stype) * adultCount;
		int childPrice1 = airplaneMapper.getPriceInfo(orderId1, 2, stype) * childCount;
		int infantPrice1 = airplaneMapper.getPriceInfo(orderId1, 3, stype) * infantCount;
		int price1 = adultPrice1 + childPrice1 + infantPrice1;
		String totalPrice = (String) params.get("totalPrice");
		
		System.out.println("===== AirplanePayOW === orderId1: " + orderId1);
		System.out.println("===== AirplanePayOW === userId: " + userId);
		System.out.println("===== AirplanePayOW === itemName1: " + itemName1);
		System.out.println("===== AirplanePayOW === seatClass: " + seatClass);
		System.out.println("===== AirplanePayOW === stype: " + stype);
		System.out.println("===== AirplanePayOW === adultCount: " + adultCount);
		System.out.println("===== AirplanePayOW === childCount: " + childCount);
		System.out.println("===== AirplanePayOW === infantCount: " + infantCount);
		System.out.println("===== AirplanePayOW === totalCount: " + totalCount);
		System.out.println("===== AirplanePayOW === initform: " + initform);
		System.out.println("===== AirplanePayOW === adultPrice1: " + adultPrice1);
		System.out.println("===== AirplanePayOW === childPrice1: " + childPrice1);
		System.out.println("===== AirplanePayOW === infantPrice1: " + infantPrice1);
		System.out.println("===== AirplanePayOW === price1: " + price1);
		System.out.println("===== AirplanePayOW === totalPrice: " + totalPrice);
		
		String paymentUrl = kakaoPayService.readyToPay2(orderId1, userId, itemName1, seatClass, adultCount, childCount, infantCount, totalPrice, user_idx, airplaneTimeVo );
		System.out.println("===== AirplanePayOW === paymentUrl: " + paymentUrl);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("orderId1", orderId1);
		mv.addObject("userId", userId);
		mv.addObject("user_idx", user_idx);
		mv.addObject("itemName1", itemName1);
		mv.addObject("seatClass", seatClass);
		mv.addObject("adultCount", adultCount);
		mv.addObject("childCount", childCount);
		mv.addObject("infantCount", infantCount);
		mv.addObject("totalCount", totalCount);
		mv.addObject("adultPrice1", adultPrice1);
		mv.addObject("childPrice1", childPrice1);
		mv.addObject("infantPrice1", infantPrice1);
		mv.addObject("price1", price1);
		mv.addObject("totalPrice", totalPrice);
		mv.addObject("known1", known1);
		mv.addObject("seat_su1", seat_su1);
		mv.addObject("paymentUrl", paymentUrl); // 결제 URL 추가
		mv.setViewName("airplane/airplanepay2");
		return mv;
	}

    @RequestMapping("/PaySuccess")
    @ResponseBody
    public ResponseEntity<?> PaySuccess(@RequestBody PaymentVo paymentVo) {
    	
    	System.out.println("===== PaySuccess/paymentVo: " + paymentVo);
    	
    	int orderId1 = paymentVo.getAirplane_time_idx1();
    	int orderId2 = paymentVo.getAirplane_time_idx2();
    	String userId = paymentVo.getUserId();
    	int user_idx = paymentVo.getUser_idx();
    	String itemName1 = paymentVo.getItemName1();
    	String itemName2 = paymentVo.getItemName2();
    	int totalCount = paymentVo.getTotalCount();
    	int totalPrice = paymentVo.getTotalPrice();
    	int price1 = paymentVo.getPrice1();
    	int price2 = paymentVo.getPrice2();
    	
    	System.out.println("===== PaySuccess/orderId1: " + orderId1);
    	System.out.println("===== PaySuccess/userId: " + userId);
    	
        //kakaoPayService.savePayment(paymentVo, orderId1, orderId2, userId, user_idx, itemName1, itemName2, totalCount, totalPrice, price1, price2);
    	try {
    		kakaoPayService.savePayment(paymentVo, orderId1, orderId2, userId, user_idx, itemName1, itemName2, totalCount, totalPrice, price1, price2);
            return ResponseEntity.ok().body("{\"status\":\"success\"}");
        } catch (DuplicateReservationException e) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body(e.getMessage());
        }

        //Map<String, String> response = new HashMap<>();
        //response.put("status", "success");

        //return ResponseEntity.ok(response);
    }
    
    @RequestMapping("/PaySuccessOW")
    @ResponseBody
    public ResponseEntity<?> PaySuccessOW(@RequestBody PaymentVo paymentVo) {
    	
    	System.out.println("===== PaySuccess/paymentVo: " + paymentVo);
    	
    	int orderId1 = paymentVo.getAirplane_time_idx1();
    	String userId = paymentVo.getUserId();
    	int user_idx = paymentVo.getUser_idx();
    	String itemName1 = paymentVo.getItemName1();
    	int totalCount = paymentVo.getTotalCount();
    	int totalPrice = paymentVo.getTotalPrice();
    	int price1 = paymentVo.getPrice1();
    	
    	System.out.println("===== PaySuccess/orderId1: " + orderId1);
    	System.out.println("===== PaySuccess/userId: " + userId);
    	
    	//kakaoPayService.savePayment(paymentVo, orderId1, orderId2, userId, user_idx, itemName1, itemName2, totalCount, totalPrice, price1, price2);
    	try {
    		kakaoPayService.savePayment2(paymentVo, orderId1, userId, user_idx, itemName1, totalCount, totalPrice, price1);
    		return ResponseEntity.ok().body("{\"status\":\"success\"}");
    	} catch (DuplicateReservationException e) {
    		return ResponseEntity.status(HttpStatus.CONFLICT).body(e.getMessage());
    	}
    	
    }
    
    @GetMapping("/airplaneafter")
    public String airplaneAfter() {
        return "airplane/airplanepayafter";
    }
    
    @PostMapping("/CheckReservation")
    public ResponseEntity<String> checkReservation(@RequestBody Map<String, Object> payload) {
        int orderId1 = Integer.parseInt( (String) payload.get("airplane_time_idx1") );
        int orderId2 = Integer.parseInt( (String) payload.get("airplane_time_idx2") );
        int user_idx = Integer.parseInt( (String) payload.get("user_idx") );

        int existingRecords1 = paymentMapper.checkReservationExists(user_idx, orderId1);
        int existingRecords2 = paymentMapper.checkReservationExists(user_idx, orderId2);

        if (existingRecords1 > 0 || existingRecords2 > 0) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body("이미 예약된 목록입니다.");
        }

        return ResponseEntity.ok().body("{\"status\":\"success\"}");
    }

    @PostMapping("/CheckReservationOW")
    public ResponseEntity<String> checkReservationOW(@RequestBody Map<String, Object> payload) {
    	int orderId1 = Integer.parseInt( (String) payload.get("airplane_time_idx1") );
    	int user_idx = Integer.parseInt( (String) payload.get("user_idx") );
    	
    	int existingRecords1 = paymentMapper.checkReservationExists(user_idx, orderId1);
    	
    	if (existingRecords1 > 0) {
    		return ResponseEntity.status(HttpStatus.CONFLICT).body("이미 예약된 목록입니다.");
    	}
    	
    	return ResponseEntity.ok().body("{\"status\":\"success\"}");
    }
	
}