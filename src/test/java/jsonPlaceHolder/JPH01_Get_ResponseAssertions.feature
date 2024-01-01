 # https://github.com/karatelabs/karate sayfasi üzerinden ilgili step methodlarina ulasabilirim

 @api
Feature: JPH01 Kulanici GET Resquest sonucu donen response'i test eder

  Scenario: TC01 Get request'e donen response'in beklenilen ozelliklerde olmasi gerekir

Given url 'https://jsonplaceholder.typicode.com/posts/44'
    When method GET
    Then status 200
    And match header Content-Type == 'application/json; charset=utf-8'
    And match response.userId == 5
    And assert response.title == 'optio dolor molestias sit'