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

Scenario: Create a list via API
Given I initialize story variable `listName` with value `#{generate(Ancient.titan)}`
Given request body: { "name": "${listName}"}
When I execute HTTP POST request for resource with relative URL `/1/boards/${boardId}/lists?name=${listName}&key=${key}&token=${token}`
When I save JSON element value from `${response}` by JSON path `$.id` to story variable `listId`
Then response code is equal to `200`

Scenario: Add a label via API
Given I initialize story variable `labelName` with value `#{generate(Construction.trades)}`
Given request body: {"id"="${boardId}", "color"="green", "name" = "${labelName}" }
When I execute HTTP POST request for resource with relative URL `/1/boards/${boardId}/labels?name=${labelName}&color=green&key=${key}&token=${token}`
Then response code is equal to `200`

Scenario: Add a card with defined date via API
Given I initialize story variable `cardName` with value `#{generate(Dessert.flavor)}`
Given I initialize story variable `dueDate` with value `#{generateDate(P1W, yyyy-MM-dd'T'HH:mm:ssZ)}`
When I set request headers:
|name  |value           |
|Accept|application/json|
Given request body: {"name"= "${cardName}", "idList"= "${listId}", "due"= "${dueDate}","idMembers"="64469efd81090195a60e60a9"}
When I execute HTTP POST request for resource with relative URL `/1/cards?idList=${listId}&name=${cardName}&due=${dueDate}&idMembers=64469efd81090195a60e60a9&key=${key}&token=${token}`
When I save JSON element value from `${response}` by JSON path `$.id` to story variable `cardId`
Then response code is equal to `200`

Scenario: Add a card without date via API
Given I initialize story variable `secondCardName` with value `#{generate(Book.title)}`
When I set request headers:
|name  |value           |
|Accept|application/json|
Given request body: {"name"= "${secondCardName}", "idList"= "${listId}"}
When I execute HTTP POST request for resource with relative URL `/1/cards?idList=${listId}&name=${secondCardName}&key=${key}&token=${token}`
When I save JSON element value from `${response}` by JSON path `$.id` to story variable `cardId2`
Then response code is equal to `200`
