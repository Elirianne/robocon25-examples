*** Settings ***
Documentation  Resource with library imports, common keywords and global variables.

Library  Browser  enable_playwright_debug=False

*** Keywords ***
Setup Browser
    [Documentation]  Starts a new browser instance with context and page.
    VAR  @{chromium_arguments}  --start-maximized
    New Browser  headless=False  args=${chromium_arguments}
    New Context  viewport=None  locale=en-GB
    New Page
