Feature: sample karate test script
for help, see: https://github.com/karatelabs/karate/wiki/IDE-Support

 Background:
  * url 'https://reqres.in/api'

 Scenario Outline: Test Pagination at users endpoint for negative Test
  Given path 'users'
  When param page = '<pageNo>'
  And param per_page = '<perPage>'
  And method get
  Then status <statusID>


  Examples:
   | pageNo | perPage   | statusID |
   |    a  |   1   |  400    |
   |    1 |  a    |   400    |
   |    -1 |  1    |   400    |
   |    1 |  -1    |   400    |
   |    0 |  0    |   400    |
   |    1 |  0    |   400    |
   |    0 |  1    |   400    |


 Scenario Outline: Test Pagination at users endpoint for positive Test
  Given path 'users'
  When param page = '<pageNo>'
  And param per_page = '<perPage>'
  And method get
  Then status 200
  Then match response.data[0].id == <pageNo>
  Then match response.data[0].first_name == '<name>'

  Examples:
   | pageNo | perPage  | name |
   |    1  |   1   |  George    |
   |    2 |  1    |   Janet    |
   |    3 |  1    |   Emma    |
   |    4 |  1    |   Eve    |
   |    5 |  1    |   Charles    |
   |    6 |  1    |   Tracey    |
   |   7 |  1    |   Michael    |
   |   8 |  1    |   Lindsay    |
   |   9 |  1    |   Tobias    |
   |  10 |  1    |   Byron    |
   |   11 |  1    |   George    |
   |   12 |  1    |   Rachel    |


 Scenario: Test Pagination at users endpoint for schema validation
  Given path 'users'
  And method get
  Then status 200
  Then match each response.data == { id: '#number', email: '#string', first_name: '#string', last_name: '#string', avatar: '#string'}


 Scenario: Test get at user  for specific id
  Given path 'users'
  When param id = 1
  And method get
  Then status 200
  Then match response.data.id == 1
  Then match response.data.first_name == 'George'