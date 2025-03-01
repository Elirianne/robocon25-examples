# Flattening Top-Level Keywords with Robot Framework API

This repository contains simple showcases of flattening the top level keywords of a test case using the Robot Framework API's `Listener` and the `Result Visitor`, as well as a third-party library for parsing XML.

> [!NOTE]
> Examples are simplified for the purpose of the presentation at the RoboCon 2025 conference
> and should not be considered as final or recommended solutions.

## 1. Project structure
```
|—— Resources
|   |—— Common.resource               -- Resource file with common keywords
|   |—— RobotFrameworkWeb.resource    -- Resource file with specific keywords for web app
|—— Tests
|   |—— Search.robot                  -- Example of a test case for the search functionality
|—— Tools
|   |—— 01_Listener.py                -- Resource containing a simple custom listener
|   |—— 02_ResultVisitor.py           -- Script for modifying output.xml with a simple Result Visitor
|   |—— 03_XMLParser.py               -- Script for modifying output.xml with a third-party library
```

## 2. Installation

You can install the required dependencies into your Python by running the following commands from the repository root folder:

```bash
python -m venv .venv

.\.venv\Scripts\activate

pip install -r requirements.txt

rfbrowser init
```

After the inicialization of `rfbrowser` is done, you should be set to run the examples.

## 3. Running the examples

You can run the flattening examples in any order by running the following commands from the repository root folder.

> [!NOTE]
> Examples may contain additional commands with rebot for the purpose of generating
> a new `log.html` where the results of the flattening can be easily observed.

### 3.1 Listener

```bash
robot -d Results --listener .\Tools\01_Listener.py Tests

rebot -d Results -o flattened_output.xml --flattenkeywords tag:robot:flatten Results\output.xml
```

We will end up with a new `log.html` file where the keywords from the second level and further are hidden.

### 3.2 Result Visitor

```bash
robot -d Results Tests

python .\Tools\02_ResultVisitor.py

rebot -d Results Results\flattened_output.xml
```

We will end up with a new `log.html` file where the keywords from the second level and further are hidden.

### 3.3 XML Parser

```bash
robot -d Results Tests

python .\Tools\03_XMLParser.py

rebot -d Results Results\flattened_output.xml
```

We will end up with a new `log.html` file where the keywords from the second level and further are hidden.

### 4. Contributions

You are welcomed to try your own experiments with the Robot Framework API in this project :-) If you have any suggestions for improvements or other ideas on how to dynamically flatten the top level keywords, feel free to share them via discussions, issues and so on.