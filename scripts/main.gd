extends Node

# Variável para armazenar o valor atual da label
var valor_atual: int = 1  # Inicializado com 1
# Referências para os botões e a label
var btn_a: TextureButton
var btn_b: TextureButton
var label: Label

func _ready():
	# Obtém as referências para os nós
	btn_a = $btn_a
	btn_b = $btn_b
	label = $Label

	# Conecta os sinais dos botões aos métodos correspondentes
	btn_a.connect("pressed", self, "_on_btn_a_pressed")
	btn_b.connect("pressed", self, "_on_btn_b_pressed")

	# Define o valor inicial da label
	label.text = str(valor_atual)

func _on_btn_a_pressed():
	# Aumenta o valor, mas limita a 5 e volta a 1 se ultrapassar
	valor_atual = wrap_value(valor_atual + 1, 1, 5)
	label.text = str(valor_atual)

func _on_btn_b_pressed():
	# Diminui o valor, mas limita a 5 e volta a 5 se for menor que 1
	valor_atual = wrap_value(valor_atual - 1, 1, 5)
	label.text = str(valor_atual)

func wrap_value(value: int, min_value: int, max_value: int) -> int:
	# Esta função limita o valor dentro de um intervalo
	if value < min_value:
		return max_value
	elif value > max_value:
		return min_value
	else:
		return value
