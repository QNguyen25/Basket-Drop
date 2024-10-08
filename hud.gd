extends CanvasLayer

var score
signal start_game

func _ready():
	$ScoreLabel.text
	
	
func update_score(Score):
	$ScoreLabel.text = "Score: "+ str(Score)

