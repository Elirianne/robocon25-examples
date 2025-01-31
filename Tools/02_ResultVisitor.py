from robot.result.model import Keyword, TestCase
from robot.api import ExecutionResult, ResultVisitor

class MyVisitor(ResultVisitor):

    def end_keyword(self, data: Keyword):

        if isinstance(data.parent, TestCase):
            data.body = []

# Script actions:
result = ExecutionResult('output.xml')
result.visit(MyVisitor())
result.save('flattened_output.xml')


