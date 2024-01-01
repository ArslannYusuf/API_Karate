# gherkin language'de 5. keyword olarak "*" kullanabilirim (hepsini kapsar)

Feature: JPH03 Kullanici test datalarini Feature icinde testten once tanimlayabilmeli

  Background: Test Datalarini Tanimlama
    * def baseUrl = 'https://jsonplaceholder.typicode.com'
    * def pathParams = '/posts/70'
    * def requestBody =
              """
              {
              "title":"Yusuf",
              "body":"Never Back Down",
              "userId":16,
              "id":70
              }
              """
    * def expectedResponse =
              """
              {
              "title":"Yusuf",
              "body":"Never Back Down",
              "userId":16,
              "id":70
              }
              """

  Scenario: TC03 Background Kullanilabilmeli

    Given url baseUrl
    And path pathParams
    And request requestBody
    When method PUT
    Then status 200
    And match header Content-Type == 'application/json; charset=utf-8'
    And match header Connection == 'keep-alive'
    And match response == expectedResponse



    # Response ile expectedResponse'in ayni oldugunu test etmek icin tek tek tum attribute'leri karsilastirmaya gerek yok
    # And assert response.title == expectedResponse.title
    # And assert response.body == expectedResponse.body
    # And assert response.userId == expectedResponse.userId
    # And assert response.id == expectedResponse.id

    # Direk JSON objelerinin ayni oldugunu test edebilirim --> And match response == expectedResponse






