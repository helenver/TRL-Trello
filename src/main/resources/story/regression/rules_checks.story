GivenStories:/story/precondition/create_card_with_details.story

Scenario: Log in as a board creator
When I log in with ${email} and ${password}

Scenario: Add lists with filled cards to the created board
When I click on element located by `By.xpath(//div[@title='${boardName}'])`

Scenario: Select a trigger in "Card Move" section
When I refresh page
When I wait until state of element located by `By.xpath(//span[text()='Automation'])` is visible
When I click on element located by `By.xpath(//span[text()='Automation'])`
When I click on element located by `By.xpath(//*[contains(text(),'Create rules')])`
When I switch to frame located `By.xpath(//iframe[@class="butler-iframe"])`
When I wait until state of element located by `By.xpath(//*[normalize-space(text())="Create rule"])` is visible
When I click on element located by `By.xpath(//*[normalize-space(text())="Create rule"])`
When I click on element located by `By.caseSensitiveText(Add Trigger)`
When I click on element located by `By.xpath((//*[contains(text(),"when a card")]//i[@class="plus icon"])[1])`
Then number of elements found by `By.xpath(//div[contains(text(),"when a card is added to the board")])` is equal to `1`

Scenario: Select an action in the 'Move' section
When I click on element located by `By.xpath(//*[text()="the top of the list"]//preceding::*[@placeholder='List name'][1])`
When I click on element located by `By.xpath(//div[text()='${listName}'])`
When I click on element located by `By.xpath(//div[text()="move"]//preceding::i[@class="plus icon"][1])`
Then number of elements found by `By.xpath(//*[text()="Actions"]//following::*[contains(text(),"move the card to the top")])` is equal to `1`

Scenario: Select an action in "Add/Remove" section
When I click on element located by `By.caseSensitiveText(Add/Remove)`
When I click on element located by `By.xpath((//div[text()="blue"])[2]/../preceding-sibling::div[contains(@class,"blue icon")]//i)`
Then number of elements found by `By.xpath(//*[text()="Actions"]//following::*[contains(text(),"add the blue label")])` is equal to `1`

Scenario: Select an action in "Dates" section
When I click on element located by `By.caseSensitiveText(Dates)`
When I click on element located by `By.xpath((//span[text()="now"])[1])`
When I click on element located by `By.xpath((//div[text()="the next"])[1]/../preceding-sibling::div//i[@class="plus icon"])`
When I click on element located by `By.xpath((//div[contains(text(),"set")]/div[contains(@class,"blue icon")])[1])`
Then number of elements found by `By.xpath(//div[contains(text(),"set due date the next monday")])` is equal to `1`

Scenario: Select an action in "Content" section
Given I initialize story variable `newCardTitle` with value `#{generate(Cat.breed)}`
When I click on element located by `By.caseSensitiveText(Content)`
When I enter `${newCardTitle}` in field located by `By.xpath(//input[@placeholder="New card title"])`
When I click on element located by `By.xpath(//*[contains(text(),'rename the')]/div[contains(@class,"blue icon")])`
Then number of elements found by `By.xpath(//textarea[text()="${newCardTitle}"])` is equal to `1`

Scenario: Delete an action 'rename the card to'
When I click on element located by `By.xpath(//textarea[text()="${newCardTitle}"]//following::i[@class="trash icon"][1])`
Then number of elements found by `By.xpath(//textarea[text()="${newCardTitle}"])` is equal to `0`

Scenario: Save the created rule
When I click on element located by `By.caseSensitiveText(Save)`
Then number of elements found by `By.xpath(//div[contains(text(),"when a card is added to the board")])` is equal to `1`

Scenario: Verification of the created rule
Given I initialize story variable `cardWithDate` with value `#{generate(Hobby.activity)}`
When I click on element located by `By.xpath(//a[@href="#close"])`
When I switch back to the page
When I click on element located by `By.xpath(//*[text()="${listName}"]/../following-sibling::div[2]//*[text()="Add a card"])`
When I enter `${cardWithDate}` in field located by `By.xpath(//textarea[@placeholder])`
When I click on element located by `By.xpath(//input[@value='Add card'])`
When I wait until state of element located by `By.xpath(//button[@data-color="blue"])` is visible
Then number of elements found by `By.xpath(//button[@data-color="blue"])` is equal to `1`
When I click on element located by `By.xpath(//span[text()="${cardWithDate}"])`
When I wait until state of element located by `By.xpath(//h3[text()="Due date"])` is visible
Then number of elements found by `By.xpath(//h3[text()="Due date"])` is equal to `1`
When I click on element located by `By.xpath(//a[@aria-label="Close dialog"])`

Scenario: Edit the created rule
When I click on element located by `By.xpath(//span[text()='Automation'])`
When I click on element located by `By.xpath(//*[contains(text(),'Create rules')])`
When I switch to frame located `By.xpath(//iframe[@class="butler-iframe"])`
When I wait until state of element located by `By.xpath(//div[@class="command-btns"])` is visible
When I click on element located by `By.xpath(//div[@alt="Edit"])`
When I click on element located by `By.xpath(//div[text()="set due date the next monday"]//following::i[@class="trash icon"])`
Then number of elements found by `By.xpath(//div[text()="set due date the next monday"])` is equal to `0`
When I click on element located by `By.xpath((//div[contains(text(),"move the card")]//following::i[@class="trash icon"])[2])`
Then number of elements found by `By.xpath(//div[text()="move the card to the top of list "])` is equal to `0`
When I click on element located by `By.caseSensitiveText(Dates)`
When I click on element located by `By.xpath(//div[contains(text(),"mark the due date as")]//i[@class="plus icon"])`
When I click on element located by `By.caseSensitiveText(Save)`
Then number of elements found by `By.xpath(//div[contains(text(),"when a card is added to the board")])` is equal to `1`

Scenario: Rule 'add blue label' verification
Given I initialize story variable `cardWithLabel` with value `#{generate(Hobby.activity)}`
When I click on element located by `By.xpath(//a[@href="#close"])`
When I switch back to the page
When I click on element located by `By.xpath(//*[text()="${listName}"]/../following-sibling::div[2]//*[text()="Add a card"])`
When I enter `${cardWithLabel}` in field located by `By.xpath(//textarea[@placeholder])`
When I click on element located by `By.xpath(//input[@value='Add card'])`
When I wait until state of element located by `By.xpath(//button[@data-color="blue"])` is visible
Then number of elements found by `By.xpath(//button[@data-color="blue"])` is equal to `1`

Scenario: Rule 'due date as complete' verification
When I click on element located by `By.xpath(//span[text()="${cardWithLabel}"])`
When I click on element located by `By.caseSensitiveText(Show details)`
When I wait until state of element located by `By.xpath(//div[contains(text(),"marked the due date complete")])` is visible
Then number of elements found by `By.xpath(//div[contains(text(),"marked the due date complete")])` is equal to `1`

Scenario: Verification of the deleted action in the created rule
Then number of elements found by `By.xpath(//div[contains(text(),"when a card is added to the board")])` is equal to `0`
When I click on element located by `By.xpath(//a[@aria-label="Close dialog"])`

Scenario: Remove the created rule
When I click on element located by `By.xpath(//span[text()='Automation'])`
When I click on element located by `By.xpath(//*[contains(text(),'Create rules')])`
When I switch to frame located `By.xpath(//iframe[@class="butler-iframe"])`
When I wait until state of element located by `By.xpath(//div[@class="command-btns"])` is visible
When I click on element located by `By.xpath(//div[@alt="Remove"])`
When I click on element located by `By.caseSensitiveText(Remove)`
When I wait until state of element located by `By.xpath(//div[contains(@class,"vertical segment empty")])` is visible
Then number of elements found by `By.xpath(//div[contains(@class,"vertical segment empty")])` is equal to `1`
When I click on element located by `By.xpath(//a[@href="#close"])`

Scenario: Deleted rule is not applyed
When I switch back to the page
Given I initialize story variable `cardWithoutActions` with value `#{generate(Hobby.activity)}`
When I click on element located by `By.xpath(//*[text()="${listName}"]/../following-sibling::div[2]//*[text()="Add a card"])`
When I enter `${cardWithoutActions}` in field located by `By.xpath(//textarea[@placeholder])`
When I click on element located by `By.xpath(//input[@value='Add card'])`
When I click on element located by `By.xpath(//span[text()="${cardWithoutActions}"])`
Then number of elements found by `By.xpath(//div[contains(text(),"marked the due date complete")])` is equal to `0`
Then number of elements found by `By.xpath(//div[contains(@class,"card-detail-window")]//button[@data-color])` is equal to `0`

Scenario: Delete board via API
When I delete the board with ${boardId} via API
