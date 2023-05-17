Scenario: User can log in
When I log in with ${email} and ${password}

Scenario: User can log out
When I click on element located by `By.xpath(//*[@aria-label='Open member menu']/div)`
When I wait until element located by `By.xpath(//*[@data-testid='account-menu'])` appears
When I click on element located by `By.caseSensitiveText(Log out)`
When I wait until element located by `By.id(logout-submit)` appears
When I click on element located by `By.id(logout-submit)`
When I wait until state of element located by `By.xpath(//header[@data-testid='bignav']//a[@href='/login'])` is visible

Scenario: User can not log in with an invalid password
When I try to log in with ${email} and #{generate(Internet.password)}
When I click on element located by `By.xpath(//span[text()='Log in'])`
Then text `Incorrect email address and / or password` exists

Scenario: User can not log in with non-existent credentials(e-mail and password)
When I try to log in with #{generate(Internet.emailAddress)} and #{generate(Internet.password)}
When I wait until state of element located by `By.id(login)` is ENABLED
When I click on element located by `By.id(login)`
Then text `There isn't an account for this username ` exists

Scenario: User can not log in with an invalid email
When I try to log in with #{generate(Internet.emailAddress)} and ${password}
When I wait until state of element located by `By.id(login)` is ENABLED
When I click on element located by `By.id(login)`
Then text `Incorrect email address and / or password` exists
