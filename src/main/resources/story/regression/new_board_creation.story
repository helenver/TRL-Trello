Scenario: User can log in
When I log in with ${email} and ${password}

Scenario: Create a new board with workspace visibility
Given I initialize story variable `NewBoardName` with value `#{generate(Animal.name)}`
When I click on element located by `By.xpath(//*[@aria-label='Create board or Workspace'])`
When I click on element located by `By.caseSensitiveText(Create board)`
When I enter `${NewBoardName}` in field located by `By.xpath(//*/input[@type='text'])`
When I click on element located by `By.xpath(//button[text()='Create'])`
When I wait until state of element located by `By.xpath(//*[@aria-label='Board name'])` is visible
When I scroll element located `By.xpath(//*[@aria-label='Board name'])` into view
Then text `${NewBoardName}` exists

Scenario: Add lists to the created board
Given I initialize story variable `List1` with value `#{generate(Hobby.activity)}`
Given I initialize story variable `List2` with value `#{generate(Hobby.activity)}`
When I click on element located by `By.xpath(<List>)`
When I enter `<ListName>` in field located by `By.xpath(<InputField>)`
When I click on element located by `By.xpath(<AddListButton>)`
Examples:
|List                             |ListName|InputField                               |AddListButton             |
|//input[@class='list-name-input']|${List1}|//input[@placeholder='Enter list title…']|//input[@value='Add list']|
|//input[@class='list-name-input']|${List2}|//input[@placeholder='Enter list title…']|//input[@value='Add list']|

Scenario: Add cards to the lists
When I click on element located by `By.xpath(<Card>)`
When I enter `#{generate(Hobby.activity)}` in field located by `By.xpath(<InputField>)`
When I click on element located by `By.xpath(<AddCardButton>)`
Examples:
|Card                            |InputField              |AddCardButton             |
|(//span[text()='Add a card'])[1]|//textarea[@placeholder]|//input[@value='Add card']|
|(//span[text()='Add a card'])[2]|//textarea[@placeholder]|//input[@value='Add card']|

Scenario: Visual display of elements in the Customize views DDL
When I click on element located by `By.xpath(//button[@aria-label='Customize views'])`
When I change context to element located `By.xpath(//h2[@title='Upgrade for Views']//ancestor-or-self::section)`
When I COMPARE_AGAINST baseline with name `CustomizeViewPopUp`
When I reset context

Scenario: Visual display of elements in the Automation DDL
When I click on element located by `By.xpath(//span[text()='Automation'])`
When I change context to element located `By.xpath(//h2[@title='Automation']//ancestor-or-self::section)`
When I COMPARE_AGAINST baseline with name `AutomationPopUp`
When I reset context

Scenario: The created board is present on the main page
When I click on element located by `By.xpath(//a[@aria-label="Back to home"])`
Then field located `By.xpath((//a[contains(@href,'${NewBoardName}')])[2])` exists

Scenario: Delete the created board
When I click on element located by `By.xpath((//a[contains(@href,'${NewBoardName}')])[2])`
When I wait until state of element located by `By.xpath(//span[@data-testid='OverflowMenuHorizontalIcon'])` is visible
When I click on element located by `By.xpath(//span[@data-testid='OverflowMenuHorizontalIcon'])`
When I wait until state of element located by `By.xpath(//a[contains(@class,'open-more')])` is visible
When I click on element located by `By.xpath(//a[contains(@class,'open-more')])`
When I click on element located by `By.xpath(//a[contains(@class,'close-board')])`
When I click on element located by `By.buttonName(Close)`
When I scroll element located by `By.xpath(//h1[@data-testid="close-board-big-message"])` into view
When I click on element located by `By.xpath(//*[contains(@data-testid,"delete-board")])`
When I click on element located by `By.caseSensitiveText(Delete)`
When I wait until element located by `By.xpath(//span[text()='Board deleted.'])` appears
When I wait until element located by `By.xpath(//a[contains(@href,'${NewBoardName}')])` disappears
