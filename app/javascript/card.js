const pay = () => {
<<<<<<< Updated upstream
  const payjp = Payjp(process.env.PAYJP_PUBLIC_KEY);
=======
  const payjp = Payjp('pk_test_3a93957daf7ec84ad22cd578')
>>>>>>> Stashed changes
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

<<<<<<< Updated upstream
  numberElement.mount('#card-number');
  expiryElement.mount('#card-exp');
  cvcElement.mount('#card-cvc');

  const submit = document.getElementById("button");

=======
  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('##card-cvc');

  const submit = document.getElementById("button");
>>>>>>> Stashed changes
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
      } else {
        const token = response.id;
<<<<<<< Updated upstream
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      numberElement.clear();
      expiryElement.clear();
      cvcElement.clear();
      document.getElementById("charge-form").submit();
=======
        console.log(token)
      }
>>>>>>> Stashed changes
    });
  });
};

<<<<<<< Updated upstream
window.addEventListener("load", pay);
=======
window.addEventListener("load", pay);
>>>>>>> Stashed changes
