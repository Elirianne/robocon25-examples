from lxml import etree

tree = etree.parse('output.xml')
root = tree.getroot()

for keyword in root.findall('.//test/kw'):

    for child in keyword:

        if child.tag not in ['doc','arg','status','msg']:
            keyword.remove(child)

tree.write('flattened_output.xml')
