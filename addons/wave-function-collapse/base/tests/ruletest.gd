class_name RuleTest


static func test_init():
    var rule = WFCRuleset.new()
    rule.initialize_rule_data(3, 3)
    print(rule)