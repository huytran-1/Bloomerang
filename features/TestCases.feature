Feature: Bloomerang Volunteer Log Submission

  Scenario: Fill out all fields in the form and use a US-based address. Verify the form is submitted successfully.
    Given I launch the Form page
    Then I enter "test" in the "first_name" field
    And I enter "lastName" in the "last_name" field
    And I enter "email@bloom.com" in the "email" field
    And I enter "7376676993" in the "phone_number" field
    And I enter "4434 Hunters" in the "address" field
    And I enter "Round Rock" in the "city" field
    And I select state "TX"
    And I enter "78681" in the "zipcode" field
    And I enter "03262022" in the "volunteer_date" field
    And I enter "Test Comment" in the "comment" field
    And I click submit
    And I check if "submit-successful" is visible

  Scenario: Fill out the form with the minimum required fields. Verify the form is submitted successfully.
    Given I launch the Form page
    Then I enter "test" in the "first_name" field
    And I enter "lastName" in the "last_name" field
    And I enter "email@bloom.com" in the "email" field
    And I enter "03262022" in the "volunteer_date" field
    And I click submit
    And I check if "submit-successful" is visible

  Scenario: Fill out the form with all required fields except the Date Volunteered field. Verify that you cannot submit the form.
    Given I launch the Form page
    Then I enter "test" in the "first_name" field
    And I enter "lastName" in the "last_name" field
    And I enter "email@bloom.com" in the "email" field
    And I click submit
    And I check if "date_require" is visible
    And I check if "submit-successful" is not visible


