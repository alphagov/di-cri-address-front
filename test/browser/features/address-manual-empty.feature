@mock-api:address-success @success
Feature: Happy Path - confirming manual address details
  Confirming address details

  Background:
    Given Authenticalable Address Amy is using the system
    And they have started the address journey
    And they searched for their postcode "E1 8QS"
    Then they should see the results page
    When they have selected Cant find address
    Then they should see the address page

    Scenario: Changing address values and successfully passing validation
      Given they are on the address page
      When they add their flat number "1"
      And they add their house name "stratford house"
      And they add their street "Park street"
      And they add their city "London"
      And they add their residency date with a "older" move year
      And they continue to confirm address
      Then they should see the confirm page


    Scenario: Changing address values and unsuccessfully passing validation when the town or city is missing
      Given they are on the address page
      When they add their flat number "1"
      And they add their house name "stratford house"
      And they add their street "Park street"
      And they add their residency date with a "older" move year
      And they continue to confirm address
      Then they should see an error message on the address page "Enter your town or city"

    Scenario: Changing address values and unsuccessfully passing validation when the House name or number is missing
      Given they are on the address page
      When they add their street "Park street"
      And they add their city "London"
      And they add their residency date with a "older" move year
      And they continue to confirm address
      Then they should see an error message on the address page "Enter a house number or house name"
