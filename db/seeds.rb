# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# rocnik1 = Rocnik.create(cislo: 1) # Seria a kolo sa vytvoria automaticky a viete sa k nim dostat:
rocnik1 = Rocnik.create(cislo: 18)
rocnik2 = Rocnik.create(cislo: 19)

# kolo_1_zima = Kolo.where(rocnik: 1, seria: 'Zimná') # Toto nie su ID, ale cislo rocnika a Zimná/Letná
kolo_1_zima = Kolo.where(rocnik: 18, seria: 'Zimná séria').take
kolo_1_leto = Kolo.where(rocnik: 18, seria: 'Letná séria').take
kolo_2_zima = Kolo.where(rocnik: 19, seria: 'Zimná séria').take
kolo_2_leto = Kolo.where(rocnik: 19, seria: 'Letná séria').take

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

priklad1 = Priklad.create(
  kolo: kolo_1_zima, # Toto uz je ID, ale staci mu dat celu premennu a vie co s tym
  cislo_v_kole: 1, # 1 az 10
  nazov: "Kamera",
  autor: "Phil",
  kategoria: "Séria", # Séria/Náboj
  stav: "použitý", # nepozretý/vhodný/použitý/vyradený
  pred_t: "text pred", # Text pred prikladom v zadaniach
  po_t: "text po", # Text po priklade v zadaniach
  text: "Kamera nám umožňuje dívať sa na svet z iného uhla. Ak nič iného, tak aspoň z uhla pohľadu
kameramana. Rozrežme kocku tromi rezmi na osem rovnakých častí. Na dvojice protiľahlých stien kocky
postupne napíšeme čísla 1, 2, 3. Toto číslo napíšeme na každý dielik, ktorého stena je súčasťou danej steny
pôvodnej kocky. Teda dostaneme osem dielikov, na každom tri čísla z troch strán z vonkajších stien a tri
neoznačené steny z vnútorných stien, ktorými sa navzájom dotýkajú. Kocku preusporiadame tak, aby sme
neoznačené steny mali stále zvnútra (na každej stene veľkej kocky sú stále štyri čísla.)
Súčet čísel na prednej stene je 4, na pravej 6, na zadnej 7 a na ľavej tiež 7. Aký je súčet čísel na vrchnej
stene?", # Text prikladu
  vzorak: "Mohli by sme postupovať nasledovne. Zamyslime sa, aký je súčet všetkých čísel na našich ôsmich
kockách. Na dvoch stenách sú jednotky, na dvoch dvojky a na dvoch trojky. Každá stena je rozdelená na
štryri časti, teda súčet všetkých čísel na kocke je 8 · 1 + 8 · 2 + 8 · 3 = 48. Podľa zadania má byť na prednej, pravej, zadnej a ľavej stene dokopy súčet 4 + 6 + 7 + 7 = 24, čiže na vrchnej a spodnej stene musí byť
súčet 48 − 24 = 24. Keďže na každej stene sa nachádzajú presne štyri čísla, tak najväčší možný súčet na
ľubovoľnej stene je 4 · 3 =", # Text vzoraku
)

priklad2 = Priklad.create(
  kolo: kolo_1_zima, # Toto uz je ID, ale staci mu dat celu premennu a vie co s tym
  cislo_v_kole: 2, # 1 az 10
  nazov: "Vysielanie",
  autor: "Jakub",
  kategoria: "Séria", # Séria/Náboj
  stav: "použitý", # nepozretý/vhodný/použitý/vyradený
  pred_t: "", # Text pred prikladom v zadaniach
  po_t: "", # Text po priklade v zadaniach
  text: "Následnosť udalostí je pri vysielacom programe veľmi dôležitá a jednotlivé úseky sú starostlivo
usporiadané, aby na divákov pôsobili presne podľa želania producentov. Máme dve po sebe idúce celé čísla
A a B. Aj ich súčet a súčin sú po sebe idúce čísla. Aké môžu byť pôvodné čísla A a B?", # Text prikladu
  vzorak: "Označme si dve po sebe idúce čísla zo zadania A a B s tým, že A < B. Potom A = B − 1. Ak majú
súčin (AB) a súčet (A + B) byť dve po sebe idúce čísla, tak jedno z nich musí byť väčšie. Skúsme, čo sa
stane, ak AB = (A + B) + 1, teda ak je súčin o jedna väčší ako súčet.
AB = (A + B) + 1
AB = (B − 1 + B) + 1
AB = 2B
Ako si môžeme všimnúť, tak na oboch stranách násobíme B. To znamená, že buď B = 0, alebo na oboch
stranách B násobíme rovnakým číslom, a teda A = 2. Ak B = 0, tak A = −1 (celé čísla môžu byť aj
záporné), AB = 0, A + B = −1 a preto získavame správne riešenie. Ak A = 2, tak B = 3, AB = 6,
A + B = 5 a zase dostávame správne riešenie.", # Text vzoraku
)

priklad3 = Priklad.create(
  kolo: kolo_1_leto, # Toto uz je ID, ale staci mu dat celu premennu a vie co s tym
  cislo_v_kole: 1, # 1 az 10
  nazov: "Súťažiaci",
  autor: "Barbora",
  kategoria: "Séria", # Séria/Náboj
  stav: "použitý", # nepozretý/vhodný/použitý/vyradený
  pred_t: "", # Text pred prikladom v zadaniach
  po_t: "", # Text po priklade v zadaniach
  text: "Všetci súťažiaci museli prejsť tvrdým výberom. Po celej množine reálnych čísel sme rozvešali
takéto plagáty:
• Hľadáme celé kladné štvorciferné číslo menšie ako 3000.
• Všetky jeho cifry sú rôzne a kladné.
• Jedna cifra je väčšia ako súčet zvyšných.
• Je deliteľné 6.
• Prvé dvojčíslie je väčšie, ako druhé.
Aké číslo hľadáme?", # Text prikladu
  vzorak: "Vítame Vás pri hľadaní čísla abcd! Poďme teda na to!
Na začiatku sa skúsime zamyslieť nad tým akú hodnotu môže mať číslica a. Keďže hľadané číslo je
menšie ako 3000 a všetky cifry sú kladné, tak nám zostávajú možnosti 1 a 2. Ak by sa a = 1, tak číslo ab
môže byť najviac 19. Keďže cd má byť podľa zadania menšie ako ab, tak c by malo byť buď 1 alebo 0. Avšak
1 už nemôžeme použiť pretože a = 1 a číslice sú rôzne. Taktiež 0 nevyhovuje, pretože to nie je kladné číslo.
Preto a = 2 a c = 1.
Následne môžeme prejsť k podmienke o deliteľnosti. Číslo, ktoré je deliteľné 6, je deliteľné 2 a 3 zároveň
(pretože 2 a 3 sú delitele 6). Aby bolo číslo deliteľné 2 musí byť párne, teda musí končiť cifrou deliteľnou
2. V tom prípade d môže len byť 4, 6, 8 (0 nie lebo nie je kladná a 2 sme už použili). Číslo je deliteľné 3,
ak je jeho ciferný súčet deliteľný 3. Ako si môžeme všimnúť a + c je deliteľné tromi. Aby sa táto vlastnosť
zachovala, tak aj b + d musí byť deliteľné 3.", # Text vzoraku
)

priklad4 = Priklad.create(
  kolo: kolo_1_leto, # Toto uz je ID, ale staci mu dat celu premennu a vie co s tym
  cislo_v_kole: 2, # 1 az 10
  nazov: "Majster a učeň",
  autor: "Marianna",
  kategoria: "Séria", # Séria/Náboj
  stav: "použitý", # nepozretý/vhodný/použitý/vyradený
  pred_t: "", # Text pred prikladom v zadaniach
  po_t: "", # Text po priklade v zadaniach
  text: "Bude snáď tematikou tohto ročníku Japonsko, krajina samurajov a mrakodrapov? Majster a učeň
hrajú hru. Majú figúrky vysoké 1, 2 a 3, každú dvakrát. Majster ich uložil do mriežky 3 × 2, pričom do
každého riadku dal všetky tri rôzne výšky. Učeň má za úlohu zistiť ich uloženie na čo najmenej pokusov.
Každý pokus učeň navrhne rozloženie figúrok. Majster mu potom povie, na koľkých riadkoch a stĺpcoch
vidí toľko figúriek, koľko má. Konkrétne súčet týchto dvoch čísiel.", # Text prikladu
  vzorak: "Najprv sa pozrime na prvý pokus. Vo všetkých stĺpcoch a riadkoch vidíme len prednú figúrku (ostatné sú
príliš nízke na to, aby sme ich pri pohľade zhora alebo zprava videli), vieme že dva pohľady sú správne.
Preto platí, že práve vo dvoch stĺpcoch alebo riadkoch bude vidno len jednu figúrku.
Druhý pokus má tri stĺpce, z ktorých vidno len jednu figúrku a dva riadky, z ktorých vidno figúrky dve.
Vieme, že práve tri sú správne. Možu teda nastať tri situácie, buď sú tri stĺpce správne, alebo sú dva stĺpce
a jeden riadok správne, alebo jeden stĺpec a dva riadky sú správne. Tri stĺpce nemôžu byť správne, lebo
pri všetkých vidno len jednu figúrku, a vieme že musia byť práve dve. Ak sú 2 stĺpce a 1 riadok pravdivé,
tak nie je žiaden problém. Čo keď sú 2 riadky a 1 stĺpec pravdivé? Potom sú pravdivé 2 riadky, v ktorých
sú v každom vidno práve 2 figúrky. Teda to, že dvakrát vidíme len jednu figúrku, musí byť spôsobené iba
stĺpcami. Teraz je vo všetkých stĺpcoch vidno jedna, teda pohľad na dva z nich musí byť správny. Potom už
máme 4 správne pohľady, dva za stĺpce a dva za riadky. Zadanie hovorí však o troch, takže to takto nebude.", # Text vzoraku
)

priklad5 = Priklad.create(
  kolo: kolo_2_zima, # Toto uz je ID, ale staci mu dat celu premennu a vie co s tym
  cislo_v_kole: 1, # 1 az 10
  nazov: "Väzni",
  autor: "Jakub",
  kategoria: "Séria", # Séria/Náboj
  stav: "použitý", # nepozretý/vhodný/použitý/vyradený
  pred_t: "", # Text pred prikladom v zadaniach
  po_t: "", # Text po priklade v zadaniach
  text: "Zvyk je železná košeľa. Nedá sa ujsť, pred svetom neutečieš. Kým všetci sme v metaforickom
väzení sveta, niektorí si aj naozaj odpykávajú trest za mrežami. Dvaja väzni majú cely na opačných koncoch
väzenia. Nemôžu sa stretnúť ani si inak vymieňať informácie.
Jedného dňa ich však strážnici privedú k sebe a povedia im: „Dáme vám šancu vyslobodiť sa. O hodinu
vás opäť rozdelíme. Jeden pôjde späť do svojej cely a druhý ostane tu. Prvému ukážeme 6 rôznych čísel,
náhodne vybraných z prvých 245 prirodzených čísel. Potom bude musieť vylúčiť jedno zo šiestich čísel a
povedať mi ostatných 5, ktoré napíšem na kúsok papiera v takom poradí, v akom si ich vypočujem. Potom
bude musieť opustiť miestnosť a zavoláme dnu toho druhého. Po prečítaní 5 napísaných čísel bude musieť
uhádnuť to jedno, ktoré bolo vylúčené. Ak ho uhádne, obaja budete voľní.“ Ako sa môžu oslobodiť?", # Text prikladu
  vzorak: "Cieľom tejto úlohy bolo nájsť spôsob, akým prvý väzeň vylúči jedno zo šiestich čísiel a následne
zvyšných päť nadiktuje v určitom poradí naspäť dozorcovi tak, aby druhý väzeň dokázal identifikovať vy-
lúčené číslo. Zamerajme sa najprv na to, akú informáciu dokážeme poslať pomocou piatich rôznych čísel.
Nakoľko vieme určiť poradie, môžeme sa pohrať s ich rôznymi permutáciami, teda spôsobmi zoradenia.
Celkový počet zoradení piatich čísiel je 120, lebo na prvú pozíciu vieme dať 5 čísiel, na druhú 4, na tretiu
3, na štvrtú 2 a na piatu iba 1. Spolu máme 5 · 4 · 3 · 2 · 1 = 120 možností.
Ďalej sa pozrime na situáciu druhého väzňa. Vypočuje si 5 prirodzených čísiel od 1 do 245. Pre vylúčené
číslo mu teda ostane 245 − 5 = 240 možností, čo je dvojnásobok permutácií piatich čísiel. Tým pádom, ak
ku každej permutácii priradíme 2 čísla, tak máme 50% šancu sa trafiť. Napríklad zoradenie od najmenšieho
po najväčšie číslo predstavuje číslo 1, ale aj 120 + 1. Ďalšie zoradenie bude prislúchať číslam 2 a 122, potom
3 a 123, až posledné 120 a 240.", # Text vzoraku
)

priklad6 = Priklad.create(
  kolo: kolo_2_zima, # Toto uz je ID, ale staci mu dat celu premennu a vie co s tym
  cislo_v_kole: 2, # 1 az 10
  nazov: "100-uholník",
  autor: "Barbora",
  kategoria: "Séria", # Séria/Náboj
  stav: "použitý", # nepozretý/vhodný/použitý/vyradený
  pred_t: "", # Text pred prikladom v zadaniach
  po_t: "", # Text po priklade v zadaniach
  text: "Je dôležité, aby všetko bolo uniformné a nikto príliš nevytŕčal z radu. Preto máme pravidelný
100-uholník. Ľubovoľných 50 vrcholov je bielych, zvyšné červené. Dokážte, že bez ohľadu na rozloženie farieb
je možné rozdeliť jeho 100 vrcholov do štvoríc tak, aby v každej boli 2 červené a 2 biele a navyše tvorili
obdĺžnik.", # Text prikladu
  vzorak: "Kde bolo, tam bolo, na začiatku bolo 100 bodov, 50 bielych a zvyšok 100 − 50 = 50 červených.
Tieto body vytvorili 50 rovnakých úsečiek. Nielen veľkosťou, ale aj koncovými bodmi, jeden červený a
druhý biely. Avšak, potom sme prišli my a povedali im, aby sa usporiadali do radu. Úsečky poslúchli, no pri
presune nastal chaos, úsečky sa pozrážali a niektoré si povymieňali koncové body. Keď sa vymenili body
rovnakej farby, nič sa nestalo, no stali sa aj také zrážky, kedy sa vymenili červený bod s bielym. Keďže
platia zákony zachovania bodov a farby, nastala takáto reakcia medzi úsečkami s bielymi koncovými bodmi
(B) a červenými koncovými bodmi (C): 2BC = BB + CC, pričom medzi novými úsečkami vzniklo zvlášte
puto, obdĺžnikové puto.
Potom sme úsečkám rozkázali, aby utvorili dvojice. Úsečky BB a CC viazané obdĺžnikovým putom ostali
spolu, no ostané úsečky BC sa začali obávať, či im ostane nejaký parťák do dvojice. My sme ich upokojili -
Na začiatku ich bolo 50 a puto tvorí dvojica. Teda aj počet zvyšných úsečiek je párny, čiže si budú vedieť
nájsť pár. Keď potom vytvorili dvojice, vzniklo aj medzi týmito dvojicami obdĺžnikové puto.
Keďže sme na úsečky dobrí, nechali sme im postaviť kolotoč v tvare pravidelného 100uholníka. Nane-
šťastie sa výrobca pomýlil a namiesto toho, aby body jednej úsečky sedeli vedľa seba, sedia oproti sebe. To
znamená, že každá z nich tvorí priemer opísanej kružnice toho 100uholníka. Okrem tohto pravidla si sadli
úplne náhodne.", # Text vzoraku
)

priklad7 = Priklad.create(
  kolo: kolo_2_leto, # Toto uz je ID, ale staci mu dat celu premennu a vie co s tym
  cislo_v_kole: 1, # 1 az 10
  nazov: "Reklama",
  autor: "Phil",
  kategoria: "Séria", # Séria/Náboj
  stav: "použitý", # nepozretý/vhodný/použitý/vyradený
  pred_t: "", # Text pred prikladom v zadaniach
  po_t: "", # Text po priklade v zadaniach
  text: "Reklama má vo vysielacom programe jedinečné miesto. Máme štvorec 7 × 7 so 16 dielikmi 3 × 1
a jedným dielikom 1 × 1. Na ktorých pozíciách môže byť dielik 1 × 1?", # Text prikladu
  vzorak: "Pri riešení takéhoto príkladu je fajn začať si vypisovať nejaké možnosti. Po chvíli skúšania máme
totiž zhruba predstavu, aké pozície budú tie dôležité, kde by sa mal vedieť nachádzať ten dielik 1 × 1.
Je však dôležité nezastaviť sa pri skúšaní a skúsiť vymyslieť niečo, čo nám bližšie pomôže. Pri takýchto
šachovnicových (kľudne aj s inými rozmermi ako 8 × 8) úlohách je jedným z typických spôsobov, ktoré sa
oplatí poznať, zafarbovanie. Myšlienkou bude zhruba to, že si vyfarbíme niektoré z políčok tak, že keď tam
budeme ukladať jednotlivé dieliky, niečo nám to o nich povie.
Pre predstavu, ak by sme mali vyfarbenú šachovnicu a umiestňujeme na ňu dieliky 2 × 1, tak každý z
nich zaberie jedno biele a jedno čierne políčko. V našej úlohe ale umiestňujeme dieliky 3 × 1, preto namiesto
každého druhého políčka (resp. každej druhej uhlopriečky) vyfarbíme každé tretie políčko a s každým riadkom
to budeme posúvať.", # Text vzoraku
)

priklad8 = Priklad.create(
  kolo: kolo_2_leto, # Toto uz je ID, ale staci mu dat celu premennu a vie co s tym
  cislo_v_kole: 2, # 1 az 10
  nazov: "Spolužiaci",
  autor: "Jakub",
  kategoria: "Séria", # Séria/Náboj
  stav: "vhodný", # nepozretý/vhodný/použitý/vyradený
  pred_t: "Nemusíš ani príliš dlho rozmýšľať na to, aby ti bolo jasné, že do toho ideš. „Ja tú výzvu prijímam,
zachránim našu krajinu a porazím zlého mága.”
No tajomný muž sa tvári trochu neisto.
„Nie tak rýchlo!” Zahriakne ťa. “Naša veštba síce hovorí o chrabrom mágovi, ktorý zachráni našu zem.
Tiež však hovorí, že skôr než sa tento mág vydá na boj proti Gustaffsonovi, musí dokázať svoje odhodlanie.
Musí dokázať, že je skutočne jediným, kto ho dokáže poraziť, že je tým najbystrejším a najodvážnejším
mladým mágom, aký kedy žil. Preto skôr, než sa vydáš na cestu, musíš vyriešiť hádanku, ktorá preverí tvoj
intelekt.”
Následne ti podá zvitok so zadaním.", # Text pred prikladom v zadaniach
  po_t: "S ľahkosťou vyriešiš hádanku a tým dokážeš, že si naozaj dosť bystrý na
to, aby si porazil Gustaffsona. Teraz sa môžeš pustiť do svojej neľahkej
úlohy. Rada najstarších mágov sa rozhodla poskytnúť ti pomoc, preto
dostávaš obrovskú prastarú knihu kúziel, do ktorej tvoji predkovia roky a
roky zapisovali všakovaké formulky. Celá kniha je ale písaná starobylým
runovým písmom, ktoré síce vieš rozlúštiť, no trvá to príliš dlho. Musíš
teda zistiť, na ktorej strane sa nachádza kúzlo, ktoré sa chystáš použiť
proti Gustaffsonovi. Číslo strany je ale zašifrované.", # Text po priklade v zadaniach
  text: "Spolužiaci nosili zajkovi ovocie naozaj radi a striedali sa v tom. Naposledy to boli Ignác,
Viki, Janka a Miška. Ignác má v taške dve jablká a hrušku. Viki má dva pomaranče a hrušku. Janka
má dve hrušky a jablko. Z tašiek týchto troch detí je Jankina najťažšia a Ignácova najľahšia. Miška má
v taške jablko, pomaranč a hrušku. Porovnajte hmotnosť jej tašky s taškami ostatných deti, keď viete,
že každé dve jablká vážia rovnako, každé dve hrušky vážia rovnako a aj každé dva pomaranče vážia
rovnako.", # Text prikladu
  vzorak: "", # Text vzoraku
)

priklad9 = Priklad.create(
  kolo: kolo_2_leto, # Toto uz je ID, ale staci mu dat celu premennu a vie co s tym
  cislo_v_kole: 3, # 1 az 10
  nazov: "Skryté číslo",
  autor: "Phil",
  kategoria: "Séria", # Séria/Náboj
  stav: "nepozretý", # nepozretý/vhodný/použitý/vyradený
  pred_t: "Výborne! Už poznáš to správne kúzlo. Je to však oveľa komplikovanejšie, než si si myslel. Na to, aby si ho
zvládol použiť, musíš najprv namiešať magický elixír. V knižnici si si požičal knihu elixírov, no na niektorých
miestach už písmenká vybledli a ty vieš len s ťažkosťou rozoznať jednotlivé prísady. Poznáš však ich poradie,
a tak si ich očísluješ. Teraz stačí iba vybrať tú správnu kombináciu!", # Text pred prikladom v zadaniach
  po_t: "", # Text po priklade v zadaniach
  text: "Máme číslo ABBCD (čiara nad číslom znamená, že písmená predstavujú jeho cifry).
Keď navzájom vynásobíme jeho cifry, dostaneme BAC. Keď tomuto novému číslu navzájom vynásobíme
cifry, dostaneme AC. Nakoniec vynásobením cifier A a C dostaneme len C. Aké číslo je v skutočnosti
ABBCD?", # Text prikladu
  vzorak: "", # Text vzoraku
)

priklad10 = Priklad.create(
  kolo: kolo_2_leto, # Toto uz je ID, ale staci mu dat celu premennu a vie co s tym
  cislo_v_kole: 4, # 1 az 10
  nazov: "Kevin",
  autor: "Barbora",
  kategoria: "Náboj", # Séria/Náboj
  stav: "nepozretý", # nepozretý/vhodný/použitý/vyradený
  pred_t: "Elixír máš namiešaný, kúzlo pripravené. Môžeš sa teda vydať na cestu. Rozprestrieš pred seba mapu, že si
zakreslíš pozíciu Gustaffsonovho hradu. Pozeráš na úradnice, ktoré si dostal na zvitku od tajomného muža
a usudzuješ, že sú akési divné.", # Text pred prikladom v zadaniach
  po_t: "Konečne si našiel cestu do Gustaffsonovho hradu. Už z diaľky vidíš, že pred bránou sa prechádzajú stráže.
Musíš si teda starostlivo naplánovať každý jeden krok, aby si sa bezpečne a nebadane dostal do hradu.", # Text po priklade v zadaniach
  text: "Kevin napísal na papier dve štvorciferné čísla pod seba. Nenapísal ich ale hocijako, napísal
ich, akoby to boli digitálky. Čísla spočítal a vyšlo mu číslo 6688. Potom papier otočil dole hlavou a zistil,
že pôvodné dve čísla stále dávajú zmysel, tak ich spočítal tiež. Vyšlo mu 11896. Aké čísla mal napísané
na papieri? Mohla mať Sára napísané na papieri iné dve čísla a dostať rovnaké výsledky? Koľko možností
na takéto čísla máme? Vieme o nich ešte, že žiadne štvorciferné číslo nezačína nulou, a dokonca ani ak
by sme ho otočili dole hlavou. Navyše uvažujeme také cifry, ktoré dávali “zmysel” pri pohľade zhora aj
zdola. (napríklad také číslo 7 síce z jednej strany dáva zmysel, ale keď ho otočíme dolu hlavou, už z neho
pekné číslo nedostaneme. Rátame s tým, že číslo 1 je rovnaké aj zhora aj zdola, aj keď bude zarovnané
na opačnú stranu.)", # Text prikladu
  vzorak: "", # Text vzoraku
)

priklad11 = Priklad.create(
  kolo: kolo_2_leto, # Toto uz je ID, ale staci mu dat celu premennu a vie co s tym
  cislo_v_kole: 5, # 1 az 10
  nazov: "Truhlica",
  autor: "Marianna",
  kategoria: "Náboj", # Séria/Náboj
  stav: "nepozretý", # nepozretý/vhodný/použitý/vyradený
  pred_t: "Po dlhom putovaní si sa dostal až pred Gustaffsonovu komnatu. Skúšaš ju otvoriť, ale dvere sú zamknuté.
Šikovne podplatíš jedného zo služobníkov a zistíš, že kľúč k dverám Gustaffson dôsledne ukrýva v tajomnej
truhlici.", # Text pred prikladom v zadaniach
  po_t: "Otváraš dvere do komnaty samotného Gustaffsona. Nemôžeš si nevšimnúť, ako je prezdobená. Celá miestnosť,
steny, dokonca aj podlaha hýria farbami a vzormi. Máš pocit, akoby ich tam bolo priam nekonečne veľa.", # Text po priklade v zadaniach
  text: "V izbe je veľká truhlica, na ktorej je 10 zámkov. V izbe sú aj strážcovia, o ktorých vieme
tieto tri informácie:
• Každý strážca má pri sebe práve 5 kľúčov, z ktorých každý otvára práve jeden zámok a žiadne
dva neotvárajú ten istý zámok.
• Neexistujú dvaja strážcovia, ktorý majú kľúče k rovnakým 5 zámkom (čiže rovnakú sadu kľúčov).
• Neexistujú dvaja strážcovia, ktorý by spolu vedeli odomknúť všetkých 10 zámkov
(K jednému zámku môže mať kľúč teda viacero strážcov)
Koľko najviac môže byť v izbe strážcov?
A koľko najviac by mohlo byť strážcov ak by zámkov bolo 42 a každý strážca by mal práve 21 kľúčov,
neexistovali by dvaja strážcovia s kľúčmi k rovnakým 21 zámkom a ani dvaja strážcovia čo vedia spolu
odomknúť všetkých 42 zámkov?", # Text prikladu
  vzorak: "", # Text vzoraku
)

# Komentar.create(priklad: priklad, autor: 'Gege', text: 'Hello') # Tu opat ide ID
Komentar.create(priklad: priklad1, autor: 'Phil', text: 'upravena gramatika') # Tu opat ide ID
Komentar.create(priklad: priklad1, autor: 'Barbora', text: 'super príklad')

# Knizka.create(rocnik: 1, seria: 'Zimná')

Knizka.create(rocnik: 18, seria: 'Zimná', cislo: 0)
Knizka.create(rocnik: 18, seria: 'Letná', cislo: 0)
Knizka.create(rocnik: 19, seria: 'Zimná', cislo: 0)
Knizka.create(rocnik: 19, seria: 'Letná', cislo: 0)

Riesitel.create(meno: 'Peter', priezvisko: 'Nový', adresa: 'Biela 5, Bratislava', datum_narodenia: '12.05.2002', email: 'peter@novy.sk')
Riesitel.create(meno: 'Pavol', priezvisko: 'Múdry', adresa: 'Orgovánová 24, Bratislava', datum_narodenia: '05.12.2002', email: 'p@mudry.sk')
Riesitel.create(meno: 'Anna', priezvisko: 'Dobrá', adresa: 'Hlavná 1, Bratislava', datum_narodenia: '01.10.2000', email: 'a@dobra.sk')

Organizator.create(meno: "Marianna", priezvisko: "Vtipná", email: 'marianna@vtipna.sk')
Organizator.create(email: 'zatial@bezmena.sk')