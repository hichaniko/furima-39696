window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = inputValue * 0.1
    const profitDom = document.getElementById("profit");
    profitDom.innerHTML = inputValue * 0.9
    
  })
});
