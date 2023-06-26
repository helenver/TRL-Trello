Scenario: Get token
When I log in with ${email} and ${password}
Given I am on page with URL `https://trello.com/1/OAuthAuthorizeToken?expiration=never&name=MyPersonalToken&scope=read,write,account&response_type=token&key=${key}`
When I save number of elements located `By.xpath(//*[text()='local_rate_limited'])` to SCENARIO variable `local_rate_limited`
When the condition `#{eval(${local_rate_limited} == 1)}` is true I do
|step               |
|When I refresh page|
When I wait until state of element located by `By.xpath(//input[@id="approveButton"])` is enabled
When I click on element located by `By.ButtonName(Allow)`
When I wait until element located by `By.xpath(//div[@class="content"]//pre)` appears
When I change context to element located by `By.xpath(//div[@class="content"]//pre)` in scope of current context
When I save `innerText` attribute value of element located `By.xpath(//div[@class="content"]//pre)` to next_batches variable `token`
