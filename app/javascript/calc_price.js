function calcProfit() {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const itemVal = itemPrice.value;
    const itemTax = itemVal * 0.1;
    const itemProfit = itemVal * 0.9;    
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = Math.floor(`${itemTax}`);
    const profit = document.getElementById("profit")
    profit.innerHTML = Math.floor(`${itemProfit}`);
  });
}

window.addEventListener("load", calcProfit);