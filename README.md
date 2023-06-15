Coding Challenge:


The coding challenge has two assignments. 

Backend testing 
Write API tests with Karate to ensure that this API is working as expected: https://reqres.in/api-docs/
Test the following functionality:
Pagination works as expected on the `/users` endpoint
1 test to validate response schema
1 user flow of your choice, where more than 1 API requests are involved 
To help you get started, we have a Karate boilerplate repository that you can clone from here: https://github.com/bitgrip/Reqres, with Maven as the build tool. If you prefer using another build tool, feel free to create your own setup. 
 

Frontend testing
The assignment is to write automated UI based E2E tests on the website https://www.saucedemo.com/. On this site, automate the following user flows
Login, place item in shopping cart and perform checkout process
Test sort functionality: ensure that items on the page https://www.saucedemo.com/inventory.html are sorted by Price (low to high)
1 more user flow of your choice
To help you get started, we have a Playwright boilerplate repository that you can clone from here: https://github.com/bitgrip/SwagLabs. However, you can also use a frontend framework of your choice. 
 
Share your solutions as links to public repositories. Do not invest more than around 2 hours on the assignment. It is okay if you are unable to complete all tasks within this time.
 
Please reach out to us if you have any questions.

#####
- API Challenge:
-- 10 min reading
-- 5 min Manual click flow
-- 5 min summerize flow
-- 10 min Test Plan
-- xx min write API Test
- no register and login the users needed
- goto straight to /users endpoint
-- Test for no Value #no needed, no values means default get...
-- NaN or Null #return on default get as default value
-- Numeric instead String, seems no 400....
-- 0 or -minus Integer
-- Integer bigger than Saved
- mvn clean install -DskipTests=true #install maven artefacts


#####
End2End Challenge:
10 min reading
5 min Manual click flow
5 min summerize flow
10 min Test Plan
xx min write End2End Test