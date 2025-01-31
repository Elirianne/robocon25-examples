*** Settings ***
Documentation  Resource with keywords for interaction with Robot Framework Website.

Resource  Common.resource

*** Keywords ***
Open Robot Framework Web Guides
    [Documentation]  Opens the welcome page for Robot Framework Guides.
    Setup Browser
    Go To  https://docs.robotframework.org/docs

Search
    [Documentation]  Searches for a given _topic_ via the search fied at top right corner.\n\n
    ...  Arguments:
    ...  - ``topic``: topic or text to be searched
    [Arguments]  ${topic}
    Click  button[aria-label="Search"]
    Fill Text  id=docsearch-input  ${topic}
    Wait For Elements State  .DocSearch-Hits [role=option] >> text=${topic} >> nth=0  message=No results found
    Click  .DocSearch-Hits [role=option] >> text=${topic} >> nth=0
