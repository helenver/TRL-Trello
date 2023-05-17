Scenario: Create board via API
Given I initialize story variable `boardName` with value `#{generate(Animal.name)}`
Given request body: { "name": "${boardName}"}
When I execute HTTP POST request for resource with relative URL  `/1/boards/?name=${boardName}&key=${key}&token=${token}`
When I save JSON element value from `${response}` by JSON path `$.id` to story variable `boardId`
Then response code is equal to `200`
When I set request headers:
|name        |value           |
|Content-Type|application/json|
When I execute HTTP GET request for resource with relative URL `/1/boards/${boardId}?key=${key}&token=${token}`
Then response code is equal to `200`
Then JSON element from `${response}` by JSON path `$.name` is equal to  `${boardName}`
