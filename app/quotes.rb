def pick_quote args
	args.state.quote ||= rand(11)
	case args.state.quote
	when 1
		kwassa args
		args.state.quotes_saw[:kwassa] = true
	when 2
		pognon args
		args.state.quotes_saw[:pognon] = true
	when 3
		travail args
		args.state.quotes_saw[:travail] = true
	when 4
		ceder args
		args.state.quotes_saw[:ceder] = true
	when 5
		predire args
		args.state.quotes_saw[:predire] = true
	when 6
		explosion args
		args.state.quotes_saw[:explosion] = true
	when 7
		responsable args
		args.state.quotes_saw[:responsable] = true
	when 8
		poudre args
		args.state.quotes_saw[:poudre] = true
	when 9
		guerre args
		args.state.quotes_saw[:guerre] = true
	when 10
		projet args
		args.state.quotes_saw[:projet] = true
	when 11
		gens args
		args.state.quotes_saw[:gens] = true
	end
end

def kwassa args
	args.outputs.sprites << { x: args.grid.w / 2 + 30,
													y: 400,
													w: 290,
													h: 200,
													path: 'sprites/bulle_explose.png'
													}
	args.outputs.labels << {  x: args.grid.w / 2 + 85,
													y: 525,
													text: "Le kwassa-kwassa pêche peu.",
													size_px: 16,
													alignment_enum: 0,
													r: 0,
													g: 0,
													b: 0
													}
	args.outputs.labels << {  x: args.grid.w / 2 + 85,
													y: 505,
													text: "Il amène du Comorien.",
													size_px: 16,
													alignment_enum: 0,
													r: 0,
													g: 0,
													b: 0
												}
end

def projet args
	args.outputs.sprites << { x: args.grid.w / 2 + 30,
													y: 400,
													w: 290,
													h: 200,
													path: 'sprites/bulle_explose.png'
													}
	args.outputs.labels << {  x: args.grid.w / 2 + 100,
													y: 525,
													text: "Parce que c'est",
													size_px: 16,
													alignment_enum: 0,
													r: 0,
													g: 0,
													b: 0
													}
	args.outputs.labels << {  x: args.grid.w / 2 + 100,
													y: 505,
													text: "notre projeeeeeeeeet !",
													size_px: 16,
													alignment_enum: 0,
													r: 0,
													g: 0,
													b: 0
													}
end

def predire args
	args.outputs.sprites << { x: args.grid.w / 2 + 30,
													y: 400,
													w: 290,
													h: 200,
													path: 'sprites/bulle_explose.png'
													}
	args.outputs.labels << {  x: args.grid.w / 2 + 95,
													y: 515,
													text: "Qui aurait pu prédire ?",
													size_px: 16,
													alignment_enum: 0,
													r: 0,
													g: 0,
													b: 0
													}
end

def explosion args
	args.outputs.sprites << { x: args.grid.w / 2 + 30,
													y: 400,
													w: 290,
													h: 200,
													path: 'sprites/bulle_explose.png'
													}
	args.outputs.labels << {  x: args.grid.w / 2 + 110,
													y: 520,
													text: "Macron, Explosion !",
													size_px: 16,
													alignment_enum: 0,
													r: 0,
													g: 0,
													b: 0
													}
end

def pognon args
	args.outputs.sprites << { x: args.grid.w / 2 - 150,
													y: 440,
													w: 300,
													h: 130,
													path: 'sprites/bulle_rect.png'
													}
	args.outputs.labels << {  x: args.grid.w / 2 - 130,
													y: 540,
													text: "On met un pognon de dingue",
													size_px: 16,
													alignment_enum: 0,
													r: 0,
													g: 0,
													b: 0
													}
	args.outputs.labels << {  x: args.grid.w / 2 - 130,
													y: 520,
													text: "dans des minima sociaux,",
													size_px: 16,
													alignment_enum: 0,
													r: 0,
													g: 0,
													b: 0
													}
	args.outputs.labels << {  x: args.grid.w / 2 - 130,
													y: 500,
													text: "et les gens sont quand même pauvres.",
													size_px: 16,
													alignment_enum: 0,
													r: 0,
													g: 0,
													b: 0
													}
end

def responsable args
	args.outputs.sprites << { x: args.grid.w / 2 - 130,
													y: 440,
													w: 260,
													h: 130,
													path: 'sprites/bulle_rect.png'
													}
	args.outputs.labels << {  x: args.grid.w / 2 - 105,
													y: 540,
													text: "S'ils veulent un responsable,",
													size_px: 16,
													alignment_enum: 0,
													r: 0,
													g: 0,
													b: 0
													}
	args.outputs.labels << {  x: args.grid.w / 2 - 105,
													y: 520,
													text: "il est devant vous.",
													size_px: 16,
													alignment_enum: 0,
													r: 0,
													g: 0,
													b: 0
													}
	args.outputs.labels << {  x: args.grid.w / 2 - 105,
													y: 500,
													text: "Qu'ils viennent me chercher !",
													size_px: 16,
													alignment_enum: 0,
													r: 0,
													g: 0,
													b: 0
													}
end

def gens args
	args.outputs.sprites << { x: args.grid.w / 2 - 155,
													y: 440,
													w: 310,
													h: 120,
													path: 'sprites/bulle_rect.png'
													}
	args.outputs.labels << {  x: args.grid.w / 2 - 130,
													y: 540,
													text: "Une gare, c'est un lieu où",
													size_px: 16,
													alignment_enum: 0,
													r: 0,
													g: 0,
													b: 0
													}
	args.outputs.labels << {  x: args.grid.w / 2 - 130,
													y: 520,
													text: "l'on croise les gens qui réussissent ",
													size_px: 16,
													alignment_enum: 0,
													r: 0,
													g: 0,
													b: 0
													}
	args.outputs.labels << {  x: args.grid.w / 2 - 130,
													y: 500,
													text: "et les gens qui ne sont rien.",
													size_px: 16,
													alignment_enum: 0,
													r: 0,
													g: 0,
													b: 0
                            }
end

def travail args
	args.outputs.sprites << { x: args.grid.w / 2 - 240,
													y: 420,
													w: 240,
													h: 140,
													path: 'sprites/bulle_carree.png'
													}
	args.outputs.labels << {  x: args.grid.w / 2 - 190,
													y: 540,
													text: "Du travail ?",
													size_px: 16,
													alignment_enum: 0,
													r: 0,
													g: 0,
													b: 0
													}
	args.outputs.labels << {  x: args.grid.w / 2 - 190,
													y: 520,
													text: "Je traverse la rue,",
													size_px: 16,
													alignment_enum: 0,
													r: 0,
													g: 0,
													b: 0
													}
	args.outputs.labels << {  x: args.grid.w / 2 - 190,
													y: 500,
													text: "je vous en trouve !",
													size_px: 16,
													alignment_enum: 0,
													r: 0,
													g: 0,
													b: 0
													}
end

def guerre args
	args.outputs.sprites << { x: args.grid.w / 2 - 210,
													y: 420,
													w: 150,
													h: 100,
													path: 'sprites/bulle_carree.png'
													}
	args.outputs.labels << {  x: args.grid.w / 2 - 180,
													y: 500,
													text: "Nous sommes",
													size_px: 16,
													alignment_enum: 0,
													r: 0,
													g: 0,
													b: 0
													}
	args.outputs.labels << {  x: args.grid.w / 2 - 180,
													y: 480,
													text: "en guerre !",
													size_px: 16,
													alignment_enum: 0,
													r: 0,
													g: 0,
													b: 0
													}
end

def poudre args
	args.outputs.sprites << { x: args.grid.w / 2 - 240,
													y: 420,
													w: 240,
													h: 100,
													path: 'sprites/bulle_carree.png'
													}
	args.outputs.labels << {  x: args.grid.w / 2 - 190,
													y: 500,
													text: "C'est de la poudre",
													size_px: 16,
													alignment_enum: 0,
													r: 0,
													g: 0,
													b: 0
													}
	args.outputs.labels << {  x: args.grid.w / 2 - 190,
													y: 480,
													text: "de perlimpimpin !",
													size_px: 16,
													alignment_enum: 0,
													r: 0,
													g: 0,
													b: 0
                            }
end

def ceder args
	args.outputs.sprites << { x: args.grid.w / 2 - 240,
													y: 420,
													w: 240,
													h: 150,
													path: 'sprites/bulle_carree.png'
													}
	args.outputs.labels << {  x: args.grid.w / 2 - 200,
													y: 550,
													text: "Je ne céderai rien.",
													size_px: 16,
													alignment_enum: 0,
													r: 0,
													g: 0,
													b: 0
													}
	args.outputs.labels << {  x: args.grid.w / 2 - 200,
													y: 530,
													text: "Ni aux fainéants,",
													size_px: 16,
													alignment_enum: 0,
													r: 0,
													g: 0,
													b: 0
													}
	args.outputs.labels << {  x: args.grid.w / 2 - 200,
													y: 510,
													text: "ni aux cyniques,",
													size_px: 16,
													alignment_enum: 0,
													r: 0,
													g: 0,
													b: 0
													}
	args.outputs.labels << {  x: args.grid.w / 2 - 200,
													y: 490,
													text: "ni aux extrêmes.",
													size_px: 16,
													alignment_enum: 0,
													r: 0,
													g: 0,
													b: 0
													}
end