window.addEventListener('load', () => {
  if ( document.getElementById('item-price')){
  const priceInput = document.getElementById("item-price");
  
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    
    
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));
    

    const addGrossProfit = document.getElementById("profit");
    addGrossProfit.innerHTML = (Math.floor(inputValue * 0.9));
    
  })
  }
});

const imageUpload = () => {
  window.addEventListener('load', () => {
    if ( document.getElementById('item-price')){
    const priceInput = document.getElementById("item-price");
    
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      
      
      const addTaxDom = document.getElementById("add-tax-price");
      addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));
      
  
      const addGrossProfit = document.getElementById("profit");
      addGrossProfit.innerHTML = (Math.floor(inputValue * 0.9));
      
    })
    }
  });
}

