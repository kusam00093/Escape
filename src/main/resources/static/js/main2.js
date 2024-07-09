IMP.init('imp76100125');

//--------------------------------------------------------------

const onClickPay = async (event) => {
    const button = event.target;
    const orderId1 = button.getAttribute('data-airplane-time-idx');
    const userId = button.getAttribute('data-user-id');
    const user_idx = button.getAttribute('data-user-idx');
    const itemName1 = button.getAttribute('data-airplane-name');
    const adultCount = button.getAttribute('data-adultCount');
    const childCount = button.getAttribute('data-childCount');
    const infantCount = button.getAttribute('data-infantCount');
    const totalCount = parseInt(adultCount) + parseInt(childCount) + parseInt(infantCount);
    const adultPrice1 = button.getAttribute('data-adultPrice');
    const childPrice1 = button.getAttribute('data-childPrice');
    const infantPrice1 = button.getAttribute('data-infantPrice');
    const price1 = button.getAttribute('data-price');
    const totalPrice = button.getAttribute('data-totalPrice');

    console.dir(button);
    console.log(orderId1);
    console.log(userId);
    console.log(itemName1);
    console.log(adultCount);
    console.log(childCount);
    console.log(infantCount);
    console.log(totalCount);
    console.log(adultPrice1);
    console.log(childPrice1);
    console.log(infantPrice1);
    console.log(price1);
    console.log(totalPrice);

    try {
        const res = await fetch('/Airplane/CheckReservationOW', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                airplane_time_idx1: orderId1,
                user_idx: user_idx
            })
        });

        if (res.status === 409) {
            const message = await res.text();
            alert(message);
            return;
        }

        const data = await res.json();
        if (data.status === 'success') {
            proceedWithPayment(orderId1, userId, user_idx, itemName1, totalCount, totalPrice, price1);
        } else {
            alert('예약 중 문제가 발생했습니다. 다시 시도해 주세요.');
        }
    } catch (err) {
        console.error(err);
        alert('예약 중 오류가 발생했습니다. 다시 시도해 주세요.');
    }
};

const proceedWithPayment = (orderId1, userId, user_idx, itemName1, totalCount, totalPrice, price1) => {
    IMP.request_pay({
        pg: 'kakaopay',
        pay_method: 'card',
        merchant_uid: `payment-${crypto.randomUUID()}`, // 주문 고유 번호
        name: itemName1,
        apply_su: totalCount,
        amount: totalPrice,
    }, function(response) {
        const { status, err_msg } = response;

        console.dir(response);

        if (err_msg) {
            alert(err_msg);
        }

        if (status === 'paid') {
            const { imp_uid } = response;
            fetch('/Airplane/PaySuccessOW', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    airplane_time_idx1: orderId1,
                    user_idx: user_idx,
                    state: 1,
                    applySu: totalCount,
                    price1: price1,
                    totalPrice: totalPrice,
                    userId: userId,
                    totalCount: totalCount,
                    itemName1: itemName1
                })
            })
            .then(res => {
                if (res.status === 409) {
                    return res.text().then(text => { throw new Error(text) });
                }
                return res.json();
            })
            .then(data => {
                if (data.status === 'success') {
                    alert('결제가 성공적으로 완료되었습니다.');
                    window.location.href = '/Airplane/airplaneafter'; // 결제 완료 후 페이지 이동
                } else {
                    alert('결제 처리 중 문제가 발생했습니다.');
                }
            })
            .catch(err => {
                alert(err.message); // 이미 예약된 경우 등의 에러 메시지 표시
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
                    orderId: orderId1,
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
    });
};

//--------------------------------------------------------------

document.addEventListener('DOMContentLoaded', function() {
    const buttonEls = document.querySelectorAll('.payBtn');
    console.dir(buttonEls);

    buttonEls.forEach(button => {
        button.addEventListener('click', onClickPay);
    });
});