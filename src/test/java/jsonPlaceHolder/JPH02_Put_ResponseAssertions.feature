# https://github.com/karatelabs/karate sayfasi üzerinden ilgili step methodlarina ulasabilirim


Feature: JPH02 Kulanici PUT Resquest sonucu donen response bilgilerini test eder

  Scenario: TC02 Put request sonucu donen response expected degerlere uygun olmali
    Given url 'https://jsonplaceholder.typicode.com'
    And path '/posts/70'
    And request
        """
        {
        "title":"Yusuf",
        "body":"Never Back Down",
        "userId":16,
        "id":70
        }
        """
    # request body'i yukaridaki gibi 3 tane " kullanarak tanimlayabiliyorum
  
    When method PUT
    Then status 200
    And match header Content-Type == 'application/json; charset=utf-8'
    And match header Connection == 'keep-alive'
    And assert response.title == 'Yusuf'
    And assert response.body == 'Never Back Down'
    And assert response.userId == 16
    And assert response.id == 70