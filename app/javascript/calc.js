function calc(){
  const tax = document.getElementById("add-tax-price");
  const price = document.getElementById("item-price");
  const profit = document.getElementById("profit");
  price.addEventListener('input',()=>{
    const inputPrice = price.value
    const inputTax = Math.floor(inputPrice*0.1);
  tax.innerHTML = inputTax;
  profit.innerHTML = inputPrice - inputTax
  })
}

window.addEventListener('load',calc)