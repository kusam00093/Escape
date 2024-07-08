IMP.init('imp76100125');

//--------------------------------------------------------------

const onClickPay = async (event) => {
	
	const button = event.target;
    const orderId = button.getAttribute('data-airplane-time-idx');
    const userId = button.getAttribute('data-user-id');
    const user_idx = button.getAttribute('data-user-idx');
    const itemName = button.getAttribute('data-airplane-name');
    const adultCount = button.getAttribute('data-adultCount');
    const childCount = button.getAttribute('data-childCount');
    const infantCount = button.getAttribute('data-infantCount');
    const totalCount = parseInt( adultCount ) + parseInt ( childCount ) + parseInt( infantCount );
    const adultPrice = button.getAttribute('data-adultPrice');
    const childPrice = button.getAttribute('data-childPrice');
    const infantPrice = button.getAttribute('data-infantPrice');
    const totalPrice = button.getAttribute('data-totalPrice');
    
    console.dir(button);
    console.log(orderId);
    console.log(userId);
    console.log(itemName);
    console.log(adultCount);
    console.log(childCount);
    console.log(infantCount);
    console.log(totalCount);
    console.log(adultPrice);
    console.log(childPrice);
    console.log(infantPrice);
    console.log(totalPrice);
	
	IMP.request_pay({
		
		pg : 'kakaopay',
        pay_method : 'card',
        //merchant_uid: "IMP" + makeMerchantUid,
        merchant_uid: `payment-${crypto.randomUUID()}`, // 주문 고유 번호 
        name : itemName,
        apply_su : totalCount,
        amount : totalPrice,
        /*buyer_email: 'gildong@gmail.com',
	    buyer_name: '홍길동',
	    buyer_tel: '010-4242-4242',
	    buyer_addr: '서울특별시 강남구 신사동',
	    buyer_postcode: '01181',*/
	    
	}, function(response) {
		const { status, err_msg } = response;
		
		console.dir(response);
		
		if (err_msg) {
			alert(err_msg);
		}
		
		if (status === 'paid') {
			const { imp_uid } = response;
			//verifyPayment(imp_uid);
			// 결제가 성공한 경우 필요한 정보를 서버로 전달
		    fetch('/Airplane/PaySuccess', {
			    method: 'POST',
			    headers: {
			        'Content-Type': 'application/json'
			    },
			    body: JSON.stringify({
			        airplane_time_idx : orderId,
			        user_idx : user_idx,
			        state: 1,
			        applySu: totalCount,
			        price : totalPrice,
			        userId: userId,
			        totalCount : totalCount
			    })
			})
			.then(res => res.json())
			.then(data => {
			    if (data.status === 'success') {
			        alert('결제가 성공적으로 완료되었습니다.');
			    } else {
			        alert('결제 처리 중 문제가 발생했습니다.');
			    }
			})
			.catch(err => {
			    console.error(err);
			});
		}
		
		if (status === 'failed') {
		    alert('결제가 실패하였습니다. 에러 메시지: ' + err_msg);
		    // 추가적으로 실패 로그를 서버로 전송하거나 다른 조치를 취할 수 있습니다.
		    fetch('/Airplane/PayFailure', {
		        method: 'POST',
		        headers: {
		            'Content-Type': 'application/json'
		        },
		        body: JSON.stringify({
		            orderId: orderId,
		            userId: userId,
		            errMsg: err_msg
		        })
		    })
		    .then(res => res.json())
		    .then(data => {
		        console.log(data);
		    })
		    .catch(err => {
		        console.error(err);
		    });
		}
		
	})
	
};

//--------------------------------------------------------------

document.addEventListener('DOMContentLoaded', function() {
	
    const buttonEls = document.querySelectorAll('.payBtn');
	console.dir(buttonEls);
      
    buttonEls.forEach(button => {
		
      button.addEventListener('click', onClickPay);
        
    });
      
});

//--------------------------------------------------------------

/*app.post("/payments/verify", async (req, res) => {
  
  const { data : {access_token } } = await axios( {
  
    url : "https://api.iamport.kr/users/getToken",
    method : "post",
    headers : { "Content-Type" : "application/json" },
    data : {
      imp_key : `${API_KEY}`,
      imp_secret : `${API_SECRET}`
    }

  });

});


app.post("/payments/check", async (req, res) => {
  
  // Get Token
  const { data : { access_token } } = await axios( {
  
    url : "https://api.iamport.kr/users/getToken",
    method : "post",
    headers : { "Content-Type" : "application/json" },
    data : {
      imp_key : `${API_KEY}`,
      imp_secret : `${API_SECRET}`
    }

  });
  
  const { imp_uid } = req.body;
  const { data : { response } } = await axios ({
    
    url : `https://api.iamport.kr/payments/${imp_uid}`,
    headers : { "Authorization" : access_token }
  
  });

  const { amount, name, merchant_uid } = response;
  
  const product = await Products.findOne( {name} );

  if(product.price === amount) {
  
    shipPackage();
    res.sendStatus(200);

  } else {
    
    reportForgedPayment();
    res.sendStatus(400);

  }

});
*/