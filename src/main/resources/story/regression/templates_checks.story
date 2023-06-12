Scenario: Log in
When I log in with ${email} and ${password}

Scenario: Verify the templates list in the Top templates DDL
When I click on element located by `By.xpath(//button[@title="Templates"])`
When I wait until state of element located by `By.xpath(//*[contains(@data-testid,"template-picker")])` is visible
When I change context to element located by `By.xpath(//*[contains(@data-testid,"template-picker")])`
When I ${baselineAction} baseline with name `TemplatesDDL` ignoring:
|ELEMENT                                               |
|By.xpath(//*[text()='Explore templates']//parent::div)|
When I reset context

Scenario: Verify templates sections on the Templates page
When I click on element located by `By.caseSensitiveText(Explore templates)`
When I wait until state of element located by `By.xpath(//h1[text()="Featured categories"])` is visible
When I change context to element located by `By.xpath(//*[@class="content-all-boards"])`
When I ${baselineAction} baseline with name `AllTemplates` ignoring:
|ELEMENT                                                                          | 
|By.xpath(//*[contains(@title,"Views")]), By.xpath(//*[contains(@title,"Copies")])|
using screenshot configuration:
|scrollableElement             |scrollTimeout|webHeaderToCut|
|By.xpath(//div[@id="content"])|PT2S         |39,5          |
When I reset context

Scenario: Verify the template pages from categories
When I click on element located by `By.xpath(<CategoryName>)`
When I change context to element located by `By.xpath(//*[@data-testid="templates-container"])`
When I ${baselineAction} baseline with name `<TemplateCategory>` ignoring:
|ELEMENT                                                                          | 
|By.xpath(//*[contains(@title,"Views")]), By.xpath(//*[contains(@title,"Copies")])|
using screenshot configuration:
|scrollableElement             |scrollTimeout|webHeaderToCut|
|By.xpath(//div[@id="content"])|PT2S         |39,5          |
When I reset context
Examples:
|CategoryName                |TemplateCategory     |
|//*[@title="Business"]      |BusinessTemplates    |
|//span[text()="Design"]     |DesignTeplates       |
|//span[text()="Education"]  |EducationTemplates   |
|//span[text()="Engineering"]|EngineeringTemplates |
|//span[text()="Marketing"]  |MarketingTemplates   |

Scenario: Verify the info page of templates
When I wait until state of element located by `By.xpath(//*[text()="<InfoTemplate>"])` is visible
When I click on element located by `By.xpath(//*[text()="<InfoTemplatePageName>"])`
When I wait until state of element located by `By.xpath(//*[contains(@class,"background")])` is visible
When I change context to element located by `By.xpath(//*[@data-testid="templates-container"])`
When I ${baselineAction} baseline with name `<InfoTemplatePage>` ignoring:
|ELEMENT                                                                          | 
|By.xpath(//*[contains(@title,"Views")]), By.xpath(//*[contains(@title,"Copies")])|
using screenshot configuration:
|scrollableElement             |scrollTimeout|webHeaderToCut|
|By.xpath(//div[@id="content"])|PT2S         |39,5          |
When I reset context
Examples:
|InfoTemplate             |InfoTemplatePageName      |InfoTemplatePage                |
|Website Task Planner     |Website Task Planner      |WebsiteTaskPlannerTemplate      |
|Marketing Content Catalog|Marketing Content Catalog |MarketingContentCatalogTemplate |
|Incoming Requests        |Incoming Requests         |IncomingRequestsTemplate        |

Scenario: Create a board from a template
When I click on element located by `By.buttonName(Use template)`
When I click on element located by `By.xpath(//input[@value="Create"])`
When I wait until state of element located by `By.xpath(//*[@id="board"])` is visible
When I click on element located by `By.xpath(//img[@alt="Workspace navigation collapse icon"])`
When I change context to element located by `By.xpath(//*[@id="board"])`
When I ${baselineAction} baseline with name `BoardFromTemplate`
When I reset context

Scenario: Verify the card pop-up 'Labels for prioritization'
When I click on element located by `By.xpath(//span[text()="Labels for prioritization"])`
When I wait until state of element located by `By.xpath(//div[contains(@class,"card-detail-window")])` is visible
When I change context to element located by `By.xpath(//div[contains(@class,"card-detail-window")])`
When I ${baselineAction} baseline with name `CardPopup`
When I reset context
When I click on element located by `By.xpath(//a[@aria-label="Close dialog"])`

Scenario: Delete the created board 
When I click on element located by `By.xpath(//span[@data-testid='OverflowMenuHorizontalIcon'])`
When I wait until state of element located by `By.xpath(//a[contains(@class,'open-more')])` is visible
When I click on element located by `By.xpath(//a[contains(@class,'open-more')])`
When I click on element located by `By.xpath(//a[contains(@class,'close-board')])`
When I click on element located by `By.buttonName(Close)`
When I click on element located by `By.caseSensitiveText(Permanently delete board)`
When I click on element located by `By.caseSensitiveText(Delete)`
