; Este es un sistema experto simple

(deftemplate situacion_corbata
	(slot material)
	(slot diseno)
	(slot largo)
	(slot cuello_camisa)
	(slot grosor_cuello)
	(slot grosor)
	(slot ancho))

(deffacts inicio
	(inicio ambiente_vacio))

(defrule material
	(inicio ambiente_vacio)
	=>
	(printout t "Cual es el material de tu corbata?" crlf
		"a) Lana" crlf
		"b) Punto" crlf
		"c) Sintetico" crlf
		"d) Indiferente" crlf
		"(a/b/c/d): ")
	(assert (situacion_corbata (material (read)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;buen material rama de la izquierda
(defrule buen_material
	(situacion_corbata (material a|b))
	=>
	(printout t crlf
	"Estas usando una chaqueta Tweed?"crlf
		"(si/no): ")
	(assert (chaqueta (read))))

(defrule con_chaqueta
	(chaqueta si)
	=>
	(printout t crlf "Four in hand o Kent estarian bien." crlf)
	(printout t crlf "(Digita un caracter cualquiera (y RETURN) para terminar)")
	(read)
	(exit))

(defrule sin_chaqueta
	(chaqueta no)
	=>
	(printout t crlf "Oops. Tal vez deberias considerar cambiar de corbata." crlf)
	(printout t crlf "(Digita un caracter cualquiera (y RETURN) para terminar)")
	(read)
	(exit))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Material indiferente

(defrule formal_manga_corta
	(situacion_corbata (material d))
	=>
	(printout t crlf "Eres acaso cajero en un banco estatal," crlf
		"o contador, o gerente de turno en un restaurante de comida rápida, o" crlf
		"ingeniero de la NASA?" crlf
		"(si/no/indiferente): ")
	(assert (formal_forzado (read))))



(defrule formal_fingido
	(formal_forzado si)
	=>
	(printout t crlf "El nudo Four in Hand es el correcto." crlf
		"Es poco sofisticado - discreto y sin pretenciones; como la camisa." crlf
		"Obviamente la corbata debe ser de poliester" crlf
		"Period" crlf)
	(printout t crlf "(Digita un caracter cualquiera (y RETURN) para terminar)")
	(read)
	(exit))

(defrule intentar_de_nuevo
	(formal_forzado no)
	=>
	(printout t crlf "Consigue una camisa de manga larga y hablaremos despues." crlf)
	(printout t crlf "(Digita un caracter cualquiera (y RETURN) para terminar)")
	(read)
	(exit))


(defrule lo_incomprensible
	(formal_forzado indiferente)
	=>
	(printout t crlf 
		"Y quieres usar corbata?" crlf
		"(si/no): ")
	(assert (caso_raro (read))))

(defrule circus_circus
	(caso_raro si)
	=>
	(printout t crlf "Bien. En ese caso cualquier nudo te conviene. " crlf
		"Solo asegurate de tomarte una foto para la inscripcion" crlf
		"de la World Clown Association. No vaya a ser que te copien el personaje." crlf)
	(printout t crlf "(Digita un caracter cualquiera (y RETURN) para terminar)")
	(read)
	(exit))

(defrule informal
	(caso_raro no)
	=>
	(printout t crlf "Bien pensado. Gracias por la conversación." crlf)
	(printout t crlf "(Digita un caracter cualquiera (y RETURN) para terminar)")
	(read)
	(exit))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Sintetico
(defrule material_sintetico
	(situacion_corbata (material c))
	=>
	(printout t crlf "Cual es el diseno de la corbata?" crlf
		"a) Cualquiera" crlf
		"b) Estampada" crlf
		"c) Lisa" crlf
		"d) Indiferente" crlf
		"(a/b/c/d): ")
	(assert (situacion_corbata (diseno(read)))))
;;;;;cualquiera;;;;;;;;;

(defrule cualquier_cuello
	(situacion_corbata (diseno a))
	=>
	(printout t crlf "Que tipo de cuello tienes?" crlf
					"a) Italiano" crlf
					"b) Inglés" crlf
					"(a/b): ")
	(assert (situacion_corbata(cuello_camisa(read)))))

;;;;;;;;cuello italiano


(defrule italiano_grosor
	(situacion_corbata (diseno a))
	(situacion_corbata(cuello_camisa a))
	=>
	(printout t crlf "Como es el ancho de tu corbata?" crlf
					"a) Ancha" crlf
					"b) Delgada" crlf
					"c) Indiferente"crlf
					"(a/b/c): ")
	(assert (situacion_corbata(ancho(read)))))

(defrule italiana_ancha
	(situacion_corbata (diseno a))
	(situacion_corbata(cuello_camisa a))
	(situacion_corbata(ancho a))
	=>
	(printout t crlf "Debes usar Prince Albert" crlf)
	(printout t crlf "(Digita un caracter cualquiera (y RETURN) para terminar)")
	(read)
	(exit))

(defrule italiana_delgada
	(situacion_corbata (diseno a))
	(situacion_corbata(cuello_camisa a))
	(situacion_corbata(ancho b))
	=>
	(printout t crlf "Debes usar Windsor" crlf)
	(printout t crlf "(Digita un caracter cualquiera (y RETURN) para terminar)")
	(read)
	(exit))

(defrule italiana_indiferente
	(situacion_corbata (diseno a))
	(situacion_corbata(cuello_camisa a))
	(situacion_corbata(ancho c))
	=>
	(printout t crlf "Como es el grosor de tu corbata?" crlf
					"a) Gruesa" crlf
					"b) Delgada" crlf
					"(a/b): ")
	(assert (situacion_corbata(grosor(read)))))

(defrule italiana_indiferente_delgada
	(situacion_corbata (diseno a))
	(situacion_corbata(cuello_camisa a))
	(situacion_corbata(ancho c))
	(situacion_corbata(grosor b))
	=>
	(printout t crlf "Debes usar Prince Albert" crlf)
	(printout t crlf "(Digita un caracter cualquiera (y RETURN) para terminar)")
	(read)
	(exit))

(defrule italiana_indiferente_gruesa
	(situacion_corbata (diseno a))
	(situacion_corbata(cuello_camisa a))
	(situacion_corbata(ancho c))
	(situacion_corbata(grosor a))
	=>
	(printout t crlf "Como es el grosor de tu cuello?" crlf
					"a) Grueso" crlf
					"b) Delgado" crlf
					"(a/b): ")
	(assert (situacion_corbata(grosor_cuello(read)))))

(defrule italiana_indiferente_delgada_grueso
	(situacion_corbata (diseno a))
	(situacion_corbata(cuello_camisa a))
	(situacion_corbata(ancho c))
	(situacion_corbata(grosor a))
	(situacion_corbata(grosor_cuello a))
	=>
	(printout t crlf "Debes usar Prince Albert" crlf)
	(printout t crlf "(Digita un caracter cualquiera (y RETURN) para terminar)")
	(read)
	(exit))

(defrule italiana_indiferente_delgada_delgado
	(situacion_corbata (diseno a))
	(situacion_corbata(cuello_camisa a))
	(situacion_corbata(ancho c))
	(situacion_corbata(grosor a))
	(situacion_corbata(grosor_cuello b))
	=>
	(printout t crlf "Debes usar Windsor" crlf)
	(printout t crlf "(Digita un caracter cualquiera (y RETURN) para terminar)")
	(read)
	(exit))




;;;;;cuello ingles
(defrule ingles_grosor
	(situacion_corbata (diseno a))
	(situacion_corbata(cuello_camisa b))
	=>
	(printout t crlf "Como es el grosor de tu corbata?" crlf
					"a) Gruesa" crlf
					"b) Delgada" crlf
					"c) Indiferente"crlf
					"(a/b/c): ")
	(assert (situacion_corbata(grosor(read)))))

(defrule ingles_gruesa
	(situacion_corbata (diseno a))
	(situacion_corbata(cuello_camisa b))
	(situacion_corbata(grosor a))
	=>
	(printout t crlf "Debes usar Four in Hand" crlf)
	(printout t crlf "(Digita un caracter cualquiera (y RETURN) para terminar)")
	(read)
	(exit))

(defrule ingles_delgada
	(situacion_corbata (diseno a))
	(situacion_corbata(cuello_camisa b))
	(situacion_corbata(grosor b))
	=>
	(printout t crlf "Como es el ancho de tu corbata?" crlf
					"a) Ancha" crlf
					"b) Delgada" crlf
					"(a/b): ")
	(assert (situacion_corbata(ancho(read)))))

(defrule ingles_delgada_ancha
	(situacion_corbata (diseno a))
	(situacion_corbata(cuello_camisa b))
	(situacion_corbata(grosor b))
	(situacion_corbata(ancho a))
	=>
	(printout t crlf "Debes usar Kent" crlf)
	(printout t crlf "(Digita un caracter cualquiera (y RETURN) para terminar)")
	(read)
	(exit))

(defrule ingles_delgada_delgada
	(situacion_corbata (diseno a))
	(situacion_corbata(cuello_camisa b))
	(situacion_corbata(grosor b))
	(situacion_corbata(ancho b))
	=>
	(printout t crlf "Debes usar Four in Hand" crlf)
	(printout t crlf "(Digita un caracter cualquiera (y RETURN) para terminar)")
	(read)
	(exit))


(defrule ingles_indiferente
	(situacion_corbata (diseno a))
	(situacion_corbata(cuello_camisa b))
	(situacion_corbata(grosor c))
	=>
	(printout t crlf "Debes usar Half Windsor" crlf)
	(printout t crlf "(Digita un caracter cualquiera (y RETURN) para terminar)")
	(read)
	(exit))





;;;;;estamapado;;;;;;;;;
(defrule diseno_estampado
	(situacion_corbata (diseno b))
	=>
	(printout t crlf "Aun muy larga?" crlf
		"(si/no): ")
	(assert (situacion_corbata(largo(read)))))

(defrule estampada_larga_si
	(situacion_corbata (diseno b))
	(situacion_corbata(largo si))
	=>
	(printout t crlf "Cambia de corbata (y desecha esa de inmediato)" crlf)
	(printout t crlf "(Digita un caracter cualquiera (y RETURN) para terminar)")
	(read)
	(exit))

(defrule estampada_larga_no
	(situacion_corbata (diseno b))
	(situacion_corbata(largo no))
	=>
	(printout t crlf "Debes usar Windsor" crlf)
	(printout t crlf "(Digita un caracter cualquiera (y RETURN) para terminar)")
	(read)
	(exit))

;;;;;liso;;;;;;;;;
(defrule diseno_liso
	(situacion_corbata (diseno c))
	=>
	(printout t crlf "Debes usar Elredge" crlf)
	(printout t crlf "(Digita un caracter cualquiera (y RETURN) para terminar)")
	(read)
	(exit))

;;;;;indiferente;;;;;;;;;
(defrule diseno_indiferente
	(situacion_corbata (diseno d))
	=>
	(printout t crlf "Aun muy larga?" crlf
		"(si/no/indiferente): ")
	(assert (situacion_corbata(largo(read)))))

(defrule indiferente_larga_si
	(situacion_corbata (diseno d))
	(situacion_corbata(largo si))
	=>
	(printout t crlf "Cambia de corbata (y desecha esa de inmediato)" crlf)
	(printout t crlf "(Digita un caracter cualquiera (y RETURN) para terminar)")
	(read)
	(exit))

(defrule indiferente_larga_indiferente
	(situacion_corbata (diseno d))
	(situacion_corbata(largo indiferente))
	=>
	(printout t crlf "Debes usar Van Wijk" crlf)
	(printout t crlf "(Digita un caracter cualquiera (y RETURN) para terminar)")
	(read)
	(exit))

(defrule indiferente_larga_no
	(situacion_corbata (diseno d))
	(situacion_corbata(largo no))
	=>
	(printout t crlf "Que tipo de cuello tienes?" crlf
					"a) Italiano" crlf
					"b) Inglés" crlf
					"(a/b): ")
	(assert (situacion_corbata(cuello_camisa(read)))))

(defrule indiferente_larga_no_cuelloA
	(situacion_corbata (diseno d))
	(situacion_corbata(largo no))
	(situacion_corbata(cuello_camisa a))
	=>
	(printout t crlf "Debes usar Windsor" crlf)
	(printout t crlf "(Digita un caracter cualquiera (y RETURN) para terminar)")
	(read)
	(exit))

(defrule indiferente_larga_no_cuelloB
	(situacion_corbata (diseno d))
	(situacion_corbata(largo no))
	(situacion_corbata(cuello_camisa b))
	=>
	(printout t crlf "Debes usar Prince Albert" crlf)
	(printout t crlf "(Digita un caracter cualquiera (y RETURN) para terminar)")
	(read)
	(exit))




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




