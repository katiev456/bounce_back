extends Label

func _ready():
	text = "Deaths: " + str(GameManager.death_count)
	GameManager.deaths_changed.connect(update_deaths)

func update_deaths(new_count):
	text = "Deaths: " + str(new_count)
