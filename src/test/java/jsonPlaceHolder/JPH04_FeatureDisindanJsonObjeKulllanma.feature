Feature: JPH04 Kullanici Json objesi olan test datalarini feature disinda olusturabilme

Background:
  * def baseUrl = 'https://jsonplaceholder.typicode.com'
  * def pathParams = '/posts/70'
  * def requestBody = read("td_requestBody.json")
  * def expectedResponse = read("td_expectedResponse.json")

  # * def requestBody = read("td_requestBody.json") step'i ile JSON objelerini td_expectedResponse.json dosyasi uzerinden okutarak kullandim

  # kompleks datalarda testlerimin surdurulebilir olmasi ve ilgili degisiklikleri yapabilme adina
  # td_expectedResponse.json dosyasi uzerinden kolayca update islemi yapabilirim

  Scenario: TC04 feature disindan Json Obje Kullanilabilmeli
    Given url baseUrl
    And path pathParams
    And request requestBody
    When method PUT
    Then status 200
    And match header Content-Type == 'application/json; charset=utf-8'
    And match header Connection == 'keep-alive'
    And match response == expectedResponse
