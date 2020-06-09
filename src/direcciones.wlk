object norte {
	method moverAl(position){return position.up(1)}
	method opuesto(position){return position.down(1)}
}

object sur {
	method moverAl(position){return position.down(1)}
	method opuesto(position){return position.up(1)}
}

object este {
	method moverAl(position){return position.right(1)}
	method opuesto(position){return position.left(1)}
}

object oeste {
	method moverAl(position){return position.left(1)}
	method opuesto(position){return position.right(1)}
}