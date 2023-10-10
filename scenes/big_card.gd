extends Sprite

var buttons_up := []
var buttons_down := []
var labels := []
var button_random: TextureButton
var button_sequence: TextureButton
var button_repeat: TextureButton  # Adicione a variável para o botão de repetição
var sequence_value := 0
var repeat_value := 0  # Variável para rastrear o valor de repetição

func _ready():
	for i in range(1, 7):
		buttons_up.append(get_node("button_up_" + str(i)))
		buttons_down.append(get_node("button_down_" + str(i)))
		labels.append(get_node("number_" + str(i)))

	button_random = $button_random
	button_sequence = $button_sequence
	button_repeat = $button_repeat  # Atribua o nó "button_repeat" à variável

	for i in range(6):
		buttons_up[i].connect("pressed", self, "_on_button_up_pressed", [i])
		buttons_down[i].connect("pressed", self, "_on_button_down_pressed", [i])

	button_random.connect("pressed", self, "_on_button_random_pressed")
	button_sequence.connect("pressed", self, "_on_button_sequence_pressed")
	button_repeat.connect("pressed", self, "_on_button_repeat_pressed")  # Conecte o botão de repetição

func _on_button_up_pressed(button_index):
	var label = labels[button_index]
	var current_value = int(label.text)
	
	current_value = (current_value + 1) % 10
	
	label.text = str(current_value)

func _on_button_down_pressed(button_index):
	var label = labels[button_index]
	var current_value = int(label.text)
	
	if current_value <= 0:
		current_value = 9
	else:
		current_value = (current_value - 1) % 10
	
	label.text = str(current_value)

func _on_button_random_pressed():
	for i in range(6):
		var random_value = randi() % 10
		labels[i].text = str(random_value)

func _on_button_sequence_pressed():
	for i in range(6):
		var new_value = (sequence_value + i) % 10
		labels[i].text = str(new_value)
	
	sequence_value = (sequence_value + 1) % 6

func _on_button_repeat_pressed():
	for i in range(6):
		labels[i].text = str(repeat_value)
	
	repeat_value = (repeat_value + 1) % 10 
