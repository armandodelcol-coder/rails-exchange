document.addEventListener('turbolinks:load', function () {
  let resultElement = document.getElementById('result')
  let amountElement = document.getElementById('amount')

  document.getElementById('exchange_form').addEventListener('ajax:success', function (event) {
    let [result] = event.detail
    resultElement.value = result.value
    amountElement.readOnly = false
  })

  let cleanForm = () => {
    resultElement.value = ""
    amountElement.value = ""
  }

  let handleConvert = () => {
    amountElement = amountElement
    submitButton = document.getElementById('submit-button')

    if (amountElement.value > 0) {
      submitButton.click()
      amountElement.readOnly = true
    } else {
      resultElement.value = ""
    }
  }

  amountElement.onkeyup = handleConvert
  amountElement.onchange = handleConvert

  document.getElementById('target_currency').onchange = cleanForm
  document.getElementById('source_currency').onchange = cleanForm

  document.getElementById('change-button').onclick = function () {
    let target = document.getElementById('target_currency').value
    let source = document.getElementById('source_currency').value

    document.getElementById('target_currency').value = source
    document.getElementById('source_currency').value = target

    handleConvert()
  }
})
