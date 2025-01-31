from robot import running, result
from robot.running.model import TestCase

ROBOT_LISTENER_API_VERSION = 3

def end_keyword(
        data: running.model.Keyword,
        result: result.model.Keyword
    ):

    if isinstance(data.parent, TestCase):
        result.tags.add("robot:flatten")
