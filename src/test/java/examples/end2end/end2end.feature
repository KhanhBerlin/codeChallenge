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


 Scenario: purchase 1 item successful
  * waitFor(webElement.userNameInput)
  * click(webElement.userNameInput).input('standard_user')
  * click(webElement.passwordInput).input('secret_sauce')
  * click(webElement.submitButton)
  * waitFor(webElement.inventoryItems)
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
  * waitFor(webElement.userNameInput)
  * click(webElement.userNameInput).input('standard_user')
  * click(webElement.passwordInput).input('secret_sauce')
  * click(webElement.submitButton)
  * waitFor(webElement.inventoryItems)
  * def backpackPrice = '29.99'
  * def orderSuccessMsg = 'Thank you for your order!'
  * click(webElement.selectTab)
  * sleep(500)
  * select(webElement.selectTab, 2)
  * sleep(500)
  * mouse(webElement.selectTabLo2Hi).click()
  * sleep(1000)
  # select seems not working in vanilla mode
 # how to continue this progress
 # write java or JS script to check price that is low to high

 Scenario: login failed
  * def errorMsg = 'Epic sadface: Username and password do not match any user in this service'
  * waitFor(webElement.userNameInput)
  * click(webElement.userNameInput).input('aaaaaa')
  * click(webElement.passwordInput).input('sssssssss')
  * click(webElement.submitButton)
  * waitForText('body', errorMsg)
