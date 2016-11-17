# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# rocnik1 = Rocnik.create(cislo: 1) # Seria a kolo sa vytvoria automaticky a viete sa k nim dostat:

# kolo_1_zima = Kolo.where(rocnik: 1, seria: 'Zimná') # Toto nie su ID, ale cislo rocnika a Zimná/Letná

# priklad = Priklad.create(
#   kolo: kolo_1_zima, # Toto uz je ID, ale staci mu dat celu premennu a vie co s tym
#   cislo_v_kole: 2, # 1 az 10
#   nazov: "Hello",
#   autor: "Hello",
#   kategoria: "Séria", # Séria/Náboj
#   stav: "nepozretý", # nepozretý/vhodný/použitý/vyradený
#   pred_t: "blabla", # Text pred prikladom v zadaniach
#   po_t: "blabla", # Text po priklade v zadaniach
#   text: "blabla", # Text prikladu
#   vzorak: "blabla", # Text vzoraku
# )

# Komentar.create(priklad: priklad, autor: 'Gege', text: 'Hello') # Tu opat ide ID
# Komentar.create(priklad: priklad, autor: 'Phil', text: 'World') # Tu opat ide ID

# Knizka.create(rocnik: 1, seria: 'Zimná')