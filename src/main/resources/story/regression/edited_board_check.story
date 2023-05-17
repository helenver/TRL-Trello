GivenStories:/story/precondition/create_api_board.story

Scenario: On UI update the board created via API
When I log in with ${email} and ${password}
When I click on element located by `By.xpath(//div[@title='${boardName}'])`
Given I initialize story variable `newName` with value `#{generate(Ancient.hero)}`
When I click on element located by `By.xpath(//div[@data-testid='board-name-container'])`
When I change ${boardName} to ${newName}
Then text `${newName}` exists

Scenario: Delete board via API
When I delete the board with ${boardId} via API
