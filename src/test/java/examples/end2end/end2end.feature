Feature: sample karate test script
for help, see: https://github.com/karatelabs/karate/wiki/IDE-Support

 Background:
  * configure driver = chromeConfig
  * configure retry = { count: 10, interval: 1000 }
  * def sleep = function(millis){ java.lang.Thread.sleep(millis) }
  * driver 'https://www.saucedemo.com/'
  * waitUntil("document.readyState == 'complete'")
  * driver fullscreen()
  * def webElement = read('webElements.json')
  * waitFor(webElement.userNameInput)
  * click(webElement.userNameInput).input('standard_user')
  * click(webElement.passwordInput).input('secret_sauce')
  * click(webElement.submitButton)
  * waitFor(webElement.inventoryItems)

 Scenario: purchase 1 item successful
  * def backpackPrice = '29.99'
  * def orderSuccessMsg = 'Thank you for your order!'
  * click(webElement.backpackItem)
  * sleep(500)
  * waitFor(webElement.backpackItemDetail)
  * waitForUrl('/inventory-item.html?id=4')
  * sleep(500)
  * click(webElement.backpackAddToCart)
  * sleep(500)
  * click(webElement.shoppingCartIcon)
  * sleep(500)
  * waitForUrl('/cart.html')
  * waitForText('body', backpackPrice)
  * click(webElement.shoppingCartContainer)
  * sleep(500)
  * click(webElement.checkoutButton)
  * sleep(500)
  * waitFor(webElement.checkoutFirstName)
  * click(webElement.checkoutFirstName).input('standard_user')
  * click(webElement.checkoutLastName).input('secret_sauce')
  * click(webElement.checkoutZipCode).input('12345')
  * click(webElement.checkoutContinue)
  * waitForText('body', backpackPrice)
  * click(webElement.checkoutFinish)
  * waitForText('body', orderSuccessMsg)

 Scenario: low price to high price
  * def backpackPrice = '29.99'
  * def orderSuccessMsg = 'Thank you for your order!'
  * mouse(webElement.selectTab).click()
  * sleep(500)
  * mouse(webElement.selectTabLo2Hi).click()
  * sleep(5000)