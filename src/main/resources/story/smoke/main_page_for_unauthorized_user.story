Scenario: Verify the elements in the header for unauthorized user
Given I am on main application page
When I click on element located by `By.xpath(//header[@data-testid='bignav']//<HeaderTabs>)`
Then text `<text>` exists
Examples:
|HeaderTabs                |text                                            |
|button[text()='Features'] |Explore the features that help your team succeed|
|button[text()='Solutions']|Our product in action                           |
|button[text()='Plans']    |Compare plans & pricing                         |
|a[text()='Pricing']       |Explore which option is right for you.          |
|button[text()='Resources']|Learn & connect                                 |

Scenario: Verify that unauthorized user can open home page
When I click on element located by `By.xpath(//header[@data-testid="bignav"]//a[@href='/home'])`
When I wait until element located by `By.xpath(//main[@id='skip-target'])` appears

Scenario:Verify the top section of main page for unauthorized user
When I COMPARE_AGAINST baseline with name `MainPage` ignoring:
|element                                                                            |
|By.xpath(//*[contains(text(),'Keep everything')]//ancestor-or-self::div[@class][2])|
using screenshot configuration:
|webHeaderToCut|
|39,5          |
