extends Reference

const AUTO_QUIT: String = "WAT/AutoQuit"

static func enable_autoquit() -> void:
	ProjectSettings.set_setting(AUTO_QUIT, true)
	
static func disable_autoquit() -> void:
	ProjectSettings.set_setting(AUTO_QUIT, false)
	
static func autoquit_is_enabled() -> bool:
	return ProjectSettings.get_setting(AUTO_QUIT)

static func set_run_path(path: String) -> void:
	ProjectSettings.set("WAT/ActiveRunPath", path)
	
static func test_directory() -> String:
	return ProjectSettings.get_setting("WAT/Test_Directory")

static func clear(primary: bool = false):
	if ProjectSettings.has_setting("WAT/TestDouble"):
		ProjectSettings.get_setting("WAT/TestDouble").clear()
		if primary:
			ProjectSettings.get_setting("WAT/TestDouble").free()

static func create():
	if not ProjectSettings.has_setting("WAT/TestDouble"):
		var registry = load("res://addons/WAT/double/registry.gd")
		ProjectSettings.set_setting("WAT/TestDouble", registry.new())