function price (){
  const ItemPrice  = document.getElementById("item-price");
  
  ItemPrice.addEventListener("keyup", () => {
    const feeValue  = ItemPrice.value;
    const price = Math.floor(feeValue / 10)
    const Fee  = document.getElementById("add-tax-price");
    const Profit  = document.getElementById("profit");
    Fee.innerHTML = `${price}`;
    Profit.innerHTML = `${feeValue - price}`;
  });
}

window.addEventListener('load', price);