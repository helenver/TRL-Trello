GivenStories:/story/precondition/create_card_with_details.story

Scenario: Log in as a board creator
When I log in with ${email} and ${password}

Scenario: Find the cards assigned to me
When I click on element located by `By.xpath(//div[@title='${boardName}'])`
When I click on element located by `By.buttonName(Filter)`
When I click on element located by `By.xpath(//*[@title="Cards assigned to me"])`
Then field located `By.xpath(//span[@data-testid="filter-popover-button-card-count" and text()='1'])` exists
Then number of elements found by `By.xpath(//span[text()='${cardName}'])` is equal to `1`
Then number of elements found by `By.xpath(//span[text()='${secondCardName}'])` is equal to `0`
When I click on element located by `By.xpath(//*[@title="Cards assigned to me"])`
When I wait until state of element located by `By.xpath(//*[@title="Cards assigned to me"])` is not selected
Then number of elements found by `By.xpath(//span[text()='${secondCardName}'])` is equal to `1`

Scenario: Find the cards by 'No members' option
When I click on element located by `By.xpath(//*[@title="No members"])`
Then field located `By.xpath(//span[@data-testid="filter-popover-button-card-count" and text()='1'])` exists
Then number of elements found by `By.xpath(//span[text()='${secondCardName}'])` is equal to `1`
Then number of elements found by `By.xpath(//span[text()='${cardName}'])` is equal to `0`
When I click on element located by `By.xpath(//*[@title="No members"])`
When I wait until state of element located by `By.xpath(//*[@title="No members"])` is not selected
Then number of elements found by `By.xpath(//span[text()='${cardName}'])` is equal to `1`

Scenario: Find the card by 'Due in the next week' option
When I click on element located by `By.caseSensitiveText(Show more options)`
When I click on element located by `By.xpath(//*[@title="Due in the next week"])`
Then field located `By.xpath(//span[@data-testid="filter-popover-button-card-count" and text()='1'])` exists
Then number of elements found by `By.xpath(//span[text()='${secondCardName}'])` is equal to `0`
Then number of elements found by `By.xpath(//span[text()='${cardName}'])` is equal to `1`
When I click on element located by `By.xpath(//*[@title="Due in the next week"])`
When I wait until state of element located by `By.xpath(//*[@title="Due in the next week"])` is not selected
Then number of elements found by `By.xpath(//span[text()='${secondCardName}'])` is equal to `1`

Scenario: Find the card by 'Not marked as complete' option
When I click on element located by `By.xpath(//*[@title="Not marked as complete"])`
Then number of elements found by `By.xpath(//span[text()='${cardName}'])` is equal to `1`
Then number of elements found by `By.xpath(//span[text()='${secondCardName}'])` is equal to `1`
Then field located `By.xpath(//span[@data-testid="filter-popover-button-card-count" and text()='2'])` exists
When I click on element located by `By.xpath(//*[@title="Not marked as complete"])`
When I wait until state of element located by `By.xpath(//*[@title="Not marked as complete"])` is not selected

Scenario: Find the card by both 'Overdue' and 'Marked as complete' options
When I click on element located by `By.xpath(//*[@title="Overdue"])`
When I click on element located by `By.xpath(//*[@title="Marked as complete"])`
Then number of elements found by `By.xpath(//span[text()='${cardName}'])` is equal to `0`
Then number of elements found by `By.xpath(//span[text()='${secondCardName}'])` is equal to `0`
Then field located `By.xpath(//span[@data-testid="filter-popover-button-card-count" and text()='0'])` exists
When I click on element located by `By.xpath(//*[@title="Overdue"])`
When I wait until state of element located by `By.xpath(//*[@title="Overdue"])` is not selected
When I click on element located by `By.xpath(//*[@title="Marked as complete"])`
When I wait until state of element located by `By.xpath(//*[@title="Marked as complete"])` is not selected
Then number of elements found by `By.xpath(//span[text()='${cardName}'])` is equal to `1`
Then number of elements found by `By.xpath(//span[text()='${secondCardName}'])` is equal to `1`

Scenario: Find the card by its name
When I enter `${cardName}` in field located by `By.xpath(//input[@placeholder="Enter a keyword…"])`
Then the text '${secondCardName}' does not exist
Then number of elements found by `By.xpath(//span[text()='${cardName}'])` is equal to `1`
When I wait until element located by `By.xpath(//span[@data-testid="filter-popover-button-card-count" and text()='1'])` appears
When I clear field located by `By.xpath(//input[@placeholder="Enter a keyword…"])`
When I execute sequence of actions:
|type      |argument     |
|PRESS_KEYS|SPACE        |
When I wait until state of element located by `By.xpath(//*[@title="Cards assigned to me"])` is visible
Then text `${secondCardName}` exists
Then text `${cardName}` exists

Scenario: Find the label in the Filter popover
When I enter `${labelName}` in field located by `By.xpath(//input[@placeholder="Enter a keyword…"])`
Then field located `By.xpath(//div[text()='${labelName}'])` exists
When I click on element located by `By.xpath(//div[text()='${labelName}'])`
When I clear field located by `By.xpath(//input[@placeholder="Enter a keyword…"])`
Then field located `By.xpath(//span[@data-testid="filter-popover-button-card-count" and text()='0'])` exists
When I click on element located by `By.xpath(//div[text()='${labelName}'])`
Then field located `By.xpath(//*[@title="Cards assigned to me"])` exists
When I wait until state of element located by `By.xpath(//*[@title="Cards assigned to me"])` is visible
Then number of elements found by `By.xpath(//span[text()='${cardName}'])` is equal to `1`
Then number of elements found by `By.xpath(//span[text()='${secondCardName}'])` is equal to `1`

Scenario: Delete board via API
When I delete the board with ${boardId} via API
