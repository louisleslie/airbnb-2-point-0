
const validDates = (startDate, endDate) => {
  const today = new Date();
  today.setHours(0,0,0,0);
  if ((Date.parse(startDate.value) >= Date.parse(endDate.value)) || (Date.parse(startDate.value) < today )) {
      return false;
    }
  else {
    return true;
  }
}


const updateTotalCost = () => {
  let totalCost = document.querySelector('#total-price');
  let price = Number.parseFloat(document.querySelector('#total-price').innerText.split("£")[1]);
  console.log(price);
  let totalNights = document.querySelector('#number-of-nights');
  let startDate = document.querySelector('#booking_start_date');
  let costForm = document.querySelector('#booking_total_cost');
  let endDate = document.querySelector('#booking_end_date');
  // console.log(startDate.value);
  let number_of_nights = 1;
  startDate.addEventListener('change', () => {
    if (validDates(startDate, endDate)) {
      number_of_nights = (Date.parse(endDate.value) - Date.parse(startDate.value)) / 1000 / 60 / 60 / 24;
      if (Number.isInteger(number_of_nights)) {
        totalNights.style.color = "black";
        totalNights.innerText = `${number_of_nights} night${(number_of_nights === 1 ? '' : 's') }`;
        totalCost.innerText = `<strong>Total:</strong> £ ${(number_of_nights * price).toFixed(2)}`;
        costForm.value = number_of_nights * price;
      }
    } else {
      totalNights.innerText = "Start date must be after today and the end date must be more than one day after";
      totalNights.style.color = "red";
    }
  });
  endDate.addEventListener('change', () => {
    if (validDates(startDate, endDate)) {
      number_of_nights = (Date.parse(endDate.value) - Date.parse(startDate.value)) / 1000 / 60 / 60 / 24;
      if (Number.isInteger(number_of_nights)) {
        totalNights.style.color = "black";
        totalNights.innerText = `${number_of_nights} night${(number_of_nights === 1 ? '' : 's') }`;
        totalCost.innerHTML = `<strong>Total:</strong> £${(number_of_nights * price).toFixed(2)}`;
        costForm.value = number_of_nights * price;
      }
    } else {
      totalNights.innerText = "Start date must be after today and the end date must be more than one day after";
      totalNights.style.color = "red";
    }
    // totalCost.innerText = `<strong>Total:</strong> £ ${number_of_nights * price}`;
  });
};

export { updateTotalCost }