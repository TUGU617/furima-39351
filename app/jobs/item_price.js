window.addEventListener('load', function(){
const priceInput = document.getElementById("item-price");
const addTaxDom = document.getElementById ("add-tax-price")
const profitDom = document.getElementById ("profit")

priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const taxPrice = Math.floor(inputValue * 0.1); // 販売手数料の計算（価格の10%）
    addTaxDom.innerHTML = taxPrice;
    const salesProfit = Math.floor(inputValue - taxPrice); // 販売利益の計算
    profitDom.innerHTML = salesProfit
})
})