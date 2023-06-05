GivenStories:/story/precondition/create_card_with_details.story

Scenario: Log in as a board creator
When I log in with ${email} and ${password}

Scenario: Open the board
When I click on element located by `By.xpath(//div[@title='${boardName}'])`

Scenario: Archive the list via List DDL
When I click on element located by `By.xpath(//*[@aria-label="${listName}"]/../div[@class="list-header-extras"])`
When I click on element located by `By.xpath(//a[text()="Archive this list"])`
Then number of elements found by `By.xpath(//*[@aria-label="${listName}"])` is equal to `0`

Scenario: Find the archived list in the Archive
When I click on element located by `By.xpath(//*[@aria-label="Show menu"]//*[contains(@data-testid,"MenuHorizontal")])`
When I click on element located by `By.xpath(//a[contains(@class,'open-more')])`
When I click on element located by `By.xpath(//a[contains(@class,"open-archive")])`
When I click on element located by `By.xpath(//a[text()="Switch to lists"])`
Then number of elements found by `By.xpath(//*[text()='${listName}'])` is equal to `1`

Scenario: Send the archived list to the board via Header Menu DDL
When I click on element located by `By.xpath(//a[@class="button-link js-reopen"])`
Then number of elements found by `By.xpath(//p[text()="No archived lists"])` is equal to `1`
When I click on element located by `By.xpath(//a[@title="Close the board menu."])`
Then number of elements found by `By.xpath(//*[text()='${listName}'])` is equal to `1`

Scenario: Archive all cards of the list via List DDL
When I click on element located by `By.xpath(//*[@aria-label="${listName}"]/../div[@class="list-header-extras"])`
When I click on element located by `By.xpath(//a[text()="Archive all cards in this list…"])`
When I click on element located by `By.xpath(//input[@value="Archive all"])`
Then number of elements found by `By.xpath(//span[text()="${cardName}"])` is equal to `0`
Then number of elements found by `By.xpath(//span[text()="${secondCardName}}"])` is equal to `0`

Scenario: Find all archived cards in the Archive
When I click on element located by `By.xpath(//*[@aria-label="Show menu"]//*[contains(@data-testid,"MenuHorizontal")])`
When I click on element located by `By.xpath(//a[text()="Switch to cards"])`
Then number of elements found by `By.xpath(//span[text()="${cardName}"])` is equal to `1`
Then number of elements found by `By.xpath(//span[text()="${secondCardName}"])` is equal to `1`

Scenario: Send all archived cards to the board via Header Menu DDL
When I click on element located by `By.xpath(//span[text()="${cardName}"]//following::a[@class="js-reopen"][1])`
When I click on element located by `By.xpath(//span[text()="${secondCardName}"]//following::a[@class="js-reopen"])`
Then number of elements found by `By.xpath(//p[text()="No archived cards"])` is equal to `1`
Then number of elements found by `By.xpath(//span[text()="${cardName}"])` is equal to `1`
Then number of elements found by `By.xpath(//span[text()="${secondCardName}"])` is equal to `1`
When I click on element located by `By.xpath(//a[@title="Close the board menu."])`

Scenario: Archive the created card in Card pop-up
When I click on element located by `By.xpath(//span[text()="${cardName}"])`
When I click on element located by `By.xpath(//span[text()='Archive'])`
Then number of elements found by `By.xpath(//p[text()="This card is archived."])` is equal to `1`
When I click on element located by `By.xpath(//a[@aria-label="Close dialog"])`
Then number of elements found by `By.xpath(//span[text()="${cardName}"])` is equal to `0`

Scenario: Find the archived card in the Archive
When I click on element located by `By.xpath(//*[@aria-label="Show menu"]//*[contains(@data-testid,"MenuHorizontal")])`
Then number of elements found by `By.xpath(//span[text()="${cardName}"])` is equal to `1`

Scenario: Send the archived card to the board via Header Menu DDL
When I click on element located by `By.caseInsensitiveText(Send to board)`
Then number of elements found by `By.xpath(//span[text()="${cardName}"])` is equal to `1`
When I click on element located by `By.xpath(//a[@title="Close the board menu."])`

Scenario: Send the archived card to the board via Card pop-up
When I click on element located by `By.xpath(//span[text()="${cardName}"])`
When I click on element located by `By.xpath(//span[text()='Archive'])`
Then number of elements found by `By.xpath(//p[text()="This card is archived."])` is equal to `1`
When I click on element located by `By.xpath(//span[text()='Send to board'])`
Then number of elements found by `By.xpath(//p[text()="This card is archived."])` is equal to `0`

Scenario: Delete the archived card in Card pop-up
When I click on element located by `By.xpath(//span[text()='Archive'])`
When I click on element located by `By.xpath(//a[@title="Delete"])`
When I click on element located by `By.xpath(//input[@value="Delete"])`
Then number of elements found by `By.xpath(//span[text()="${cardName}"])` is equal to `0`

Scenario: Delete the archived card in the Archive
When I click on element located by `By.xpath(//span[text()="${secondCardName}"])`
When I click on element located by `By.xpath(//span[text()='Archive'])`
When I click on element located by `By.xpath(//a[@aria-label="Close dialog"])`
When I click on element located by `By.xpath(//*[@aria-label="Show menu"]//*[contains(@data-testid,"MenuHorizontal")])`
When I click on element located by `By.xpath(//a[@class="js-delete"])`
When I click on element located by `By.xpath(//input[@value="Delete"])`
Then number of elements found by `By.xpath(//span[text()="${secondCardName}"])` is equal to `0`

Scenario: Delete board via API
When I delete the board with ${boardId} via API
