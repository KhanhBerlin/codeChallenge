Feature: sample karate test script
for help, see: https://github.com/karatelabs/karate/wiki/IDE-Support

 Background:
  * configure retry = { count: 10, interval: 1000 }
  * def sleep = function(millis){ java.lang.Thread.sleep(millis) }
  * driver 'https://www.saucedemo.com/'
  * waitUntil("document.readyState == 'complete'")
  * driver fullscreen()

 Scenario: login successful
  * def webElement = read('webElements.json')
  * waitFor(webElement.userNameInput)
  * click(webElement.userNameInput).input('standard_user')
  * click(webElement.passwordInput).input('secret_sauce')
  * submit().click(webElement.submitButton)