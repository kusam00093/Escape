IMP.init("imp76100125");

const button = document.querySelector("button");

const onClickPay = async () => {
	
	IMP.request_pay({
		pg : 'kakaopay',
        pay_method : 'card',
        merchant_uid: "IMP" + makeMerchantUid, 
        name : '대한항공',
        amount : '250000',
	}, function(response) {
		const { status, err_msg } = response;
		
		if (err_msg) {
			alert(err_msg);
		}
		
		if (status === 'paid') {
			const { imp_uid } = response;
			verifyPayment(imp_uid);
		}
		
	})
	
};

button.addEventListener("click", onClickPay);