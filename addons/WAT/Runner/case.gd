extends Reference

var total: int = 0
var passed: int = 0
var title: String
var methods: Array = []
var crashed: bool = false
var crashdata: Reference
var success: bool = false

func _init(test) -> void:
	self.title = test.title()
	test.expect.connect("OUTPUT", self, "_add_expectation")
	
func add_method(method: String) -> void:
	methods.append({title = method, expectations = [], total = 0, passed = 0, success = false})
	
func _add_expectation(expectation) -> void:
	var method: Dictionary = methods.back()
	method.expectations.append(expectation)
	
func crash(expectation: Reference) -> void:
	crashdata = expectation
	
func calculate() -> void:
	for method in methods:
		for expectation in method.expectations:
			method.passed += int(expectation.success)
		method.total = method.expectations.size()
		method.success = method.total > 0 and method.total == method.passed
		passed += int(method.success)
	total = methods.size()
	success = total > 0 and total == passed