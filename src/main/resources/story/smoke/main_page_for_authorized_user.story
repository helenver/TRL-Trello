Scenario: Verify that user can log in
When I log in

Scenario: Verify presence of the elements in the header menu
When I click on element located by `By.xpath(//button[@title=<HeaderElement>])`
Then text `<text>` exists
Examples:
|HeaderElement|text                                                    |
|'Workspaces' |Your Workspace                                          |
|'Recent'     |team board                                              |
|'Starred'    |Star important boards to access them quickly and easily.|
|'Templates'  |Top templates                                           |

Scenario: Verify elements in the left menu
When I wait until state of element located by `By.xpath(//span[text()='Home'])` is visible
When I change context to element located by `By.xpath(//*[@class='home-left-sidebar-container'])`
When I COMPARE_AGAINST baseline with name `left_menu`
When I reset context

Scenario: Verify that user can open their notifications
When I click on element located by `By.xpath(//*[@data-testid='header-notifications-button'])`
Then text `Notifications` exists

Scenario: Verify that user can open "information" tab
When I click on element located by `By.xpath(//*[@data-testId='HelpIcon'])`
When I wait until element located by `By.xpath(//button[text()='Get a new tip.'])` appears

Scenario: Verify the display of elements in the "information" tab
When I click on element located by `By.xpath(//*[@data-testId='HelpIcon'])`
When I COMPARE_AGAINST baseline with name `information` ignoring:
|element                                  |
|By.xpath(//a[@rel='noopener noreferrer'])|

Scenario: Verify that user can open "theme" tab
When I click on element located by `By.xpath(//*[@data-testId='ThemeIcon'])`
When I scroll element located `By.xpath(//div[@class='atlaskit-portal']//section)` into view
When I COMPARE_AGAINST baseline with name `theme`

Scenario: Verify that user can open Home page 
When I click on element located by `By.xpath(//span[text()='Home'])`
When I wait until element located by `By.xpath(//*[text()='Stay on track and up to date'])` appears

Scenario: Verify that user can open Templates page
When I click on element located by `By.xpath(//nav[@class='home-left-sidebar-container']//*[text()='Templates'])`
When I wait until element located by `By.xpath(//*[text()='Featured categories'])` appears
 
Scenario: Verify that user can choose a template in the featured categories section
When I click on element located by `By.xpath(//*[@data-testid='templates-container']//*[@href='/templates/business'])`
When I wait until element located by `By.xpath(//*[text()='Business templates'])` appears

Scenario: Verify that user can open their "account" tab
When I click on element located by `By.xpath(//*[@aria-label='Open member menu']/div)`
When I wait until element located by `By.xpath(//*[@data-testid='account-menu'])` appears
Then text `${email}` exists

Scenario: Verify that user can log out 
When I click on element located by `By.xpath(//span[text()='Log out'])`
When I wait until element located by `By.id(logout-submit)` appears
When I click on element located by `By.id(logout-submit)`
When I wait until state of element located by `By.xpath(//header[@data-testid='bignav']//a[@href='/login'])` is visible

Scenario: Verify that user can not log in with non-existent credentials
When I click on element located by `By.xpath(//header[@data-testid='bignav']//a[@href='/login'])`
When I scroll element located `By.id(user)` into view
When I wait until state of element located by `By.id(user)` is visible
When I enter `#{generate(Internet.emailAddress)}` in field located `By.id(user)`
When I click on element located by `By.id(login)`
When I wait until state of element located by `By.xpath(//input[@name='password'])` is visible
When I enter `#{generate(Internet.password)}` in field located `By.xpath(//input[@name='password'])`
When I wait until state of element located by `By.id(login)` is ENABLED
When I click on element located by `By.id(login)`
Then text `There isn't an account for this username` exists
