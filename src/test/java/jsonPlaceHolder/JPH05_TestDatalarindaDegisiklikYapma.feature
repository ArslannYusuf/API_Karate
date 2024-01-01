@api
Feature: Kullanici efature disindan kullandigi test datalarinda degisiklik yapabilmeli


  Background:
    * def baseUrl = 'https://jsonplaceholder.typicode.com'
    * def pathParams = '/posts/70'
    * def requestBody = read("td_requestBody.json")
    * def expectedResponse = read("td_expectedResponse.json")

  # * def requestBody = read("td_requestBody.json") step'i ile JSON objelerini td_expectedResponse.json dosyasi uzerinden okutarak kullandim

  # kompleks datalarda testlerimin surdurulebilir olmasi ve ilgili degisiklikleri yapabilme adina
  # td_expectedResponse.json dosyasi uzerinden kolayca update islemi yapabilirim

  Scenario: TC05 feature disindan kullanilan Json Obje'lerinde spesifik degisiklikler yapabilmeli
    Given url baseUrl
    And path pathParams
    Then set requestBody.title = 'Leon'
    And set requestBody.body = 'Are you ready'
    And request requestBody
    When method PUT
    Then status 200
    And match header Content-Type == 'application/json; charset=utf-8'
    And match header Connection == 'keep-alive'
    Then set expectedResponse.title = 'Leon'
    And set expectedResponse.body = 'Are you ready'
    And match response == expectedResponse

    # NOTES:
    # kompleks yapidaki JSON objelerinde kucuk degisiklikleri asagidaki gibi uygulayabilirim
    # Then set requestBody.title = 'Leon' --> seklindeki set islemini And request requestBody once yapmaliyim
    # ayrica, And match response == expectedResponse --> assert isleminden once de ilgili degisiklikleri expectedResponse uzerinde de gerceklestirmeliyim