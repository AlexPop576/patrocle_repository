import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  List<String> countries = [
    "Afghanistan",
    "Albania",
    "Algeria",
    "Andorra",
    "Angola",
    "Antigua and Barbuda",
    "Argentina",
    "Armenia",
    "Australia",
    "Austria",
    "Azerbaijan",
    "Bahamas",
    "Bahrain",
    "Bangladesh",
    "Barbados",
    "Belarus",
    "Belgium",
    "Belize",
    "Benin",
    "Bhutan",
    "Bolivia",
    "Bosnia and Herzegovina",
    "Botswana",
    "Brazil",
    "Brunei",
    "Bulgaria",
    "Burkina Faso",
    "Burundi",
    "Cabo Verde",
    "Cambodia",
    "Cameroon",
    "Canada",
    "CAR",
    "Chad",
    "Chile",
    //"China",
    "Colombia",
    "Comoros",
    "Congo",
    "Costa Rica",
    "Croatia",
    "Cuba",
    "Cyprus",
    "Czechia",
    "Denmark",
    "Djibouti",
    "Dominica",
    "Dominican Republic",
    "East Timor",
    "Ecuador",
    "Egypt",
    "El Salvador",
    "Equatorial Guinea",
    "Eritrea",
    "Estonia",
    "Eswatini",
    "Ethiopia",
    "Fiji",
    "Finland",
    //"France",
    "Gabon",
    "Gambia",
    "Georgia",
    "Germany",
    "Ghana",
    "Greece",
    "Grenada",
    "Guatemala",
    "Guinea",
    "Guinea Bissau",
    "Guyana",
    "Haiti",
    "Honduras",
    "Hungary",
    "Iceland",
    "India",
    "Indonesia",
    "Iran",
    "Iraq",
    "Ireland",
    "Israel",
    //"Italy",
    "Ivory Coast",
    "Jamaica",
    "Japan",
    "Jordan",
    "Kazakhstan",
    "Kenya",
    "Kiribati",
    "North Korea",
    "South Korea",
    "Kosovo",
    "Kuwait",
    "Kyrgyzstan",
    "Laos",
    "Latvia",
    "Lebanon",
    "Lesotho",
    "Liberia",
    "Libya",
    "Liechtenstein",
    "Lithuania",
    "Luxembourg",
    "Madagascar",
    "Malawi",
    "Malaysia",
    "Maldives",
    "Mali",
    "Malta",
    "Marshall Islands",
    "Mauritania",
    "Mauritius",
    "Mexico",
    "Micronesia",
    "Moldova",
    "Monaco",
    "Mongolia",
    "Montenegro",
    "Morocco",
    "Mozambique",
    "Myanmar",
    "Namibia",
    "Nauru",
    "Nepal",
    "Netherlands",
    "New Zealand",
    "Nicaragua",
    "Niger",
    "Nigeria",
    "North Macedonia",
    "Norway",
    "Oman",
    "Pakistan",
    "Palau",
    "Palestine",
    "Panama",
    "Papua New Guinea",
    "Paraguay",
    "Peru",
    "Philippines",
    "Poland",
    "Portugal",
    "Qatar",
    //"Romania",
    "Russia",
    "Rwanda",
    "Saint Kitts and Nevis",
    "Saint Lucia",
    "Saint Vincent and the Grenadines",
    "Samoa",
    "San Marino",
    "Sao Tome and Principe",
    "Saudi Arabia",
    "Senegal",
    "Serbia",
    "Seychelles",
    "Sierra Leone",
    "Singapore",
    "Slovakia",
    "Slovenia",
    "Solomon Islands",
    "Somalia",
    "South Africa",
    "South Sudan",
    //"Spain",
    "Sri Lanka",
    "Sudan",
    "Suriname",
    "Sweden",
    "Switzerland",
    "Syria",
    "Taiwan",
    "Tajikistan",
    "Tanzania",
    "Thailand",
    "Togo",
    "Tonga",
    "Trinidad and Tobago",
    "Tunisia",
    "Turkey",
    "Turkmenistan",
    "Tuvalu",
    "Uganda",
    "Ukraine",
    "UAE",
    "United Kingdom",
    //"United States",
    "Uruguay",
    "Uzbekistan",
    "Vanuatu",
    "Vatican",
    "Venezuela",
    "Vietnam",
    "Yemen",
    "Zambia",
    "Zimbabwe"
  ];

  String answer1 = jsonEncode(['Barcelona', 'Madrid', 'Valencia', 'Sevilla']);
  String answer2 = jsonEncode([
    'Munții Pirinei',
    'Munții Cantabrici',
    'Munții Betici',
    'Munții Centrali'
  ]);
  String answer3 = jsonEncode([
    'Vârful Teide',
    'Vârful Aneto',
    'Vârful Mulhacén',
    'Vârful Pico de Orizaba'
  ]);
  String answer4 = jsonEncode(['Lisbona', 'Barcelona', 'Sevilla', 'Bilbao']);
  String answer5 = jsonEncode(['Mallorca', 'Ibiza', 'Sardinia', 'Tenerife']);
  String answer6 = jsonEncode(
      ['Marea Neagră', 'Marea Caspică', 'Marea Mediterană', 'Marea Azov']);
  String answer7 =
      jsonEncode(['Gran Canaria', 'Tenerife', 'Lanzarote', 'Fuerteventura']);
  String answer8 = jsonEncode(['Ebro', 'Tagus', 'Guadalquivir', 'Manzanares']);
  String answer9 = jsonEncode(['Ebro', 'Guadalquivir', 'Tagus', 'Duero']);
  String answer10 =
      jsonEncode(['Temperat continental', 'Mediteranean', 'Oceanic', 'Alpin']);
  String answer11 = jsonEncode([
    'Temperaturi reci și precipitații abundente',
    'Temperaturi moderate și veri uscate',
    'Ierni lungi și veri călduroase',
    'Temperaturi extreme și umiditate ridicată'
  ]);
  String answer12 = jsonEncode([
    'Munții Cantabrici',
    'Munții Pirinei',
    'Munții Betici',
    'Munții Centrali'
  ]);
  String answer13 =
      jsonEncode(['Valencia', 'Bilbao', 'Sevilla', 'Santiago de Compostela']);
  String answer14 = jsonEncode([
    'Cristofor Columb',
    'Vasco da Gama',
    'Ferdinand Magellan',
    'Marco Polo'
  ]);
  String answer15 = jsonEncode([
    'Regatul Castiliei',
    'Regatul Aragonului',
    'Regatul Franței',
    'Regatul Navarrei'
  ]);
  String answer16 = jsonEncode([
    'Cucerirea Americii',
    'Începutul Reconquistei',
    'Unificarea regatelor',
    'Reforma Protestantă'
  ]);
  String answer17 = jsonEncode([
    'Hernán Cortés',
    'Francisco Pizarro',
    'Ferdinand Magellan',
    'Juan Ponce de León'
  ]);
  String answer18 =
      jsonEncode(['1910-1930', '1939-1975', '1980-2000', '1960-1980']);
  String answer19 = jsonEncode([
    'Ferdinand al VII-lea',
    'Alfonso al XIII-lea',
    'Carol al III-lea',
    'Isabela a II-a'
  ]);
  String answer20 = jsonEncode([
    'Războiul Civil Spaniol',
    'Revoluția Industrială',
    'Războaiele de independență din America Latină',
    'Primul Război Mondial'
  ]);
  String answer21 = jsonEncode([
    'Decizia de a intra în Războiul de Treizeci de Ani',
    'Declararea independenței față de Franța',
    'Cucerirea Constantinopolului',
    'Decretul de expulzare a evreilor și a maurilor'
  ]);
  String answer22 = jsonEncode([
    'În secolul al XIX-lea',
    'În secolul al XX-lea',
    'În secolul al XVIII-lea',
    'În secolul al XVI-lea'
  ]);
  String answer23 = jsonEncode(
      ['Monarhie absolută', 'Republică', 'Monarhie parlamentară', 'Dictatură']);
  String answer24 = jsonEncode([
    'Regatul Castiliei',
    'Regatul Aragonului',
    'Regatul Navarrei',
    'Regatul Portugaliei'
  ]);
  String answer25 = jsonEncode([
    'Ferdinand al II-lea',
    'Isabela I',
    'Carol al V-lea',
    'Filip al II-lea'
  ]);
  String answer26 = jsonEncode(['Mexic', 'Peru', 'Brazilia', 'Argentina']);
  String answer27 = jsonEncode([
    'Bătălia de la Las Navas de Tolosa',
    'Căderea Granadei',
    'Căsătoria regilor Ferdinand și Isabela',
    'Bătălia de la Covadonga'
  ]);
  String answer28 =
      jsonEncode(['El Cid', 'Don Quijote', 'El Greco', 'Miguel de Cervantes']);
  String answer29 = jsonEncode([
    'Diversificarea culturală',
    'Extinderea influenței catolice',
    'Intoleranța religioasă',
    'Stabilirea unei uniuni naționale'
  ]);
  String answer30 = jsonEncode([
    'Ferdinand Magellan',
    'Cristofor Columb',
    'Vasco da Gama',
    'James Cook'
  ]);
  String answer31 = jsonEncode([
    'Consolidarea controlului musulman',
    'Extinderea diversității religioase',
    'Unificarea teritoriilor sub un singur regat',
    'Perioade de coabitare pașnică între creștini, musulmani și evrei'
  ]);
  String answer32 = jsonEncode([
    'Războiul de șapte ani',
    'Războiul de independență al SUA',
    'Războiul Peninsular',
    'Războiul Crimeei'
  ]);
  String answer33 = jsonEncode(['Florida', 'California', 'Louisiana', 'Texas']);
  String answer34 = jsonEncode(['Barcelona', 'Madrid', 'Paris', 'Lisabona']);
  String answer35 =
      jsonEncode(['Mont Blanc', 'Matterhorn', 'Mont Ventoux', 'Montserrat']);
  String answer36 = jsonEncode(
      ['Turnul Eiffel', 'Sagrada Familia', 'Colosseumul', 'Acropola']);
  String answer37 = jsonEncode(['Alpii', 'Pirineii', 'Apeninii', 'Carpații']);
  String answer38 = jsonEncode(['Tamisa', 'Sena', 'Tiber', 'Rin']);
  String answer39 =
      jsonEncode(['Bretania', 'Corsica', 'Côte d\'Azur', 'Normandia']);
  String answer40 =
      jsonEncode(['Carpații', 'Pirineii', 'Alpii', 'Munții Cantabrici']);
  String answer41 = jsonEncode(['Toscana', 'Bordeaux', 'Rioja', 'Bourgogne']);
  String answer42 = jsonEncode(['Sudul', 'Nordul', 'Estul', 'Vestul']);
  String answer43 =
      jsonEncode(['Normandia', 'Alsacia', 'Bretania', 'Provence']);
  String answer45 = jsonEncode(['Sena', 'Loara', 'Rhone', 'Garonne']);
  String answer46 = jsonEncode(
      ['Insulele Baleare', 'Insulele Canare', 'Corsica', 'Insulele Britanice']);
  String answer47 = jsonEncode([
    '4 - Belgia, Germania, Italia, Spania',
    '5 - Belgia, Luxemburg, Germania, Italia, Spania',
    '6 - Belgia, Luxemburg, Germania, Italia, Elveția, Spania',
    '3 - Belgia, Germania, Spania'
  ]);
  String answer48 = jsonEncode([
    'Vinuri fine',
    'Gătitul pe bază de orez',
    'Sculptura în lemn',
    'Costume tradiționale de dans'
  ]);
  String answer49 = jsonEncode([
    'Clima este constantă pe tot teritoriul Franței și nu influențează agricultura și turismul.',
    'Clima este predominant mediteraneană și susține agricultura în regiunile sudice, în timp ce turismul este afectat de temperaturile ridicate.',
    'Clima variază de la mediteraneană în sud la temperată în nord, influențând tipurile de culturi agricole și activitățile turistice.',
    'Clima este polară pe tot teritoriul Franței, ceea ce face agricultura și turismul dificile.'
  ]);
  String answer50 =
      jsonEncode(['Alpii', 'Pirineii', 'Masivul Central', 'Munții Apenini']);
  String answer51 = jsonEncode(
      ['Riviera Franceză', 'Coasta de Azur', 'Côte d\'Or', 'Costa Brava']);
  String answer52 = jsonEncode(['Nilul', 'Sena', 'Amazonul', 'Mississippi']);
  String answer53 = jsonEncode([
    'Stațiuni de lux și plaje frumoase',
    'Stânci abrupte și peisaje sălbatice',
    'Plaje nisipoase și lagune pitorești',
    'Insule vulcanice și recife de corali'
  ]);
  String answer54 = jsonEncode(['Germania', 'Italia', 'Gallia', 'Hispania']);
  String answer55 = jsonEncode([
    'Napoleon Bonaparte',
    'Ludovic al XIV-lea',
    'Regele Ludovic al XVI-lea',
    'Ludovic al XI-lea'
  ]);
  String answer56 = jsonEncode([
    'Perioada Iluminismului',
    'Epoca medievală',
    'Epoca napoleoniană',
    'Renașterea'
  ]);
  String answer57 = jsonEncode([
    'Războiul Franco-Prusac',
    'Revoluția Franceză',
    'Reconquista',
    'Declarația de independență'
  ]);
  String answer58 = jsonEncode([
    'Al Doilea Război Mondial',
    'Primul Război Mondial',
    'Războiul Civil Francez',
    'Războiul Franco-Prusac'
  ]);
  String answer59 = jsonEncode([
    'Epoca modernă',
    'Epoca Renașterii',
    'Epoca industrială',
    'Epoca victoriană'
  ]);
  String answer60 = jsonEncode([
    'Ludovic al XIV-lea',
    'Ludovic al XVI-lea',
    'Carol al V-lea',
    'Francisc I'
  ]);
  String answer61 = jsonEncode(['1815', '1789', '1870', '1945']);
  String answer62 = jsonEncode(
      ['Carol cel Mare', 'Ludovic al IX-lea', 'Francisc I', 'Carol al V-lea']);
  String answer63 = jsonEncode(['Algeria', 'Canada', 'Indonezia', 'Australia']);
  String answer64 = jsonEncode([
    'Secolul al XV-lea',
    'Secolul al XVI-lea',
    'Secolul al XVII-lea',
    'Secolul al XVIII-lea'
  ]);
  String answer65 = jsonEncode([
    'Războiul Franco-Prusac',
    'Războiul de Șapte Ani',
    'Războiul de Independență al Statelor Unite',
    'Războiul de Treizeci de Ani'
  ]);
  String answer66 = jsonEncode([
    'Secolul al XV-lea',
    'Secolul al XVIII-lea',
    'Secolul al XIX-lea',
    'Secolul al XX-lea'
  ]);
  String answer67 = jsonEncode([
    'Arthur Wellesley, Duce de Wellington',
    'Otto von Bismarck',
    'George Washington',
    'Winston Churchill'
  ]);
  String answer68 = jsonEncode(['Paris', 'Versailles', 'Bordeaux', 'Lyon']);
  String answer69 = jsonEncode([
    'Secolul al XIX-lea',
    'Secolul al XVII-lea',
    'Secolul al XVIII-lea',
    'Secolul al XV-lea'
  ]);
  String answer70 = jsonEncode([
    'Carol al V-lea',
    'Ludovic al XIV-lea',
    'Filip al II-lea',
    'Francisc I'
  ]);
  String answer71 = jsonEncode([
    'Caterina de Medici',
    'Maria Antoaneta',
    'Isabela de Bavaria',
    'Ana de Austria'
  ]);
  String answer72 =
      jsonEncode(['Iluminismul', 'Jacobinismul', 'Romantismul', 'Realismul']);
  String answer73 = jsonEncode([
    'Charles de Gaulle',
    'Napoleon Bonaparte',
    'Ferdinand Foch',
    'Napoleon al III-lea'
  ]);
  String answer74 = jsonEncode(['Roma', 'Milano', 'Veneția', 'Napoli']);
  String answer75 =
      jsonEncode(['Alpii', 'Pirineii', 'Apeninii', 'Munții Cantabrici']);
  String answer76 =
      jsonEncode(['Mont Blanc', 'Monte Rosa', 'Matterhorn', 'Carpați']);
  String answer77 = jsonEncode([
    'Aproximativ 30 de milioane de locuitori',
    'Aproximativ 60 de milioane de locuitori',
    'Aproximativ 90 de milioane de locuitori',
    'Aproximativ 120 de milioane de locuitori'
  ]);
  String answer78 = jsonEncode(['Sicilia', 'Sardinia', 'Corsica', 'Capri']);
  String answer79 =
      jsonEncode(['Râul Rhône', 'Râul Tevere', 'Râul Ebro', 'Râul Danube']);
  String answer80 = jsonEncode([
    'Clima mediteraneană',
    'Clima temperată',
    'Clima alpină',
    'Clima oceanică'
  ]);
  String answer81 = jsonEncode(['Roma', 'Napoli', 'Florența', 'Veneția']);
  String answer82 = jsonEncode([
    'Oceanul Atlantic',
    'Marea Mediterană',
    'Oceanul Indian',
    'Oceanul Pacific'
  ]);
  String answer83 = jsonEncode(['Sicilia', 'Sardinia', 'Capri', 'Elba']);
  String answer84 =
      jsonEncode(['4.808 metri', '3.718 metri', '4.810 metri', '5.642 metri']);
  String answer85 =
      jsonEncode(['Râul Po', 'Râul Tiber', 'Râul Arno', 'Râul Adige']);
  String answer86 = jsonEncode(['Sicilia', 'Sardinia', 'Capri', 'Elba']);
  String answer87 = jsonEncode([
    'Insulele Baleare',
    'Insulele Canare',
    'Insulele Ionice',
    'Insulele Pelagie'
  ]);
  String answer88 =
      jsonEncode(['Matterhorn', 'Mont Blanc', 'Monte Rosa', 'Gran Paradiso']);
  String answer89 = jsonEncode(['Veneția', 'Roma', 'Florența', 'Napoli']);
  String answer90 = jsonEncode(
      ['Râpa Verde', 'Râpa Mare', 'Râpa Bâlca', 'Râpa Mare di Sasso']);
  String answer91 = jsonEncode(
      ['Lacul Maggiore', 'Lacul Como', 'Lacul Garda', 'Lacul Trasimeno']);
  String answer92 = jsonEncode(['Vezuviu', 'Etna', 'Stromboli', 'Vulcano']);
  String answer93 = jsonEncode(['Toscana', 'Piemont', 'Sicilia', 'Veneto']);
  String answer94 = jsonEncode([
    'Leonardo da Vinci',
    'Dante Alighieri',
    'Giuseppe Garibaldi',
    'Michelangelo'
  ]);
  String answer95 = jsonEncode(['Florența', 'Milano', 'Napoli', 'Roma']);
  String answer96 = jsonEncode(
      ['Evul Mediu', 'Antichitatea', 'Renașterea', 'Secolul al XX-lea']);
  String answer97 = jsonEncode(
      ['Perioada Napoleonică', 'Evul Mediu', 'Renașterea', 'Antichitatea']);
  String answer98 = jsonEncode([
    'Descoperirea Americii',
    'Războaiele napoleoniene',
    'Participarea la Puterile Aliate',
    'Războaiele Punic'
  ]);
  String answer99 =
      jsonEncode(['Van Gogh', 'Michelangelo', 'Pablo Picasso', 'Rembrandt']);
  String answer100 = jsonEncode([
    'Războaiele medievale',
    'Războaiele napoleoniene',
    'Unificarea Italiei',
    'Războiul Rece'
  ]);
  String answer101 = jsonEncode([
    'A rămas neutră',
    'A luptat de partea Puterilor Centrale',
    'A luptat de partea Puterilor Aliate',
    'A sprijinit efortul de război al Rusiei'
  ]);
  String answer102 = jsonEncode([
    'Teritorii câștigate',
    'Dezvoltare economică rapidă',
    'Nemulțumire și instabilitate politică',
    'Alianțe puternice cu alte țări'
  ]);
  String answer103 = jsonEncode([
    'Franța și Spania',
    'Republica Venețiană și Ducatul Milano',
    'Germania și Austria',
    'Anglia și Scoția'
  ]);
  String answer104 = jsonEncode(['1492', '1815', '1871', '1945']);
  String answer105 = jsonEncode([
    'În secolul al V-lea î.Hr.',
    'În secolul al VII-lea d.Hr.',
    'În secolul al XVIII-lea d.Hr.',
    'În secolul al XIX-lea î.Hr.'
  ]);
  String answer106 = jsonEncode(
      ['Julius Caesar', 'Attila Hunul', 'Cleopatra', 'Alexandru cel Mare']);
  String answer107 = jsonEncode([
    'Perioada napoleoniană',
    'Evul Mediu',
    'Secolul al XIX-lea',
    'După Primul Război Mondial'
  ]);
  String answer108 = jsonEncode([
    'Câștigarea de teritorii noi',
    'Contracararea influenței germane',
    'Susținerea Austro-Ungariei',
    'Pacea și stabilitatea regională'
  ]);
  String answer109 = jsonEncode(
      ['Alpii Orientali', 'Sahara', 'Peninsula Arabică', 'Insulele Britanice']);
  String answer110 = jsonEncode([
    'În secolul al XVIII-lea',
    'În secolul al XIX-lea',
    'În secolul al XX-lea',
    'În secolul al XXI-lea'
  ]);
  String answer111 = jsonEncode([
    'Shakespeare',
    'Napoleon Bonaparte',
    'Dante Alighieri',
    'Albert Einstein'
  ]);
  String answer112 = jsonEncode([
    'Bucătăria și modă',
    'Artă și arhitectură',
    'Muzică și teatru',
    'Toate variantele de mai sus'
  ]);
  String answer113 = jsonEncode(['Toscana', 'Piemont', 'Sicilia', 'Veneto']);
  String answer114 =
      jsonEncode(['Shanghai', 'Beijing', 'Guangzhou', 'Hong Kong']);
  String answer115 =
      jsonEncode(['Mont Everest', 'Kilimanjaro', 'Matterhorn', 'Aconcagua']);
  String answer116 = jsonEncode(['Nilul', 'Yangtze', 'Amazon', 'Mississippi']);
  String answer117 = jsonEncode(['Alpii', 'Himalaya', 'Andes', 'Munții Urali']);
  String answer118 = jsonEncode([
    'Colosseumul',
    'Marele Zid Chinezesc',
    'Piramidele din Egipt',
    'Stonehenge'
  ]);
  String answer119 = jsonEncode(['Xi\'an', 'Guangzhou', 'Shenzhen', 'Chengdu']);
  String answer120 = jsonEncode(['Tibet', 'Hong Kong', 'Macau', 'Xinjiang']);
  String answer121 = jsonEncode(['Yangtze', 'Huang He', 'Mekong', 'Indus']);
  String answer122 =
      jsonEncode(['Tropicală', 'Temperată', 'Arctică', 'Dezertică']);
  String answer123 = jsonEncode(['Beijing', 'Shanghai', 'Xi\'an', 'Guangzhou']);
  String answer124 = jsonEncode(['Wuhan', 'Shenzhen', 'Chongqing', 'Chengdu']);
  String answer125 =
      jsonEncode(['Alpii', 'Tian Shan', 'Himalaya', 'Munții Carpați']);
  String answer126 = jsonEncode(['Beijing', 'Hangzhou', 'Xi\'an', 'Shanghai']);
  String answer127 = jsonEncode(['Tibet', 'Xinjiang', 'Suzhou', 'Macau']);
  String answer128 = jsonEncode(['Hainan', 'Taiwan', 'Shikoku', 'Jeju']);
  String answer129 =
      jsonEncode(['Munții Tian', 'Munții Altai', 'Munții Carpați', 'Himalaya']);
  String answer130 =
      jsonEncode(['Alpii', 'Munții Tian', 'Munții Altai', 'Munții Qinling']);
  String answer131 = jsonEncode(['Yunnan', 'Shanghai', 'Tibet', 'Gobi']);
  String answer132 = jsonEncode(['Xi\'an', 'Beijing', 'Nanjing', 'Hangzhou']);
  String answer133 = jsonEncode(['Shanghai', 'Sichuan', 'Guangdong', 'Fujian']);
  String answer134 = jsonEncode([
    'Epoca de Aur a Chinei',
    'Perioada de Cincisprezece State',
    'Dinastia Zhou',
    'Epoca de Glorie a Hanului'
  ]);
  String answer135 = jsonEncode(
      ['Dinastia Han', 'Dinastia Tang', 'Dinastia Qin', 'Dinastia Song']);
  String answer136 = jsonEncode(
      ['Dinastia Han', 'Dinastia Tang', 'Dinastia Yuan', 'Dinastia Ming']);
  String answer137 = jsonEncode(
      ['Imperiul Ming', 'Imperiul Tang', 'Imperiul Yuan', 'Imperiul Qing']);
  String answer138 = jsonEncode([
    'Epoca de Aur a Chinei',
    'Perioada de Cincisprezece State',
    'Dinastiile Tang și Song',
    'Perioada Statelor Combatante'
  ]);
  String answer139 = jsonEncode([
    'Războiul Coreean și Războiul Vietnamului',
    'Războaiele Napoleonice și Războiul Civil American',
    'Războaiele Opiumului și Războiul Sino-Japonez',
    'Războaiele Mondiale I și II'
  ]);
  String answer140 = jsonEncode([
    'Tratatul de la Versailles - China a câștigat autonomia',
    'Tratatul de la Nanking - Deschiderea porturilor și concesiuni teritoriale',
    'Tratatul de la Trianon - China a devenit stat tampon între imperiile vecine',
    'Tratatul de la Brest-Litovsk - China a primit despăgubiri de război'
  ]);
  String answer141 = jsonEncode([
    'Dinastia Qing - a căzut în 1912',
    'Dinastia Tang - a căzut în 618',
    'Dinastia Ming - a căzut în 1644',
    'Dinastia Han - a căzut în 220 î.Hr.'
  ]);
  String answer142 = jsonEncode(
      ['Sun Yat-sen', 'Mao Zedong', 'Deng Xiaoping', 'Chiang Kai-shek']);
  String answer143 = jsonEncode([
    '1958 - liderul a fost Zhou Enlai',
    '1911 - liderul a fost Sun Yat-sen',
    '1949 - liderul a fost Mao Zedong',
    '1976 - liderul a fost Deng Xiaoping'
  ]);
  String answer144 = jsonEncode(
      ['Mao Zedong', 'Sun Yat-sen', 'Deng Xiaoping', 'Chiang Kai-shek']);
  String answer145 = jsonEncode([
    'Prin adoptarea unei economii socialiste planificate',
    'Prin restricționarea comerțului exterior',
    'Prin introducerea reformelor de piață și deschiderea către investiții străine',
    'Prin renunțarea la comerțul internațional'
  ]);
  String answer146 = jsonEncode([
    'Economie puternică, tehnologie avansată, domnia imperială',
    'Artă tradițională, influență culturală, agricultură intensivă',
    'Economie în creștere rapidă, tehnologie avansată, influență globală în comerț și politică',
    'Rezerve naturale bogate, arhitectură antică, industrie textilă'
  ]);
  String answer147 = jsonEncode([
    'Filosofia, religia, tehnologia',
    'Literatura, arhitectura, agricultura',
    'Muzica, dansul, gastronomia',
    'Filosofia, literatura, arta și arhitectura'
  ]);
  String answer148 =
      jsonEncode(['Qin Shi Huang', 'Sun Yat-sen', 'Confucius', 'Mao Zedong']);
  String answer149 = jsonEncode(['Beijing', 'Shanghai', 'Xi\'an', 'Nanjing']);
  String answer150 = jsonEncode(
      ['Dinastia Ming', 'Dinastia Qing', 'Dinastia Han', 'Dinastia Tang']);
  String answer151 = jsonEncode(
      ['Sun Yat-sen', 'Mao Zedong', 'Qiú Jǐguāng', 'Chiang Kai-shek']);
  String answer152 = jsonEncode([
    'Revoluția Culturală',
    'Revolta Boxerilor',
    'Proclamarea Republicii Populare Chineze',
    'Tratatul de la Nanking'
  ]);
  String answer153 = jsonEncode([
    '"Marș spre socialism"',
    '"Calea chineză către modernizare"',
    '"Economie de piață, socialism cu caracteristici chinezești"',
    '"Revoluția Culturală"'
  ]);
  String answer154 = jsonEncode([
    'Nord: Canada; Sud: Brazilia; Est: Marea Atlantică; Vest: Oceanul Pacific',
    'Nord: Mexic; Sud: Canada; Est: Oceanul Atlantic; Vest: Oceanul Pacific',
    'Nord: Canada; Sud: Mexic; Est: Oceanul Atlantic; Vest: Oceanul Pacific',
    'Nord: Alaska; Sud: Florida; Est: Marea Atlantică; Vest: Oceanul Pacific'
  ]);
  String answer155 = jsonEncode(
      ['Los Angeles', 'Washington, D.C', 'New York City', 'Chicago']);
  String answer156 = jsonEncode([
    'Parcul Național Yellowstone',
    'Munții Stâncoși',
    'Râul Mississippi',
    'Deșertul Sonora'
  ]);
  String answer157 = jsonEncode([
    'Râul Amazon și Râul Nil',
    'Râul Thames și Râul Sena',
    'Râul Mississippi și Râul Missouri',
    'Râul Volga și Râul Dunărea'
  ]);
  String answer158 = jsonEncode([
    'Este o sursă majoră de energie electrică',
    'Asigură irigarea culturilor agricole din Midwest',
    'Este o importantă rută comercială și de transport',
    'Este cunoscut pentru peisajele spectaculoase din jurul său'
  ]);
  String answer159 = jsonEncode([
    'Munți, câmpii și regiuni de coastă',
    'Deșerturi și munți vulcanici',
    'Tundră și păduri de conifere',
    'Platouri și canioane adânci'
  ]);
  String answer160 = jsonEncode([
    'Sunt centre culturale și artistice',
    'Asigură majoritatea resurselor naturale ale țării',
    'Fac parte din sistemul de transport naval și sunt importante pentru comerțul exterior',
    'Sunt cunoscute pentru arhitectura lor istorică'
  ]);
  String answer161 = jsonEncode([
    'Dallas, Las Vegas, Denver',
    'Seattle, Boston, Philadelphia',
    'Miami, New Orleans, San Diego',
    'Atlanta, Detroit, Phoenix'
  ]);
  String answer162 = jsonEncode([
    'Clima tropicală, subtropicală și arctică',
    'Clima temperată, aridă și subarctică',
    'Clima temperată, subtropicală și deșertică',
    'Clima temperată, subtropicală și tropicală'
  ]);
  String answer163 = jsonEncode([
    'Parcul Național Yellowstone și Parcul Național Yosemite',
    'Parcul Național Everglades și Parcul Național Grand Canyon',
    'Parcul Național Zion și Parcul Național Denali',
    'Parcul Național Rocky Mountain și Parcul Național Acadia'
  ]);
  String answer164 = jsonEncode([
    'Sunt bogate în resurse minerale',
    'Găzduiesc cele mai mari orașe industriale ale țării',
    'Sunt cruciale pentru comerțul maritim și turismul',
    'Asigură majoritatea producției agricole a SUA'
  ]);
  String answer165 = jsonEncode([
    'Alaska și Hawaii',
    'Puerto Rico și Insulele Virgine Americane',
    'Guam și Samoa Americană',
    'Alaska și Puerto Rico'
  ]);
  String answer166 = jsonEncode([
    'Este constant pe întreg teritoriul SUA',
    'Este mai rece în partea de sud și mai cald în partea de nord',
    'Variază de la nord la sud și de la est la vest, având regiuni temperate, subtropicale și tropicale',
    'Este influențat doar de apropierea de oceane și mări'
  ]);
  String answer167 = jsonEncode([
    'Munții Stâncoși',
    'Fluviul Mississippi',
    'Munții Apalași',
    'Marea de Est'
  ]);
  String answer168 = jsonEncode([
    'Texas și Florida',
    'Arizona și Nevada',
    'California și Oregon',
    'Alaska și Maine'
  ]);
  String answer169 = jsonEncode([
    'Este un ocean în vestul SUA',
    'Este un lac mare în estul SUA',
    'Este un golf important pe coasta estică a SUA',
    'Este o zonă de ținuturi mlăștinoase în SUA'
  ]);
  String answer170 = jsonEncode(
      ['Elefanți africani', 'Urs grizzly', 'Canguri', 'Tigri bengalezi']);
  String answer171 =
      jsonEncode(['Montana', 'California', 'Colorado', 'Wyoming']);
  String answer172 = jsonEncode([
    'Paella și sushi',
    'Taco și sushi',
    'Burger și pizza',
    'Curry și sushi'
  ]);
  String answer173 = jsonEncode([
    'Guam și Samoa Americană',
    'Alaska și Guam',
    'Insulele Virgine Americane și Samoa Americană',
    'Puerto Rico și Insulele Virgine Americane'
  ]);
  String answer174 = jsonEncode([
    'Munții',
    'Fluviul',
    'Marea',
    'Regiunea',
    'Carpați',
    'Dunărea',
    'Neagră',
    'Moldova'
  ]);
  String answer175 = jsonEncode(['Zagreb', 'Budapesta', 'București', 'Paris']);
  String answer177 = jsonEncode(['Volga', 'Dunărea', 'Rin', 'Sena']);
  String answer178 =
      jsonEncode(['Cluj-Napoca', 'Timișoara', 'Sofia', 'București']);
  String answer179 =
      jsonEncode(['Moldoveanu', 'Negoiu', 'Făgăraș', 'Pietrosu']);
  String answer180 = jsonEncode([
    'Temperat Oceanică',
    'Mediteraneană',
    'Polară',
    'Temperat Continentală'
  ]);
  String answer181 = jsonEncode(['Calde', 'Temperate', 'Reci', 'Foarte calde']);
  String answer182 = jsonEncode(
      ['Europa Centrală', 'Europa de Vest', 'Europa de Nord', 'Europa de Est']);
  String answer183 =
      jsonEncode(['Transilvania', 'Moldova', 'Catalonia', 'Maramureș']);
  String answer184 = jsonEncode(['Ungaria', 'Spania', 'Bulgaria', 'Ucraina']);
  String answer185 = jsonEncode(['Făgăraș', 'Carpați', 'Apuseni', 'Alpi']);
  String answer186 =
      jsonEncode(['Constanța', 'Cluj-Napoca', 'București', 'Timișoara']);
  String answer187 = jsonEncode([
    'În curs de dezvoltare',
    'Dezvoltată',
    'Subdezvoltată',
    'Super dezvoltată'
  ]);
  String answer188 = jsonEncode(
      ['Munții Apalași', ' Munții Făgăraș', 'Munții Apuseni', 'Munții Ciucaș']);
  String answer189 = jsonEncode([
    'Peisaje montane',
    'Sate Tradiționale',
    ' Infrastructură dezvoltată ',
    'Fauna sălbatică'
  ]);
  String answer190 =
      jsonEncode(['București', 'Munții Carpați', 'Dunărea', 'Cluj-Napoca']);
  String answer191 =
      jsonEncode(['Munții Carpați', 'Marea Neagră', 'Dunărea', 'Iași']);
  String answer192 =
      jsonEncode(['Dunărea', 'Marea Neagră', 'Munții Carpați', 'Iași']);
  String answer193 = jsonEncode(['LAIA', 'NATO', 'NAFTA', 'MERCOSUR']);
  String answer194 = jsonEncode(['Unguri', 'Daci', 'Egipteni', 'Celți']);
  String answer195 = jsonEncode([
    'Imperiul Otoman',
    'Imperiul Roman',
    'Imperiul Mongol',
    'Imperiul Babilonian'
  ]);
  String answer196 = jsonEncode(['Moscova', 'Saxonia', 'Moldova', 'Toscana']);
  String answer197 = jsonEncode([
    'Marea',
    'Uniunea',
    'Vlad',
    'Țara',
    'Unire',
    'Sovietică',
    'Țepeș',
    'Românească'
  ]);
  String answer198 =
      jsonEncode(['Democrată', 'Comunistă', 'Totalitară', 'Fascistă']);
  String answer199 = jsonEncode(['2004', '2007', '2010', '1997']);
  String answer200 = jsonEncode(
      ['Traian Băsescu', 'Klaus Iohannis', 'Emil Boc', 'Nicolae Ceaușescu']);
  String answer201 = jsonEncode([
    'Nicolae Titulescu',
    'Iancu de Hunedoara',
    'Ștefan Cel Mare',
    'Alexandru Ioan Cuza'
  ]);
  String answer202 = jsonEncode(['Axei', 'Aliații', 'Otomanii', 'Chinezii']);
  String answer203 = jsonEncode([
    'Iliescu',
    'Constantinescu',
    'Nicolae Ceaușescu',
    'Gheorghe Ghiorghiu-Dej'
  ]);
  String answer204 = jsonEncode([
    'Războiul Civil Român',
    'Războiul de Independență',
    'Războiul Balcanic',
    'Războiul Crimeii'
  ]);
  String answer205 =
      jsonEncode(['Romanizare', 'Nivelare', 'Dacizare', 'Globalizare']);
  String answer206 = jsonEncode([
    'Nord: Canada; Sud: Brazilia; Est: Marea Atlantică; Vest: Oceanul Pacific',
    'Nord: Mexic; Sud: Canada; Est: Oceanul Atlantic; Vest: Oceanul Pacific',
    'Nord: Canada; Sud: Mexic; Est: Oceanul Atlantic; Vest: Oceanul Pacific',
    'Nord: Alaska; Sud: Florida; Est: Marea Atlantică; Vest: Oceanul Pacific'
  ]);
  String answer207 = jsonEncode(
      ['Los Angeles', 'Washington, D.C', 'New York City', 'Chicago']);
  String answer208 = jsonEncode([
    'Parcul Național Yellowstone',
    'Munții Stâncoși',
    'Râul Mississippi',
    'Deșertul Sonora'
  ]);
  String answer209 = jsonEncode([
    'Râul Amazon și Râul Nil',
    'Râul Thames și Râul Sena',
    'Râul Mississippi și Râul Missouri',
    'Râul Volga și Râul Dunărea'
  ]);
  String answer210 = jsonEncode([
    'Este o sursă majoră de energie electrică',
    'Asigură irigarea culturilor agricole din Midwest',
    'Este o importantă rută comercială și de transport',
    'Este cunoscut pentru peisajele spectaculoase din jurul său'
  ]);
  String answer211 = jsonEncode([
    'Clima tropicală, subtropicală și arctică',
    'Clima temperată, aridă și subarctică',
    'Clima temperată, subtropicală și deșertică',
    'Clima temperată, subtropicală și tropicală'
  ]);
  String answer212 = jsonEncode([
    'Doar populația khoikhoi',
    'Doar populația bantu',
    'Doar populația khoikhoi și bantu',
    'Populația khoikhoi, bantu și san'
  ]);
  String answer213 = jsonEncode(['În 1492', 'În 1652', 'În 1806', 'În 1910']);
  String answer214 = jsonEncode(
      ['F.W. de Klerk', 'Nelson Mandela', 'Paul Kruger', 'Jan van Riebeeck']);
  static final _databaseName = "MyDatabase.db";
  static final _databaseVersion = 76;

  static final table = 'country';
  static final tableTrophy = 'trophies';
  static final columnLesson = 'lesson';
  static final columnId = '_id';
  static final columnName = 'name';
  static final columnLessonGeography = 'lesson_geography';
  static final columnLessonHistory = 'lesson_history';
  static final columnGeographyCompleted = 'geography_completed';
  static final columnHistoryCompleted = 'history_completed';
  static final columnTrophyId = '_trophy_id';
  static final columnTrophy = 'trophy';
  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE trophies (
            $columnTrophyId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnTrophy INTEGER
          )''');

        await db.execute('''
          CREATE TABLE country (
            countryID INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            geographyLesson TEXT,
            historyLesson TEXT,
            geography_completed INTEGER,
            history_completed INTEGER,
            doesExist INTEGER
          )''');

        await db.execute('''
          CREATE TABLE question (
            questionID INTEGER PRIMARY KEY AUTOINCREMENT,
            country TEXT,
            subject INTEGER,
            difficulty INTEGER,
            question_text TEXT,
            answer TEXT,
            correct_answer INTEGER,
            type INTEGER
          )''');

        for (String country in countries) {
          insertCountry(country);
        }

        await db.execute('''
          CREATE TABLE profile (
            profileID INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT,
            picture INTEGER,
            iq INTEGER,
            trophies INTEGER,
            geography_lessons INTEGER,
            history_lessons INTEGER,
            dark_mode INTEGER,
            language INTEGER,
            admin INTEGER,
            coins INTEGER,
            streak_count INTEGER DEFAULT 0,
            last_activity_date TEXT,
            faces TEXT
          )''');

        db.insert('profile', {
          'username': 'username',
          'picture': 0,
          'iq': 0,
          'trophies': 0,
          'geography_lessons': 0,
          'history_lessons': 0,
          'dark_mode': 1,
          'language': 1,
          'admin': 0,
          'coins': 0,
          'streak_count': 0,
          'last_activity_date': DateTime.now().toIso8601String(),
          'faces': ''
        });

        await db.insert('country', {
          'name': 'Romania',
          'geographyLesson':
              'România este situată în partea de sud-est a Europei, având granițe cu Bulgaria, Serbia, Ungaria, Ucraina și Republica Moldova. Capitala sa, București, este cel mai mare oraș și principal centru cultural, economic și politic al țării. Cu o populație de aproximativ 19 milioane de locuitori, România este una dintre cele mai populate țări din Europa de Est. Teritoriul său este împărțit de Munții Carpați, care formează o barieră naturală ce separă țara în trei regiuni geografice distincte: Transilvania, Moldova și Maramureșul. Acești munți sunt adesea descrisi ca fiind inima României, oferind nu doar peisaje pitorești, ci și o sursă importantă de resurse naturale și biodiversitate. Dunărea, un fluviu navigabil vital, curge prin sudul țării, marcând granița naturală cu Bulgaria și oferind acces la Marea Neagră prin porturile Constanța și Mangalia. Acest aspect geografic a facilitat comerțul și interacțiunile culturale cu alte regiuni din Europa și din întreaga lume. În afară de București, alte orașe importante din România includ Cluj-Napoca, Timișoara, Iași și Constanța, fiecare cu propriile sale bogății culturale și economice. România este o țară în curs de dezvoltare, membră a Uniunii Europene și a NATO, cu o economie mixtă în care industria, agricultura și serviciile joacă roluri importante în creșterea sa economică. Cel mai înalt punct al României este vârful Moldoveanu din Munții Făgăraș, având o altitudine impresionantă de 2.544 de metri. Această înălțime oferă panorame spectaculoase și oportunități pentru alpinism și turism montan. Regiunile istorice ale României, cum ar fi Transilvania, cunoscută pentru peisajele sale montane și orașele istorice, Moldova, renumită pentru siturile sale istorice și moștenirea culturală bogată, și Maramureșul, cu peisajele sale rurale și tradițiile autentice, adaugă unicitate și diversitate acestei țări. Clima României este temperată continentală, cu veri călduroase și ierni reci, fiind influențată de Munții Carpați și de Marea Neagră. Această varietate climatică oferă condiții favorabile pentru o gamă diversă de activități, de la sporturile de iarnă în Carpați până la relaxare la malul Mării Negre în timpul verii.',
          'historyLesson':
              'Într-un colț al Europei, se întinde o țară plină de istorie și tradiție numită România. În vremurile străvechi, teritoriul României era locuit de daci, un popor mândru și cu o cultură bogată. În anul 106 d.Hr., Imperiul Roman a cucerit acest teritoriu, începând procesul de romanizare. Această interacțiune între daci și romani a lăsat o amprentă puternică în identitatea românească, reflectată în limba, obiceiurile și tradițiile poporului. În perioada medievală, teritoriul românesc era împărțit în principate autonome, Moldova și Țara Românească. Sub conducerea domnitorilor lor, cum ar fi Ștefan cel Mare și Vlad Țepeș, aceste principate au luptat pentru independență și au rezistat presiunilor străine, stabilind bazele statelor românești. În secolul al XIX-lea, mișcarea națională a crescut semnificativ și a avut loc Unirea Principatelor Române în 1859, sub domnia lui Alexandru Ioan Cuza. Acest pas important a deschis calea pentru formarea României moderne. În 1877, România și-a proclamat independența față de Imperiul Otoman și a participat la Războiul de Independență, consolidându-și statutul de națiune suverană. Între cele două războaie mondiale, România a experimentat perioade de instabilitate politică și progres economic. În 1918, a avut loc Marea Unire între Transilvania, Moldova și Țara Românească. Totuși, în timpul celui de-al Doilea Război Mondial, țara a fost ocupată de trupele Axei, iar după război, a devenit un stat satelit al Uniunii Sovietice. În 1947, România a devenit o republică comunistă sub conducerea lui Gheorghe Gheorghiu-Dej și apoi a lui Nicolae Ceaușescu. Regimul comunist a fost caracterizat de opresiune politică și o stagnare economică. Totuși, în decembrie 1989, Revoluția Română a dus la căderea regimului comunist și la instaurarea democrației în țară. După Revoluție, România a trecut printr-o perioadă de tranziție dificilă către economia de piață și democrație. În 2007, România a devenit membru al Uniunii Europene, consolidându-și angajamentul față de valorile democratice și integrarea europeană.',
          'geography_completed': 0,
          'history_completed': 0,
          'doesExist': 1
        });

        await db.insert('country', {
          'name': 'Spain',
          'geographyLesson':
              'Spania este situată în partea de sud-vest a Europei, având granițe cu Franța la nord și nord-est, Portugalia la vest și Andorra și Gibraltar la sud. Capitala sa, Madrid, este cel mai mare oraș și centrul cultural, economic și politic al țării. Cu o populație de aproximativ 47 de milioane de locuitori, Spania este una dintre cele mai populate țări din Europa. Teritoriul său este caracterizat de o mare varietate geografică, cuprinzând zone montane, câmpii, și țărmuri maritime. Munții Pirinei formează granița nordică a țării, oferind peisaje montane spectaculoase și oportunități pentru sporturi de iarnă. În centrul și sudul Spaniei se află o serie de lanțuri muntoase, cum ar fi Munții Cantabrici, Munții Centrali și Munții Betici, care influențează climatul și geografia regiunilor respective. De asemenea, Spania are o rețea vastă de râuri, precum Ebro, Tagus și Guadalquivir, care contribuie la fertilitatea câmpiilor și la dezvoltarea agriculturii. Un aspect geografic semnificativ al Spaniei este Peninsula Iberică, care include și Portugal, și este înconjurată de Oceanul Atlantic și Marea Mediterană. Această poziție strategică a facilitat comerțul maritim și a adus influențe culturale diverse de-a lungul istoriei. În plus față de Madrid, alte orașe importante din Spania includ Barcelona, Valencia, Sevilla și Bilbao, fiecare având caracteristici geografice și culturale distincte. Spania este o destinație turistică populară datorită plajelor sale mediteraneene, orașelor istorice și peisajelor naturale variate. Cel mai înalt vârf din Spania este vârful Teide din Insulele Canare, având o altitudine de 3.718 metri. Acest vârf vulcanic oferă oportunități pentru explorare și turism ecologic într-un mediu unic. Clima Spaniei variază de la mediteraneană în sud la temperată în nord, iar influențele oceanice și continentale se resimt în diferite regiuni ale țării. Această diversitate climatică oferă condiții favorabile pentru o gamă largă de activități în aer liber și agricultură. Spania include mai multe arhipelaguri importante, cum ar fi Insulele Baleare în Marea Mediterană și Insulele Canare în Oceanul Atlantic. Insulele Baleare, printre care se numără Mallorca, Menorca, Ibiza și Formentera, sunt cunoscute pentru plajele lor frumoase, apele cristaline și viața de noapte vibrantă. Aceste insule sunt o destinație populară pentru turiști din întreaga lume, oferind o varietate de activități recreative și culturale. Insulele Canare, situate în largul coastelor africane, sunt formate din țapuscă vulcanică și oferă un peisaj spectaculos și diversitate ecologică. Insula Tenerife este cunoscută pentru vârful său vulcanic Teide, iar Gran Canaria pentru dunele sale de nisip și pentru viața sa maritimă bogată.',
          'historyLesson':
              'În sud-vestul Europei, se află o țară cu o moștenire istorică bogată numită Spania. În antichitate, teritoriul spaniol era locuit de popoare precum ibero-geții și celtiberii, care au fost ulterior colonizați de romani, contribuind la formarea provinciei romane Hispania. În Evul Mediu, Spania a fost împărțită în numeroase regate și taifas, fiecare cu propria lor cultură și identitate. Printre cele mai importante regate se numărau Regatul Castiliei, Regatul Aragonului și Regatul Navarrei. În această perioadă, au existat și perioade de coabitare și conflicte între creștini, musulmani și evrei, evidențiind diversitatea religioasă și culturală a peninsulei iberice. În secolul al XV-lea, prin căsătoria regilor Ferdinand al II-lea al Aragonului și Isabela I a Castiliei, a fost creată o uniune între cele două regate, marcând începutul formării Spaniei moderne. Sub conducerea lor, a fost finalizată Reconquista, recucerirea teritoriilor musulmane din Spania, iar în 1492 a fost semnat decretul de expulzare a evreilor și a maurilor, consolidând controlul catolic asupra regatului. Perioada cuceririi și colonizării Americii de către spanioli a adus Spaniei o mare bogăție și putere în secolele XVI-XVII. Această epocă a fost marcată de mari exploratori și cuceritori precum Cristofor Columb, Hernán Cortés și Francisco Pizarro, care au extins influența spaniolă în întreaga lume. În secolul al XIX-lea, Spania a fost implicată în numeroase conflicte interne și externe, inclusiv Războiul Peninsular împotriva armatelor lui Napoleon și pierderea majorității coloniilor sale americane în urma războaielor de independență din America Latină. În secolul al XX-lea, Spania a fost martoră a unor perioade de instabilitate politică, inclusiv dictatura lui Francisco Franco între 1939 și 1975. După moartea sa, Spania a trecut printr-o tranziție către democrație, culminând cu adoptarea unei constituții democratice în 1978. În prezent, Spania este o monarhie parlamentară și membru al Uniunii Europene, având o economie diversificată și o moștenire culturală și istorică impresionantă.',
          'geography_completed': 0,
          'history_completed': 0,
          'doesExist': 1
        });

        await db.insert('country', {
          'name': 'France',
          'geographyLesson':
              'Geografia Franței oferă o diversitate remarcabilă, cuprinzând regiuni montane, câmpii fertile și litorale spectaculoase. Situată în partea de vest a Europei, Franța se învecinează cu Spania la sud-vest, Belgia și Luxemburg la nord-est, Germania și Elveția la est, Italia la sud-est și Marea Mediterană la sud. Capitala Franței, Parisul, este unul dintre cele mai mari centre culturale și economice ale lumii, cunoscut pentru atracțiile sale turistice remarcabile, precum Turnul Eiffel, Catedrala Notre-Dame și Muzeul Luvru. Cu o populație de aproximativ 67 de milioane de locuitori, Franța este una dintre cele mai populate țări din Europa. Relieful Franței este variat și spectaculos. Munții Alpi se întind în partea de sud-est a țării, marcând granița cu Italia, și includ cel mai înalt vârf al Franței, Mont Blanc, cu o altitudine de 4.810 metri. În partea sud-vestică, Munții Pirinei formează o graniță naturală cu Spania, oferind peisaje montane impresionante și facilitând activități sportive precum schiul și alpinismul. În nordul Franței se găsesc Câmpiile Nordului și Câmpiile Loarei, regiuni fertile care susțin o agricultură bogată și diverse industrii. De asemenea, Franța este traversată de numeroase râuri importante, cum ar fi Sena, Loara și Rhone, care au avut un impact semnificativ asupra dezvoltării sale economice și culturale. Franța este recunoscută și pentru coasta sa pitorească, care se întinde de-a lungul Mării Mediterane și a Oceanului Atlantic. Riviera Franceză, situată în sud-estul țării, este cunoscută pentru stațiunile sale de lux și plajele frumoase, în timp ce Bretania, în nord-vest, este faimoasă pentru peisajele sale sălbatice și stâncile impresionante. În afară de Paris, alte orașe importante din Franța includ Lyon, Marsilia, Bordeaux și Strasbourg, fiecare având propria sa identitate culturală și atracții distincte. Franța este, de asemenea, renumită pentru vinurile sale fine, gastronomia rafinată și cultura bogată. Clima Franței variază de la mediteraneană în sud la temperată în nord, cu influențe oceanice și continentale. Această diversitate climatică permite dezvoltarea unei game variate de culturi agricole și susține turismul pe tot parcursul anului.',
          'historyLesson':
              'Istoria Franței este una dintre cele mai fascinante din Europa, începând cu antichitatea și ajungând până în prezent. În acele vremuri îndepărtate, teritoriul francez era populat de triburi celtice și galice, iar apoi a fost colonizat de romani, formând provincia romană Gallia. Evul Mediu a adus feudalismul și fragmentarea țării în regate și principate, precum Regatul Franciei și Ducatul Normandiei. În secolul al XV-lea, Franța a început să se consolideze sub conducerea lui Ludovic al XI-lea, marcând începutul formării Franței moderne. Revolutia Franceză din 1789 a pus capăt monarhiei și a instaurat o republică, urmată de perioada Napoleonică care a adus expansiune teritorială și influență sub conducerea lui Napoleon Bonaparte. Secolul al XIX-lea a fost plin de schimbări și conflicte majore, inclusiv Războiul Franco-Prusac și instaurarea celei de-a Treia Republici în 1870. Secolul al XX-lea a fost marcat de cele două războaie mondiale și ocupația nazistă între 1940 și 1944. După Al Doilea Război Mondial, Franța a fost una dintre puterile fondatoare ale Uniunii Europene și a cunoscut procesul de decolonizare, pierzând majoritatea coloniilor sale în Africa și Asia. Astăzi, Franța rămâne una dintre cele mai importante și influente țări din lume, cu o economie diversificată, un sistem politic stabil și o moștenire culturală și artistică bogată. Gastronomia franceză este renumită la nivel mondial, iar arta și arhitectura sa impresionantă atrag milioane de turiști în fiecare an. Contribuțiile sale în domenii precum știința, tehnologia și literatura continuă să influențeze lumea modernă, consolidând statutul Franței ca una dintre marile puteri ale secolului XXI.',
          'geography_completed': 0,
          'history_completed': 0,
          'doesExist': 1
        });

        await db.insert('country', {
          'name': 'United States',
          'geographyLesson':
              'Statele Unite ale Americii (SUA), una dintre cele mai mari și influente țări din lume, se află în America de Nord, având granițe cu Canada la nord și Mexic la sud. Capitala sa este Washington, D.C., iar New York City este un important centru cultural, economic și financiar. Teritoriul SUA este extrem de divers, cuprinzând munți, câmpii, deșerturi și regiuni de coastă. La vest se găsesc Munții Stâncoși, iar la est se întinde Marea de Est. La sud se află Deșertul Sonora, iar la nord-vest se întinde Podișul Columbia. Aceste caracteristici geografice influențează clima și economia țării. Râurile majore, cum ar fi Mississippi și Missouri, traversează SUA, furnizând resurse naturale și fiind vitale pentru transportul intern. Mississippi este unul dintre cele mai lungi râuri din lume și a avut o mare importanță în dezvoltarea istorică și economică a țării. O caracteristică geografică iconică a SUA o reprezintă Parcul Național Yellowstone, situat în statul Wyoming, care găzduiește gheizere, izvoare termale și o varietate de faună sălbatică. Printre speciile de animale emblemă din Parcul Național Yellowstone se numără ursul grizzly, care este considerat un simbol al sălbăticiei și al puterii naturii. Ursul grizzly poate fi întâlnit în diferite părți ale parcului, căutând hrană în zonele împădurite sau de-a lungul cursurilor de apă. SUA are și o coastă extinsă, cu orașe maritime importante precum Los Angeles, San Francisco și Miami. Aceste orașe portuare au jucat un rol crucial în dezvoltarea comerțului maritim și a economiei americane. În plus față de Washington, D.C. și New York City, alte orașe importante din SUA includ Los Angeles, Chicago și Houston, fiecare având caracteristici geografice și culturale distincte. SUA este o destinație turistică populară datorită diversității sale culturale, a parcurilor naționale și a orașelor vibrante. Clima SUA variază considerabil de la nord la sud și de la est la vest, cu regiuni temperate, deșertice și subtropicale. În nord-est, iernile sunt reci și zăpădite, în timp ce în sud-vest verile sunt fierbinți și uscate. SUA include și mai multe teritorii în afara continentului principal, cum ar fi Hawaii și Puerto Rico, care oferă peisaje spectaculoase și culturi diverse. SUA este cunoscută pentru diversitatea sa culinară, cu influențe din întreaga lume, inclusiv mâncăruri tradiționale precum burgeri, pizza și friptură, dar și specialități regionale cum ar fi gumbo din Louisiana și sushi din California',
          'historyLesson':
              'Înaintea colonizării europene, teritoriul actual al Statelor Unite era locuit de populații amerindiene diverse, care aveau culturi și societăți variate. Cu sosirea exploratorilor europeni în secolul al XVI-lea, începe procesul de colonizare a Americii de Nord. În secolul al XVIII-lea, coloniile britanice din America de Nord au luptat pentru independență împotriva coroanei britanice. Declarația de Independență a fost adoptată în 1776, marcând începutul Statelor Unite ale Americii ca națiune independentă. În secolul al XIX-lea, Statele Unite au experimentat o extindere teritorială masivă spre vest, într-un proces cunoscut sub numele de "Manifest Destiny". Însă, această expansiune a alimentat tensiuni între statele slave și cele non-slave, culminând în Războiul Civil American (1861-1865), care a fost luptat între statele care susțineau sclavia și cele care se opuneau ei. După Războiul Civil, Statele Unite au cunoscut o perioadă de industrializare rapidă și dezvoltare economică. În secolul al XX-lea, ele au devenit una dintre cele mai puternice și influente națiuni din lume, jucând un rol major în ambele războaie mondiale și devenind un pilon al economiei globale. Prohibiția a fost perioada în care producția, distribuția și consumul de alcool au fost interzise prin lege în întreaga țară, între anii 1920 și 1933. Această politică a fost implementată prin adoptarea celui de-al 18-lea amendament la Constituția SUA în 1919 și prin Legea Volstead. În prezent, Statele Unite rămân o putere economică și militară dominantă, dar se confruntă cu o serie de provocări interne și internaționale, inclusiv inegalitatea economică, schimbările climatice și tensiunile geopolitice. Cu toate acestea, diversitatea sa culturală, inovația și angajamentul față de valorile democratice continuă să definească națiunea și să inspire lumea.',
          'geography_completed': 0,
          'history_completed': 0,
          'doesExist': 1
        });

        await db.insert('country', {
          'name': 'Italy',
          'geographyLesson':
              'Italia este situată în partea de sud a Europei, având granițe cu Franța la nord-vest, Elveția și Austria la nord și nord-est, Slovenia la nord-est și Croația la est. Capitala sa, Roma, este cel mai mare oraș și centrul cultural, istoric și politic al țării. Cu o populație de aproximativ 60 de milioane de locuitori, Italia este una dintre cele mai populate țări din Europa. Teritoriul său este caracterizat de o varietate geografică remarcabilă, cuprinzând munți, câmpii și țărmuri maritime. Munții Alpi formează granița nordică a țării, oferind peisaje alpine spectaculoase și oportunități pentru sporturi de iarnă. În centrul Italiei se află o serie de lanțuri muntoase, cum ar fi Apeninii, care se întind pe aproape toată lungimea peninsulei italiene și influențează climatul și geografia regiunilor respective. De asemenea, Italia are o rețea extinsă de râuri, precum Po, Tevere și Arno, care contribuie la fertilitatea câmpiilor și la dezvoltarea agriculturii. Un aspect geografic semnificativ al Italiei este Peninsula Italică, care se întinde în Marea Mediterană și este înconjurată de mai multe insule, cum ar fi Sicilia și Sardinia. Această poziție strategică a favorizat comerțul maritim și a adus influențe culturale diverse de-a lungul istoriei. Vezuviul este un vulcan activ situat în apropierea orașului Napoli din regiunea Campania din sudul Italiei. Este cunoscut în special pentru erupția sa devastatoare din anul 79 d.Hr., care a dus la distrugerea orașelor Pompei și Herculaneum. Acest vulcan este considerat unul dintre cei mai periculoși din lume din cauza populației dense și a impactului potențial asupra orașelor înconjurătoare în cazul unei noi erupții majore. În plus față de Roma, alte orașe importante din Italia includ Milano, Napoli, Florența și Veneția, fiecare având caracteristici geografice și culturale distincte. Italia este o destinație turistică populară datorită orașelor istorice, artei și arhitecturii sale bogate și peisajelor naturale variate. Cel mai înalt vârf din Italia este vârful Mont Blanc din Alpii Graiei, având o altitudine de 4.808 metri. Acest vârf glaciar oferă oportunități pentru alpinism și turism ecologic într-un mediu spectaculos. Italia este cunoscută în întreaga lume pentru producția sa bogată și variată de vinuri. Regiunea Toscana, în special, este renumită pentru vinul Chianti, un vin roșu sec. Clima Italiei variază de la mediteraneană în sud la temperată în nord, iar influențele oceanice și continentale se resimt în diferite regiuni ale țării. Această diversitate climatică oferă condiții favorabile pentru o gamă largă de activități în aer liber și agricultură. Italia include și mai multe insule importante, cum ar fi Sicilia și Sardinia, care au peisaje spectaculoase și o istorie bogată.',
          'historyLesson':
              'În sudul Europei, se găsește o țară cu o istorie bogată și variată - Italia. În antichitate, peninsula italiană era locuită de diverse popoare precum etruscii, grecii și samniții, dar a devenit cunoscută mai ales prin cucerirea romană, care a dus la formarea Republicii Romane și apoi a Imperiului Roman. În Evul Mediu, Italia a fost divizată în numeroase state și republici independente, precum Republica Venețiană, Ducatul Milano, Republica Florentină și Statul Papal. Această perioadă a fost marcată de competiția între aceste entități pentru putere și control.În timpul Renașterii, Italia a fost epicentrul unui puternic mișcări culturale și artistice, marcând o perioadă de înflorire în domenii precum arta, arhitectura și literatura. Personalități precum Leonardo da Vinci, Michelangelo și Dante Alighieri au contribuit la reputația de centru cultural al Europei al Italiei. În secolele XVIII și XIX, Italia a fost scena unor conflicte și transformări politice importante, incluzând războaiele napoleoniene și procesul de unificare a Italiei sub conducerea lui Giuseppe Garibaldi și a lui Camillo Benso, conte de Cavour. Acest proces a dus la formarea statului italian modern, care a fost completat în 1871, când Roma a devenit capitala Italiei. În secolul al XX-lea, Italia a fost implicată în ambele războaie mondiale. În Primul Război Mondial, Italia s-a alăturat Puterilor Aliate în 1915, în speranța că ar obține teritorii promițătoare de la Puterile Centrale. Luptele au fost concentrate în principal pe frontul italian în Alpii Orientali și au implicat confruntări dure cu trupele austro-ungare. După război, Italia a fost dezamăgită de rezultatele Conferinței de Pace de la Paris, care nu a satisfăcut așteptările sale teritoriale. Această perioadă a generat nemulțumiri și instabilitate politică în Italia, pregătind terenul pentru ascensiunea fascismului. În 1957, Italia a fost una dintre țările fondatoare ale Comunității Economice Europene (CEE), precursorul Uniunii Europene, semnând Tratatul de la Roma. Astfel, Italia a fost implicată încă de la început în procesul de integrare europeană. Italia este cunoscută pentru peisajele sale pitorești, patrimoniul său istoric și cultural bogat, bucătăria sa renumită și contribuțiile sale la domenii precum moda și designul.',
          'geography_completed': 0,
          'history_completed': 0,
          'doesExist': 1
        });

        await db.insert('country', {
          'name': 'China',
          'geographyLesson':
              'China, una dintre cele mai mari țări din lume ca suprafață și populație, este situată în Asia de Est, având granițe cu mai multe țări importante precum Rusia și Mongolia la nord, India, Nepal și Bhutan la sud, și Coreea de Nord, Vietnam și Laos la sud-est. Capitala sa, Beijing, este un centru cultural, economic și politic major, iar Shanghai este unul dintre cele mai mari orașe din lume, fiind un important centru financiar și comercial. Teritoriul Chinei este caracterizat de o varietate geografică impresionantă, cuprinzând munți, câmpii și regiuni de coastă. La vest, munții Himalaya formează o graniță naturală, iar la sud-vest se găsesc Munții Tian, care includ cel mai înalt vârf din China, vârful Everest. În partea de nord se află Munții Altai, iar la est se întind Munții Qinling. Aceste lanțuri muntoase influențează în mod semnificativ clima și geografia țării. Râurile majore, precum Yangtze și Fluviul Galben, traversează China, furnizând apă pentru irigații și transportul naval. Yangtze este al treilea cel mai lung râu din lume și are o importanță culturală și economică semnificativă, cu orașe importante precum Chongqing și Wuhan aflate pe malurile sale. O caracteristică geografică distinctivă a Chinei o reprezintă Marele Zid, o structură masivă de apărare construită de-a lungul secolelor pentru a proteja imperiul chinez împotriva invaziilor din nord. Acest monument istoric impresionant este o atracție turistică de prim rang și simbolizează bogata istorie și cultura a Chinei. China are și o coastă extinsă, cu orașe portuare importante precum Hong Kong, Guangzhou și Shenzhen. Aceste regiuni au jucat un rol crucial în dezvoltarea comerțului maritim și a economiei chineze moderne. În plus față de Beijing și Shanghai, alte orașe importante din China includ Guangzhou, Chengdu și Xi an, fiecare având caracteristici geografice și culturale distincte. China este o destinație turistică populară datorită patrimoniului său cultural bogat, precum și peisajelor naturale variate, cum ar fi Muntele Huangshan și Yangshuo Karst. Clima Chinei variază considerabil de la nord la sud și de la est la vest, cu regiuni temperate, subtropicale și tropicale. În nord, iernile sunt reci și uscate, în timp ce în sud verile sunt calde și umede. China include și mai multe regiuni autonome, cum ar fi Tibetul și Xinjiang, care au peisaje spectaculoase și o diversitate culturală remarcabilă. China este, de asemenea, renumită pentru bogata sa istorie culinară și diversitatea sa gastronomică, care variază de la mâncăruri picante din Sichuan la delicatese din Shanghai și fructe de mare din Canton.',
          'historyLesson':
              'În Asia de Est, se află o țară cu o istorie străveche și fascinantă - China. De-a lungul mileniilor, China a fost locuită de diverse civilizații și culturi, iar evoluția sa istorică a fost marcată de momente semnificative și transformări profunde. În perioada antică, China a fost locuită de numeroase triburi și regate, dar unificarea sa sub o autoritate centrală a început sub Dinastia Qin, care a condus în secolul al III-lea î.Hr. Dinastia Qin a fost urmată de Dinastiile Han, Tang și Song, perioade de prosperitate și inovație în domenii precum știința, tehnologia și arta. În Evul Mediu, China a cunoscut o serie de dinastii și imperii, precum Yuan (fondată de mongoli), Ming și Qing. În timpul dinastiei Tang și Song, China a fost un centru comercial și cultural important, fiind cunoscută pentru invențiile sale tehnologice precum tiparul mobil și busola. În secolul al XIX-lea, China a fost afectată de agresiunea imperialistă și influența puterilor străine, ceea ce a dus la războaiele opiumului și la Tratatul de la Nanking, care a deschis porțile Chinei pentru comerțul străin și a impus concesiuni teritoriale. Această perioadă de slăbiciune a statului chinez a culminat cu Revolta boxerilor și căderea dinastiei Qing. În secolul XX, China a trecut printr-o serie de schimbări politice și sociale semnificative. Revoluția din 1911 a condus la căderea sistemului imperial și la fondarea Republicii Chineze sub conducerea lui Sun Yat-sen. În 1949, Partidul Comunist Chinez, condus de Mao Zedong, a proclamat înființarea Republicii Populare Chineze, punând capăt unui secol de dominație străină și instabilitate internă. De-a lungul deceniilor, China a traversat reforme economice și sociale masive sub conducerea lui Deng Xiaoping și a succesorilor săi, transformându-se dintr-o economie planificată într-una orientată către piață și devenind una dintre cele mai mari puteri economice din lume. Astăzi, China este cunoscută pentru tehnologia sa avansată, economia sa în creștere rapidă și influența sa globală în domenii precum comerțul internațional și politica mondială. Pe lângă aceste aspecte, China are o istorie culturală bogată, cu contribuții semnificative în domenii precum filosofia, literatura, arta și arhitectura.',
          'geography_completed': 0,
          'history_completed': 0,
          'doesExist': 1
        });

        await db.insert('country', {
          'name': 'Australia',
          'geographyLesson':
              'Australia, situată în emisfera sudică, este una dintre cele mai mari insule din lume și cea mai mare țară insulară. Cu o varietate de caracteristici geografice și regiuni distincte, Australia este un amestec captivant de peisaje și ecosisteme. Australia se învecinează cu Oceanul Indian și Marea Coralilor la vest și sud-vest, cu Oceanul Pacific la est și cu Marea Tasmaniei la sud-est. Nu are granițe terestre cu alte țări. Relieful Australiei este extrem de variat, cuprinzând munți, platouri, câmpii și deșerturi. Munții Great Dividing Range, care rulează de-a lungul coastei de est, sunt un element caracteristic și oferă peisaje spectaculoase. Clima din Australia variază de la aridă în interiorul deșertic al continentului până la temperată în regiunile de coastă și subtropicală în nord-est. Sezonul ploios în nord aduce precipitații abundente, în timp ce regiunile de coastă beneficiază de un climat mediteranean. Australia este bogată în resurse naturale, inclusiv minereuri, cărbune, aur, uraniu și petrol. De asemenea, dispune de o biodiversitate impresionantă, cu o varietate de specii de plante și animale, multe dintre ele endemice. Principalele centre urbane din Australia includ Sydney, Melbourne, Brisbane și Perth. Sydney-ul este centrul economic și cultural al țării, cunoscut pentru iconicul său Opera House, în timp ce Melbourne-ul este renumit pentru viața sa culturală vibrantă. Australia are o coastă lungă și variată, cu orașe portuare importante precum Sydney, Melbourne și Brisbane. Aceste orașe portuare joacă un rol crucial în comerțul maritim și economia australiană.',
          'historyLesson':
              'Înainte de colonizarea europeană, teritoriul actual al Australiei era locuit de diverse populații indigene, cum ar fi aborigenii și insularii din Strâmtoarea Torres, fiecare având culturi și societăți distincte. Colonizarea europeană a început în secolul al XVIII-lea, odată cu sosirea exploratorilor olandezi și britanici. Această perioadă a adus conflicte între coloniști europeni și populațiile indigene, precum și schimbări semnificative în modul de viață al acestora din urmă. În secolul al XIX-lea, Australia a fost colonizată de britanici, iar unele regiuni au fost folosite ca colonii penale pentru deținuții britanici. Procesul de colonizare a dus la devastarea culturii și modului de viață al populațiilor indigene, precum și la confiscarea terenurilor lor. În secolul al XX-lea, Australia a devenit o națiune independentă, cu o economie în creștere și o societate în curs de modernizare. Participarea la ambele războaie mondiale și dezvoltarea economică ulterioară au contribuit la consolidarea identității naționale australiene. Australia a fost, de asemenea, marcată de politici discriminatorii împotriva populațiilor indigene, cum ar fi politica de asimilare și politica de separare a copiilor aborigeni de familiile lor. Aceste politici au fost contestate și criticate de-a lungul anilor și au dus la mișcări de protest și activism pentru drepturile indigenilor. În prezent, Australia se confruntă cu provocări precum reconcilierea cu populațiile indigene, conservarea mediului înconjurător și gestionarea imigrației. Cu toate acestea, țara rămâne unul dintre cei mai prosperi membri ai comunității mondiale și continuă să joace un rol important în afacerile internaționale.',
          'geography_completed': 0,
          'history_completed': 0,
          'doesExist': 1
        });

        await db.insert('country', {
          'name': 'South Africa',
          'geographyLesson':
              'Africa de Sud, situată în sudul continentului african, este una dintre cele mai diverse și fascinante țări din lume. Cu o varietate de caracteristici geografice și regiuni distincte, Africa de Sud este un amestec captivant de peisaje și ecosisteme. Africa de Sud se învecinează cu Namibia, Botswana și Zimbabwe la nord, Mozambic și Swaziland la est, și cu Lesotho la sud. La vest, este mărginită de Oceanul Atlantic, iar la est de Oceanul Indian. Relieful Africii de Sud este extrem de variat, cuprinzând munți, platouri, câmpii și deșerturi. Munții Drakensberg, care se întind de-a lungul graniței de est, sunt un element caracteristic și oferă peisaje spectaculoase. Clima Africii de Sud variază de la aridă în deșerturile Kalahari și Namib până la temperată în regiunile de coastă și subtropicală în nord-est. Sezonul ploios în nord-est aduce precipitații abundente în timp ce regiunile de coastă beneficiază de un climat mediteranean. Africa de Sud este bogată în resurse naturale, inclusiv aur, diamante, cărbune, metale neferoase și petrol. De asemenea, dispune de o biodiversitate remarcabilă, cu o varietate de specii de plante și animale, inclusiv cele găsite în Parcul Național Kruger. Râul Orange este cel mai lung râu din Africa de Sud și este vital pentru agricultură și irigații. Lacurile principale includ Lacul Sibhayi și Lacul Chrissie. Principalele centre urbane din Africa de Sud includ Johannesburg, Pretoria, Cape Town și Durban. Johannesburg-ul este centrul economic al țării, cunoscut pentru industria minieră, în timp ce Cape Town-ul este renumit pentru frumusețea sa naturală și istoria sa bogată. Africa de Sud are o coastă lungă, cu orașe maritime importante precum Durban, Port Elizabeth și Cape Town. Aceste orașe portuare au jucat un rol crucial în dezvoltarea comerțului maritim și a economiei africane de sud.',
          'historyLesson':
              'Înaintea colonizării europene, teritoriul actual al Africii de Sud era locuit de diverse populații indigene, precum khoikhoi, san și bantu, care aveau culturi și societăți distincte. Olandezii au fondat Cape Town-ul în 1652, marcând începutul colonizării europene. Această perioadă a adus conflicte și schimbări semnificative în modul de viață al populațiilor indigene. Colonizarea europeană a adus, de asemenea, conflicte între coloniștii europeni și populațiile indigene. Războaiele anglo-boere din secolul al XIX-lea au fost un exemplu major al acestor conflicte. Aceste lupte au fost caracterizate de dispute teritoriale și de lupte pentru putere între coloniștii britanici și boeri. În secolul al XX-lea, apartheidul a devenit politica oficială a guvernului Africii de Sud, instituind segregarea rasială și discriminarea împotriva majorității negre a populației. Acest sistem a fost intens contestat de mișcările de rezistență, cum ar fi Congresul Național African (ANC) și lideri precum Nelson Mandela, care au luptat pentru drepturile egale și sfârșitul apartheidului. Tranziția către democrație în Africii de Sud a avut loc în anii 1990, odată cu negocierile dintre guvernul sud-african și mișcările de opoziție. Nelson Mandela a devenit primul președinte negru al țării în 1994, marcând sfârșitul apartheidului și începutul unei noi ere în istoria Africii de Sud. De asemenea, în perioada post-apartheid, Africii de Sud a fost nevoită să se confrunte cu provocări precum reconcilierea națională, reconstrucția economică și combaterea inegalității sociale. Programul Truth and Reconciliation Commission (TRC), condus de președintele Mandela, a fost instituit pentru a investiga abuzurile comise în timpul apartheidului și a încerca să aducă reconciliere între comunitățile sud-africane. În prezent, Africii de Sud încă se confruntă cu provocări, cum ar fi sărăcia, inegalitatea economică, crimele violente și tensiunile etnice. Cu toate acestea, țara rămâne un simbol al rezistenței și al luptei pentru dreptate socială în întreaga lume.',
          'geography_completed': 0,
          'history_completed': 0,
          'doesExist': 1
        });

        await db.insert('country', {
          'name': 'Chile',
          'geographyLesson':
              'Chile, situată în partea de vest a Americii de Sud, este una dintre cele mai diverse și interesante țări din lume. Cu o varietate de caracteristici geografice și regiuni distincte, Chile este un amestec captivant de peisaje și ecosisteme. Chile se întinde de-a lungul unei lungimi impresionante de aproximativ 4.300 de kilometri de la nord la sud, având ca vecini Peru la nord, Bolivia și Argentina la est, și Oceanul Pacific la vest. Această poziție îi conferă o varietate extraordinară de climă și teren. Relieful Chilei este extrem de variat, cuprinzând munți, deșerturi, câmpii și păduri. Cordiliera Anzi, care rulează de-a lungul întregii țări, este una dintre caracteristicile geografice dominante. În nord, deșertul Atacama este unul dintre cele mai aride deșerturi din lume, în timp ce la sud se află regiunea Patagoniei, caracterizată de peisaje montane, fiorduri și ghețari. Clima din Chile variază în funcție de regiune. De la climat arid în deșerturile din nord până la temperat în regiunile de coastă și subpolar în sud, Chile experimentează o gamă largă de condiții climatice. Chile este bogată în resurse naturale, inclusiv cupru, aur, argint, cărbune și păduri. De asemenea, dispune de o biodiversitate impresionantă, cu o varietate de specii de plante și animale, atât pe uscat, cât și în apele sale. Principalele centre urbane din Chile includ Santiago, Valparaíso, Concepción și Antofagasta. Santiago este centrul economic și cultural al țării, fiind situat în Valea Centrală, iar Valparaíso este un important port maritim și centru cultural. Chile are o coastă lungă și variată, cu orașe portuare importante precum Valparaíso, Antofagasta și Puerto Montt. Aceste orașe portuare joacă un rol crucial în comerțul maritim și economia chiliană.',
          'historyLesson':
              'Înainte de colonizarea europeană, teritoriul actual al Chilei era locuit de diverse popoare indigene, printre care mapuche, aymara și incașe, fiecare cu culturi și societăți distincte. Colonizarea spaniolă a început în secolul al XVI-lea, odată cu sosirea lui Diego de Almagro și Pedro de Valdivia. Această perioadă a adus conflicte între spanioli și populațiile indigene, precum și schimbări semnificative în viața acestora din urmă. În secolul al XIX-lea, Chile a fost implicat în războaie de independență împotriva Spaniei, alăturându-se mișcării de independență sud-americane conduse de figuri precum Bernardo O Higgins și José de San Martín. Independența a fost obținută în 1818, iar Chile a devenit o republică independentă. În secolele XIX și XX, Chile a fost marcat de instabilitate politică, conflicte teritoriale și modernizare economică. Perioada prelungită a lui Diego Portales a adus stabilitate politică și reforme economice semnificative. În secolul al XX-lea, Chile a fost dominat de politica polarizată, inclusiv prin președinții Arturo Alessandri și Salvador Allende. Lovitura de stat militară din 1973 a condus la preluarea puterii de către generalul Augusto Pinochet, marcând o perioadă întunecată a istoriei Chilei, caracterizată prin încălcări grave ale drepturilor omului și represiune politică. Tranziția către democrație în Chile a avut loc în anii 1980 și 1990, odată cu sfârșitul regimului lui Pinochet și reinstaurarea guvernului civil. Chile a devenit un exemplu de succes al tranziției de la dictatură la democrație în America Latină. În prezent, Chile se confruntă cu provocări precum inegalitatea economică, proteste sociale și degradarea mediului înconjurător. Cu toate acestea, țara continuă să avanseze în domenii precum educația, tehnologia și dezvoltarea economică, rămânând unul dintre cei mai stabili și prosperi membri ai comunității sud-americane.',
          'geography_completed': 0,
          'history_completed': 0,
          'doesExist': 1
        });

        await db.insert('question', {
          'country': 'Spain',
          'subject': 1,
          'difficulty': 1,
          'question_text':
              'Care este capitala Spaniei și cel mai mare oraș al țării?',
          'answer': answer1,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Spain',
          'subject': 1,
          'difficulty': 1,
          'question_text':
              'Care lanț muntos formează granița nordică a Spaniei?',
          'answer': answer2,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Spain',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'Care este cel mai înalt vârf din Spania?',
          'answer': answer3,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Spain',
          'subject': 1,
          'difficulty': 1,
          'question_text':
              'Care dintre următoarele orașe nu este situat în Spania?',
          'answer': answer4,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Spain',
          'subject': 1,
          'difficulty': 1,
          'question_text':
              'Care dintre următoarele insule nu aparține Spaniei?',
          'answer': answer5,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Spain',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'Ce mare înconjoară coasta de sud a Spaniei?',
          'answer': answer6,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Spain',
          'subject': 1,
          'difficulty': 1,
          'question_text':
              'Care este cea mai mare insulă din Insulele Canare ca suprafață?',
          'answer': answer7,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Spain',
          'subject': 1,
          'difficulty': 1,
          'question_text':
              'Care este râul principal care străbate capitala Spaniei?',
          'answer': answer8,
          'correct_answer': 4,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Spain',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'Care este cel mai lung râu din Spania?',
          'answer': answer9,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Spain',
          'subject': 1,
          'difficulty': 1,
          'question_text':
              'Care este climatul predominant în regiunile de coastă ale Spaniei?',
          'answer': answer10,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Spain',
          'subject': 1,
          'difficulty': 2,
          'question_text':
              'Ce caracterizează clima în regiunile de coastă ale Spaniei?',
          'answer': answer11,
          'correct_answer': 4,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Spain',
          'subject': 1,
          'difficulty': 2,
          'question_text':
              'Care lanț muntos formează granița dintre Spania și Portugalia?',
          'answer': answer12,
          'correct_answer': 4,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Spain',
          'subject': 1,
          'difficulty': 2,
          'question_text':
              'Care dintre aceste orașe spaniole este situat pe coasta de est a țării?',
          'answer': answer13,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Spain',
          'subject': 1,
          'difficulty': 2,
          'question_text': 'Care este populația Spaniei?',
          'answer': '',
          'correct_answer': 47,
          'type': 2
        });

        await db.insert('question', {
          'country': 'Spain',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'Cine a fost unul dintre marii exploratori spanioli din secolele XVI-XVII, care a descoperit America?',
          'answer': answer14,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Spain',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'Care dintre următoarele regate NU a făcut parte din Spania medievală?',
          'answer': answer15,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Spain',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'Ce eveniment important din istoria Spaniei a fost realizat prin căsătoria regilor Ferdinand al II-lea al Aragonului și Isabela I a Castiliei?',
          'answer': answer16,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Spain',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'Care dintre următoarele figuri NU a fost un cuceritor spaniol din epoca colonială?',
          'answer': answer17,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Spain',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'Care a fost perioada de conducere a dictatorului Francisco Franco în Spania?',
          'answer': answer18,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Spain',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'Cine a fost ultimul monarh care a domnit înaintea începerii dictaturii lui Francisco Franco?',
          'answer': answer19,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Spain',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'Ce perioadă istorică a marcat pierderea majorității coloniilor americane ale Spaniei?',
          'answer': answer20,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Spain',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'Care a fost decizia semnificativă din 1492 care a consolidat controlul catolic asupra regatului spaniol?',
          'answer': answer21,
          'correct_answer': 4,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Spain',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'Care a fost perioada de tranziție către democrație în Spania, după moartea lui Franco?',
          'answer': answer22,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Spain',
          'subject': 2,
          'difficulty': 1,
          'question_text': 'Care este forma de guvernământ actuală a Spaniei?',
          'answer': answer23,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Spain',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Care dintre următoarele regate a fost ultimul care s-a unit cu celelalte pentru a forma Spania modernă?',
          'answer': answer24,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Spain',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Cine a fost primul rege al Spaniei, după unificarea regatelor Aragonului și Castiliei?',
          'answer': answer25,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Spain',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Care dintre următoarele țări NU a fost colonizată de spanioli în timpul expansiunii lor în secolele XVI-XVII?',
          'answer': answer26,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Spain',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Ce eveniment important a marcat începutul Reconquistei în Spania medievală?',
          'answer': answer27,
          'correct_answer': 4,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Spain',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Care dintre următoarele personalități a jucat un rol cheie în Reconquista?',
          'answer': answer28,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Spain',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Care a fost principalul motiv al expulzării evreilor și maurilor din Spania în 1492?',
          'answer': answer29,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Spain',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Care dintre următoarele figuri a condus o expediție navală în 1492, care a dus la descoperirea Americii?',
          'answer': answer30,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Spain',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Care a fost efectul principal al Reconquistei în Spania medievală?',
          'answer': answer31,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Spain',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'În care dintre următoarele conflicte a fost implicată Spania în secolul al XIX-lea, pierzând majoritatea coloniilor sale americane?',
          'answer': answer32,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Spain',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Care a fost numele coloniei spaniole din America de Nord fondată de Juan Ponce de León în 1513?',
          'answer': answer33,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'France',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'Care este capitala Franței?',
          'answer': answer34,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'France',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'Care este cel mai înalt vârf al Franței?',
          'answer': answer35,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'France',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'Care este principala atracție turistică din Paris?',
          'answer': answer36,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'France',
          'subject': 1,
          'difficulty': 1,
          'question_text':
              'Care sunt munții care formează granița sud-vestică a Franței?',
          'answer': answer37,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'France',
          'subject': 1,
          'difficulty': 1,
          'question_text':
              'Care este cel mai important râu din Franța, cunoscut pentru traversarea capitalei?',
          'answer': answer38,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'France',
          'subject': 1,
          'difficulty': 1,
          'question_text':
              'Care este regiunea franceză cunoscută pentru stațiunile de lux și plajele frumoase?',
          'answer': answer39,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'France',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'Câtă populație aproximativă are Franța?',
          'answer': '',
          'correct_answer': 67,
          'type': 2
        });

        await db.insert('question', {
          'country': 'France',
          'subject': 1,
          'difficulty': 2,
          'question_text': 'Care este cel mai lung râu din Franța?',
          'answer': answer45,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'France',
          'subject': 1,
          'difficulty': 2,
          'question_text':
              'Care este numele arhipelagului situat în largul coastelor Franței în Marea Mediterană?',
          'answer': answer46,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'France',
          'subject': 1,
          'difficulty': 2,
          'question_text':
              'Câte țări se învecinează direct cu Franța și care sunt acestea?',
          'answer': answer47,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'France',
          'subject': 1,
          'difficulty': 2,
          'question_text':
              'Ce caracteristică a culturii franțuzești este renumită în întreaga lume?',
          'answer': answer45,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'France',
          'subject': 1,
          'difficulty': 2,
          'question_text':
              'Cum variază clima Franței și cum influențează aceasta agricultura și turismul?',
          'answer': answer49,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'France',
          'subject': 1,
          'difficulty': 2,
          'question_text':
              'Care regiune montană marchează granița dintre Franța și Italia și include cel mai înalt vârf al Franței, Mont Blanc?',
          'answer': answer50,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'France',
          'subject': 1,
          'difficulty': 1,
          'question_text':
              'Ce regiune din Franța este cunoscută pentru vinurile sale fine?',
          'answer': answer41,
          'correct_answer': 4,
          'type': 1
        });

        await db.insert('question', {
          'country': 'France',
          'subject': 1,
          'difficulty': 2,
          'question_text':
              'Ce parte a Franței este cunoscută pentru climatul mediteranean și plajele sale?',
          'answer': answer42,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'France',
          'subject': 1,
          'difficulty': 2,
          'question_text':
              'Care este numele regiunii franceze renumite pentru peisajele sale sălbatice și stâncile impresionante?',
          'answer': answer47,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'France',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'Care a fost una dintre provinciile romane în care a fost încorporată Franța în antichitate?',
          'answer': answer54,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'France',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'Cine a condus Franța în timpul Revoluției Franceze din 1789?',
          'answer': answer55,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'France',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'Care a fost perioada de dominație a lui Napoleon Bonaparte în Franța?',
          'answer': answer56,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'France',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'Ce eveniment a pus capăt monarhiei în Franța și a instaurat o republică în 1789?',
          'answer': answer57,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'France',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'Care a fost perioada de ocupație a Franței de către forțele naziste între 1940 și 1944?',
          'answer': answer58,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'France',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'Care a fost numele celei de-a treia perioade a istoriei Franceze, după Revoluția Franceză și perioada napoleoniană?',
          'answer': answer59,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'France',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'Cine a fost regele francez care a condus în timpul Revoluției Franceze și care a fost executat?',
          'answer': answer60,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'France',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'În ce an a avut loc bătălia de la Waterloo, în care Napoleon a fost învins definitiv?',
          'answer': answer61,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'France',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'Care dintre următorii nu a fost un rege important al Franței în Evul Mediu?',
          'answer': answer62,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'France',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'Care a fost una dintre coloniile importante pierdute de Franța în timpul procesului de decolonizare în secolul al XX-lea?',
          'answer': answer63,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'France',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Care a fost perioada de domnie a regelui Ludovic al XIV-lea, cunoscut și sub numele de "Regele Soare"?',
          'answer': answer64,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'France',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Ce nume a primit conflictul dintre Franța și Prusia care a dus la înfrângerea Franței și instaurarea celei de-a Treia Republici în 1870?',
          'answer': answer65,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'France',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Care a fost perioada de domnie a regelui Ludovic al XVI-lea și a reginei Marie Antoinette?',
          'answer': answer66,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'France',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Cine a fost celebrul general francez care a condus forțele aliate în timpul Bătăliei de la Waterloo împotriva lui Napoleon?',
          'answer': answer67,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'France',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Care a fost capitala Franței în timpul Revoluției Franceze?',
          'answer': answer68,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'France',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Care a fost perioada de domnie a împăratului Napoleon al III-lea, nepotul lui Napoleon Bonaparte?',
          'answer': answer69,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'France',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Cine a fost regele francez care a condus în timpul Războiului de O Sută de Ani împotriva Angliei?',
          'answer': answer70,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'France',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Care a fost numele reginei franceze care a jucat un rol important în conducerea țării în timpul minorității fiului ei, Ludovic al XIV-lea?',
          'answer': answer71,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'France',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Care a fost numele mișcării politice și sociale care a dus la începutul Revoluției Franceze și la căderea monarhiei?',
          'answer': answer72,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'France',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Cine a fost generalul francez care a condus forțele franceze în timpul Războiului Franco-Prusac și a fost capturat în bătălia de la Sedan?',
          'answer': answer73,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Italy',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'Care este capitala Italiei?',
          'answer': answer74,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Italy',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'Care este cel mai mare lanț muntos din Italia?',
          'answer': answer75,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Italy',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'Care este cel mai înalt vârf din Italia?',
          'answer': answer76,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Italy',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'Cât de mare este populația Italiei?',
          'answer': '',
          'correct_answer': 2,
          'type': 2
        });

        await db.insert('question', {
          'country': 'Italy',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'Care este cea mai mare insulă din Italia?',
          'answer': answer78,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Italy',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'Care este principala sursă de apă din Italia?',
          'answer': answer79,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Italy',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'Care este clima predominantă în sudul Italiei?',
          'answer': answer80,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Italy',
          'subject': 1,
          'difficulty': 1,
          'question_text':
              'Care este cel mai cunoscut oraș pentru canalele sale?',
          'answer': answer81,
          'correct_answer': 4,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Italy',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'Ce ape înconjoară Peninsula Italică?',
          'answer': answer82,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Italy',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'Care este cea mai populată insulă din Italia?',
          'answer': answer83,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Italy',
          'subject': 1,
          'difficulty': 2,
          'question_text':
              'Care este altitudinea vârfului Monte Rosa din Alpii Graiei?',
          'answer': answer84,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Italy',
          'subject': 1,
          'difficulty': 2,
          'question_text':
              'Care este numele râului principal din nordul Italiei, cunoscut pentru inundațiile sale istorice?',
          'answer': answer85,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Italy',
          'subject': 1,
          'difficulty': 2,
          'question_text':
              'Care insulă italiană este cunoscută pentru forma sa de stiletto?',
          'answer': answer86,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Italy',
          'subject': 1,
          'difficulty': 2,
          'question_text':
              'Care este numele celor două insule italiene situate în Marea Mediterană, aproape de coasta africană?',
          'answer': answer87,
          'correct_answer': 4,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Italy',
          'subject': 1,
          'difficulty': 2,
          'question_text': 'Care este cel mai înalt vârf din Alpii Graiei?',
          'answer': answer88,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Italy',
          'subject': 1,
          'difficulty': 2,
          'question_text':
              'Care oraș italian este renumit pentru festivalul său de carnevale?',
          'answer': answer89,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Italy',
          'subject': 1,
          'difficulty': 2,
          'question_text':
              'Care este numele celei mai lungi râpe subterane din Italia?',
          'answer': answer90,
          'correct_answer': 4,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Italy',
          'subject': 1,
          'difficulty': 2,
          'question_text': 'Care este numele celui mai mare lac din Italia?',
          'answer': answer91,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Italy',
          'subject': 1,
          'difficulty': 2,
          'question_text':
              'Care munte vulcanic se află în apropierea orașului Napoli?',
          'answer': answer92,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Italy',
          'subject': 1,
          'difficulty': 2,
          'question_text':
              'Care regiune italiană este cunoscută pentru producția sa de vin Chianti?',
          'answer': answer93,
          'correct_answer': 1,
          'type': 1
        });
        await db.insert('question', {
          'country': 'Italy',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'Care regiune italiană este cunoscută pentru producția sa de vin Chianti?',
          'answer': answer94,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Italy',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Care a fost capitala Italiei după finalizarea procesului de unificare?',
          'answer': answer95,
          'correct_answer': 4,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Italy',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'În ce perioadă a fost Italia epicentrul unei puternice mișcări culturale și artistice?',
          'answer': answer96,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Italy',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Ce perioadă istorică este cunoscută pentru competiția între diverse state și republici independente în Italia?',
          'answer': answer97,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Italy',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Ce evenimente importante s-au întâmplat în Italia în timpul secolului al XX-lea, în contextul Primului Război Mondial?',
          'answer': answer98,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Italy',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'Cine a fost unul dintre artiștii renumiți ai Renașterii italiene?',
          'answer': answer99,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Italy',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Care au fost principalele conflicte politice și transformări în Italia în secolele XVIII și XIX?',
          'answer': answer100,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Italy',
          'subject': 2,
          'difficulty': 1,
          'question_text': 'Cum s-a implicat Italia în Primul Război Mondial?',
          'answer': answer101,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Italy',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'Care a fost una dintre principalele consecințe ale Conferinței de Pace de la Paris pentru Italia după Primul Război Mondial?',
          'answer': answer102,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Italy',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'Care au fost unele dintre statele și republicile independente din Italia medievală?',
          'answer': answer103,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Italy',
          'subject': 2,
          'difficulty': 2,
          'question_text': 'Când a devenit completă unificarea Italiei?',
          'answer': answer104,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Italy',
          'subject': 2,
          'difficulty': 2,
          'question_text': 'Când a fost fondată Republica Romană?',
          'answer': answer105,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Italy',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'Care a fost una dintre personalitățile care au contribuit la formarea Imperiului Roman?',
          'answer': answer106,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Italy',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Ce perioadă a generat nemulțumiri și instabilitate politică în Italia, pregătind terenul pentru ascensiunea fascismului?',
          'answer': answer107,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Italy',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Care a fost una dintre principalele motive pentru care Italia s-a alăturat Puterilor Aliate în Primul Război Mondial?',
          'answer': answer108,
          'correct_answer': 4,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Italy',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Care a fost una dintre cele mai concentrate zone de luptă în Italia în timpul Primului Război Mondial?',
          'answer': answer109,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Italy',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Când a fost Italia una dintre țările fondatoare ale Comunității Economice Europene (CEE)?',
          'answer': answer110,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Italy',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Care a fost una dintre personalitățile care a contribuit la procesul de unificare a Italiei în secolul al XIX-lea?',
          'answer': answer111,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Italy',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Ce domenii sunt menționate ca fiind influențate de cultura italiană?',
          'answer': answer112,
          'correct_answer': 4,
          'type': 1
        });

        await db.insert('question', {
          'country': 'China',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'Care este capitala Chinei?',
          'answer': answer114,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'China',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'Care este cel mai înalt vârf din China?',
          'answer': answer115,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'China',
          'subject': 1,
          'difficulty': 1,
          'question_text':
              'Ce râu este al treilea cel mai lung râu din lume și traversează China?',
          'answer': answer116,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'China',
          'subject': 1,
          'difficulty': 1,
          'question_text':
              'Care lanț muntos formează granița de nord-est a Chinei?',
          'answer': answer117,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'China',
          'subject': 1,
          'difficulty': 1,
          'question_text':
              'Ce monument istoric impresionant este construit de-a lungul graniței nordice a Chinei?',
          'answer': answer118,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'China',
          'subject': 1,
          'difficulty': 1,
          'question_text':
              'Care oraș chinez este renumit pentru industria sa tehnologică și comercială?',
          'answer': answer119,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'China',
          'subject': 1,
          'difficulty': 1,
          'question_text':
              'Ce regiune autonomă din China este cunoscută pentru peisajele sale spectaculoase și cultura sa distinctă?',
          'answer': answer120,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'China',
          'subject': 1,
          'difficulty': 1,
          'question_text':
              'Care râu chinez se numește și "Râul Galben" datorită sedimentelor sale?',
          'answer': answer121,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'China',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'Ce climă predomină în nordul Chinei?',
          'answer': answer122,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'China',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'Care este cel mai populat oraș din China?',
          'answer': answer123,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'China',
          'subject': 1,
          'difficulty': 2,
          'question_text':
              'Care dintre aceste orașe chineze se află pe malurile Fluviului Yangtze?',
          'answer': answer124,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'China',
          'subject': 1,
          'difficulty': 2,
          'question_text': 'Care este cel mai înalt lanț muntos din China?',
          'answer': answer125,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'China',
          'subject': 1,
          'difficulty': 2,
          'question_text': 'Care oraș chinez este cunoscut pentru ceramica sa?',
          'answer': answer126,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'China',
          'subject': 1,
          'difficulty': 2,
          'question_text':
              'Care regiune chineză este cunoscută pentru arhitectura sa tradițională și canalele sale?',
          'answer': answer127,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'China',
          'subject': 1,
          'difficulty': 2,
          'question_text':
              'Care insulă chineză este renumită pentru plajele sale și turismul său?',
          'answer': answer128,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'China',
          'subject': 1,
          'difficulty': 2,
          'question_text':
              'Care lanț muntos chinez formează o parte a graniței cu Nepalul?',
          'answer': answer129,
          'correct_answer': 4,
          'type': 1
        });

        await db.insert('question', {
          'country': 'China',
          'subject': 1,
          'difficulty': 2,
          'question_text':
              'Care dintre aceste lanțuri muntoase nu traversează China?',
          'answer': answer130,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'China',
          'subject': 1,
          'difficulty': 1,
          'question_text':
              'Ce regiune chineză este cunoscută pentru producția sa de ceai?',
          'answer': answer131,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'China',
          'subject': 1,
          'difficulty': 1,
          'question_text':
              'Care regiune chineză este cunoscută pentru bucătăria sa picantă?',
          'answer': answer133,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'China',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'Care a fost perioada în care China a fost locuită de numeroase triburi și regate înainte de unificarea sub o autoritate centrală?',
          'answer': answer134,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'China',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'Care dinastie a început procesul de unificare a Chinei sub o autoritate centrală?',
          'answer': answer135,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'China',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'Care dinastie chineză a fost cunoscută pentru invențiile tehnologice precum tiparul mobil și busola?',
          'answer': answer136,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'China',
          'subject': 2,
          'difficulty': 1,
          'question_text': 'Ce imperiu a fost fondat de mongoli în China?',
          'answer': answer137,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'China',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'Care a fost perioada în care China a fost un centru comercial și cultural important, cunoscută pentru inovațiile tehnologice?',
          'answer': answer138,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'China',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'Care au fost două evenimente semnificative care au marcat influența imperialistă asupra Chinei în secolul al XIX-lea?',
          'answer': answer139,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'China',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'Ce tratat a fost semnat în urma războaielor opiumului și care au fost consecințele acestuia pentru China?',
          'answer': answer140,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'China',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'Care a fost ultima dinastie imperială a Chinei și când a căzut?',
          'answer': answer141,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'China',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'Cine a fost liderul revoluției care a condus la căderea sistemului imperial în China în 1911?',
          'answer': answer142,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'China',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'Când a fost proclamată înființarea Republicii Populare Chineze și cine a fost liderul partidului care a condus această proclamare?',
          'answer': answer143,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'China',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Sub conducerea cui China a trecut printr-o serie de reforme economice și sociale masive în anii \'80?',
          'answer': answer144,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'China',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Cum a transformat China economia sa în timpul reformelor lui Deng Xiaoping?',
          'answer': answer145,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'China',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Care sunt trei aspecte pentru care este cunoscută China astăzi în contextul global?',
          'answer': answer146,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'China',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'În afară de economie și tehnologie, ce alte domenii au contribuit la istoria culturală bogată a Chinei?',
          'answer': answer147,
          'correct_answer': 4,
          'type': 1
        });

        await db.insert('question', {
          'country': 'China',
          'subject': 2,
          'difficulty': 2,
          'question_text': 'Cine a fost fondatorul dinastiei Qin din China?',
          'answer': answer148,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'China',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Care a fost capitala Chinei în timpul dinastiei Tang?',
          'answer': answer149,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'China',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Care dinastie chineză a construit celebrul Zid Chinezesc?',
          'answer': answer150,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'China',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Cine a fost liderul rebelilor în timpul Revoltei boxerilor?',
          'answer': answer151,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'China',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Ce eveniment a marcat sfârșitul perioadei de dominație străină și instabilitate internă în China?',
          'answer': answer152,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'China',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Care a fost sloganul principal al lui Deng Xiaoping în timpul reformelor economice din China?',
          'answer': answer153,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'United States',
          'subject': 2,
          'difficulty': 1,
          'question_text': 'Care sunt granițele geografice ale SUA?',
          'answer': answer154,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'United States',
          'subject': 1,
          'difficulty': 2,
          'question_text': 'Care sunt granițele geografice ale SUA?',
          'answer': answer206,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'United States',
          'subject': 1,
          'difficulty': 2,
          'question_text': 'Care este capitala SUA?',
          'answer': answer207,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'United States',
          'subject': 1,
          'difficulty': 2,
          'question_text': 'Care este caracteristica geografică iconică a SUA?',
          'answer': answer208,
          'correct_answer': 1,
          'type': 1
        });
        await db.insert('question', {
          'country': 'United States',
          'subject': 1,
          'difficulty': 2,
          'question_text': 'Las Vegas este un oras important',
          'answer': '',
          'correct_answer': 1,
          'type': 4
        });
        await db.insert('question', {
          'country': 'United States',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'Ce râuri majore traversează teritoriul SUA?',
          'answer': answer209,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'United States',
          'subject': 1,
          'difficulty': 1,
          'question_text':
              'Care sunt principalele caracteristici geografice ale teritoriului SUA?',
          'answer': answer210,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'United States',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'Care este varietatea climatică a SUA ?',
          'answer': answer211,
          'correct_answer': 4,
          'type': 1
        });

        await db.insert('question', {
          'country': 'United States',
          'subject': 2,
          'difficulty': 1,
          'question_text': 'Care este capitala SUA?',
          'answer': answer155,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'United States',
          'subject': 2,
          'difficulty': 1,
          'question_text': 'Care este caracteristica geografică iconică a SUA?',
          'answer': answer156,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'United States',
          'subject': 2,
          'difficulty': 1,
          'question_text': 'Ce râuri majore traversează teritoriul SUA?',
          'answer': answer157,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'United States',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'Care este importanța râului Mississippi pentru țară?',
          'answer': answer158,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'United States',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'Care sunt principalele caracteristici geografice ale teritoriului SUA?',
          'answer': answer159,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'United States',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'Ce rol au orașele portuare ale SUA în economia țării?',
          'answer': answer160,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'United States',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'Numește trei orașe importante din SUA, în afară de capitală și cel mai mare oraș.',
          'answer': answer161,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'United States',
          'subject': 2,
          'difficulty': 1,
          'question_text': 'Care este varietatea climatică a SUA?',
          'answer': answer162,
          'correct_answer': 4,
          'type': 1
        });

        await db.insert('question', {
          'country': 'United States',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'Ce parcuri naționale din SUA sunt menționate în lecție?',
          'answer': answer163,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'United States',
          'subject': 2,
          'difficulty': 1,
          'question_text': 'Care este importanța economică a coastelor SUA?',
          'answer': answer164,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'United States',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Care sunt teritoriile SUA în afara continentului principal?',
          'answer': answer165,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'United States',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Cum variază climatul în funcție de poziția geografică în SUA?',
          'answer': answer166,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'United States',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Ce caracteristică geografică a SUA influențează economia și transportul intern?',
          'answer': answer167,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'United States',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Numește două state care au terenuri deșertice în SUA.',
          'answer': answer168,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'United States',
          'subject': 2,
          'difficulty': 2,
          'question_text': 'Ce reprezintă Marea de Est, menționată în lecție?',
          'answer': answer169,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'United States',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Care dintre următoarele animale este asociat cu Parcul Național Yellowstone?',
          'answer': answer170,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'United States',
          'subject': 2,
          'difficulty': 2,
          'question_text': 'Ce stat găzduiește Munții Stâncoși?',
          'answer': answer171,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'United States',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Ce mâncăruri tradiționale sunt menționate în contextul diversității culinare a SUA?',
          'answer': answer172,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'United States',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Care sunt două dintre teritoriile SUA menționate în lecție, în afară de Hawaii și Puerto Rico?',
          'answer': answer173,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Romania',
          'subject': 1,
          'difficulty': 1,
          'question_text': '',
          'answer': answer174,
          'correct_answer': 1,
          'type': 3
        });

        await db.insert('question', {
          'country': 'Romania',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'Care este capitala României?',
          'answer': answer175,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Romania',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'Care este populatia României?',
          'answer': '',
          'correct_answer': 19,
          'type': 2
        });

        await db.insert('question', {
          'country': 'Romania',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'Ce fluviu trece prin România?',
          'answer': answer177,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Romania',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'Care oraș nu este situat în România?',
          'answer': answer178,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Romania',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'Care este cel mai înalt vârf din România?',
          'answer': answer179,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Romania',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'Care este clima României?',
          'answer': answer180,
          'correct_answer': 4,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Romania',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'Cum sunt verile în România?',
          'answer': answer181,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Romania',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'România este una dintre cele mai populate țări din',
          'answer': answer182,
          'correct_answer': 4,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Romania',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'Care regiune nu este in România?',
          'answer': answer183,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Romania',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'Ucraina este vecină cu România',
          'answer': '',
          'correct_answer': 1,
          'type': 4
        });

        await db.insert('question', {
          'country': 'Romania',
          'subject': 1,
          'difficulty': 2,
          'question_text': 'Care țară nu este vecină cu România? ',
          'answer': answer184,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Romania',
          'subject': 1,
          'difficulty': 2,
          'question_text': 'Ce porturi oferă acces la Marea Neagră?',
          'answer': answer186,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Romania',
          'subject': 1,
          'difficulty': 2,
          'question_text': 'Ce munte împarte teritoriul României?',
          'answer': answer185,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Romania',
          'subject': 1,
          'difficulty': 2,
          'question_text': 'În ce stadiu se află România?',
          'answer': answer187,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Romania',
          'subject': 1,
          'difficulty': 2,
          'question_text': 'În ce munte se află Vârful Moldoveanu?',
          'answer': answer188,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Romania',
          'subject': 1,
          'difficulty': 2,
          'question_text': 'Pentru ce este cunoscută Transilvania?',
          'answer': answer189,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Romania',
          'subject': 1,
          'difficulty': 2,
          'question_text': 'De ce este influențată clima României?',
          'answer': answer190,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Romania',
          'subject': 1,
          'difficulty': 2,
          'question_text': 'Care locație este mai populară vara?',
          'answer': answer191,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Romania',
          'subject': 1,
          'difficulty': 2,
          'question_text': 'Care locație este mai populară iarna?',
          'answer': answer192,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Romania',
          'subject': 1,
          'difficulty': 2,
          'question_text': 'România este membră NATO',
          'answer': '',
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Romania',
          'subject': 1,
          'difficulty': 2,
          'question_text': 'Populația României în milioane este',
          'answer': '',
          'correct_answer': 19,
          'type': 2
        });

        await db.insert('question', {
          'country': 'Romania',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'În vremurile străvechi, ce popor locuia pe teritoriul României?',///
          'answer': answer194,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Romania',
          'subject': 2,
          'difficulty': 1,
          'question_text': 'Ce imperiu a cucerit Dacia?',///
          'answer': answer195,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Romania',
          'subject': 2,
          'difficulty': 1,
          'question_text': 'Ce principat aparținea teritoriului românesc? ',///
          'answer': answer196,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Romania',
          'subject': 2,
          'difficulty': 1,
          'question_text': 'În ce an a avut Unirea Principatelor Române?',
          'answer': '',
          'correct_answer': 1859,
          'type': 2
        });

        await db.insert('question', {
          'country': 'Romania',
          'subject': 2,
          'difficulty': 1,
          'question_text': 'Ce fel de regim adoptă România în anul 1947?',///
          'answer': answer198,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Romania',
          'subject': 2,
          'difficulty': 1,
          'question_text': '',
          'answer': answer197,
          'correct_answer': 1,
          'type': 3
        });

        await db.insert('question', {
          'country': 'Romania',
          'subject': 2,
          'difficulty': 1,
          'question_text': 'Marea Unire a avut loc în anul 1925',///
          'answer': "",
          'correct_answer': 2,
          'type': 4
        });

        await db.insert('question', {
          'country': 'Romania',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'În ce an și-a proclamat România independența față de Imperiul Otoman?',///
          'answer': '',
          'correct_answer': 1877,
          'type': 2
        });

        await db.insert('question', {
          'country': 'Romania',
          'subject': 2,
          'difficulty': 1,
          'question_text': 'În ce an a căzut comunismul în România?',///
          'answer': '',
          'correct_answer': 1989,
          'type': 2
        });

        await db.insert('question', {
          'country': 'Romania',
          'subject': 2,
          'difficulty': 1,
          'question_text': 'În ce an devine România membră UE?',///
          'answer': answer199,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Romania',
          'subject': 2,
          'difficulty': 1,
          'question_text': 'Cine este actualul președinte al României?',///
          'answer': answer200,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Romania',
          'subject': 2,
          'difficulty': 2,
          'question_text': 'Cine a domnit Moldova în epoca medievală?',
          'answer': answer201,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Romania',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'În timpul celui de-al Doilea Război Mondial, ce putere ocupă România?',
          'answer': answer202,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Romania',
          'subject': 2,
          'difficulty': 2,
          'question_text': 'În ce an a fost cucerită Dacia?',
          'answer': '',
          'correct_answer': 106,
          'type': 2
        });

        await db.insert('question', {
          'country': 'Romania',
          'subject': 2,
          'difficulty': 2,
          'question_text': 'În ce secol a crescut mișcarea națională?',
          'answer': '',
          'correct_answer': 19,
          'type': 2
        });

        await db.insert('question', {
          'country': 'Romania',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Care a fost primul conducător al României Comuniste?',
          'answer': answer203,
          'correct_answer': 4,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Romania',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'În ce război au participat Principatele Române pentru a-și consolida statutul de națiune suverană?',
          'answer': answer204,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Romania',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Cum se numește procesul prin care Romanii influențiază cultura dacilor',
          'answer': answer205,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Romania',
          'subject': 2,
          'difficulty': 2,
          'question_text': 'Vlad Țepeș a domnit în Țara Românească',
          'answer': "",
          'correct_answer': 1,
          'type': 4
        });

        await db.insert('question', {
          'country': 'Romania',
          'subject': 2,
          'difficulty': 1,
          'question_text': '',
          'answer': answer197,
          'correct_answer': 1,
          'type': 3
        });

        await db.insert('question', {
          'country': 'South Africa',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'Cine locuia pe teritoriul actual al Africii de Sud înainte de sosirea europenilor?',
          'answer': answer212,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'South Africa',
          'subject': 2,
          'difficulty': 1,
          'question_text': 'Când au fondat olandezii Cape Town-ul?',
          'answer': answer213,
          'correct_answer': 3,
          'type': 1
        });

        await db.insert('question', {
          'country': 'South Africa',
          'subject': 2,
          'difficulty': 1,
          'question_text': 'Războaiele anglo-boere au avut loc in secolul XIX',
          'answer': '',
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'South Africa',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'Cine a devenit primul președinte negru al Africii de Sud după sfârșitul apartheidului?',
          'answer': answer214,
          'correct_answer': 2,
          'type': 1
        });
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
        if (newVersion > oldVersion) {
          await db.execute('DROP TABLE question');
          await db.execute('DROP TABLE $table');
          await db.execute('DROP TABLE profile');
          await db.execute('DROP TABLE trophies');
          await db.execute('''
          CREATE TABLE trophies (
            $columnTrophyId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnTrophy INTEGER
          )''');
          await db.execute('''
          CREATE TABLE profile (
            profileID INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT,
            picture INTEGER,
            iq INTEGER,
            trophies INTEGER,
            geography_lessons INTEGER,
            history_lessons INTEGER,
            dark_mode INTEGER,
            language INTEGER,
            admin INTEGER,
            coins INTEGER,
            streak_count INTEGER DEFAULT 0,
            last_activity_date TEXT,
            faces TEXT
          )''');
          db.insert('profile', {
            'username': 'username',
            'picture': 0,
            'iq': 0,
            'trophies': 0,
            'geography_lessons': 0,
            'history_lessons': 0,
            'dark_mode': 1,
            'language': 1,
            'admin': 0,
            'coins': 0,
            'streak_count': 0,
            'last_activity_date': "${DateTime.now().toIso8601String()}",
            'faces': ''
          });
          await db.execute('''
          CREATE TABLE country (
            countryID INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            geographyLesson TEXT,
            historyLesson TEXT,
            geography_completed INTEGER,
            history_completed INTEGER,
            doesExist INTEGER
          )''');

          for (String country in countries) {
            insertCountry(country);
          }

          //preinstall

          await db.execute(
              ''' CREATE TABLE question ( questionID INTEGER PRIMARY KEY AUTOINCREMENT, country TEXT, subject INTEGER, difficulty INTEGER, question_text TEXT, answer TEXT, correct_answer INTEGER, type INTEGER )''');

          await db.insert('country', {
            'name': 'Romania',
            'geographyLesson':
                'România este situată în partea de sud-est a Europei, având granițe cu Bulgaria, Serbia, Ungaria, Ucraina și Republica Moldova. Capitala sa, București, este cel mai mare oraș și principal centru cultural, economic și politic al țării. Cu o populație de aproximativ 19 milioane de locuitori, România este una dintre cele mai populate țări din Europa de Est. Teritoriul său este împărțit de Munții Carpați, care formează o barieră naturală ce separă țara în trei regiuni geografice distincte: Transilvania, Moldova și Maramureșul. Acești munți sunt adesea descrisi ca fiind inima României, oferind nu doar peisaje pitorești, ci și o sursă importantă de resurse naturale și biodiversitate. Dunărea, un fluviu navigabil vital, curge prin sudul țării, marcând granița naturală cu Bulgaria și oferind acces la Marea Neagră prin porturile Constanța și Mangalia. Acest aspect geografic a facilitat comerțul și interacțiunile culturale cu alte regiuni din Europa și din întreaga lume. În afară de București, alte orașe importante din România includ Cluj-Napoca, Timișoara, Iași și Constanța, fiecare cu propriile sale bogății culturale și economice. România este o țară în curs de dezvoltare, membră a Uniunii Europene și a NATO, cu o economie mixtă în care industria, agricultura și serviciile joacă roluri importante în creșterea sa economică. Cel mai înalt punct al României este vârful Moldoveanu din Munții Făgăraș, având o altitudine impresionantă de 2.544 de metri. Această înălțime oferă panorame spectaculoase și oportunități pentru alpinism și turism montan. Regiunile istorice ale României, cum ar fi Transilvania, cunoscută pentru peisajele sale montane și orașele istorice, Moldova, renumită pentru siturile sale istorice și moștenirea culturală bogată, și Maramureșul, cu peisajele sale rurale și tradițiile autentice, adaugă unicitate și diversitate acestei țări. Clima României este temperată continentală, cu veri călduroase și ierni reci, fiind influențată de Munții Carpați și de Marea Neagră. Această varietate climatică oferă condiții favorabile pentru o gamă diversă de activități, de la sporturile de iarnă în Carpați până la relaxare la malul Mării Negre în timpul verii.',
            'historyLesson':
                'Într-un colț al Europei, se întinde o țară plină de istorie și tradiție numită România. În vremurile străvechi, teritoriul României era locuit de daci, un popor mândru și cu o cultură bogată. În anul 106 d.Hr., Imperiul Roman a cucerit acest teritoriu, începând procesul de romanizare. Această interacțiune între daci și romani a lăsat o amprentă puternică în identitatea românească, reflectată în limba, obiceiurile și tradițiile poporului. În perioada medievală, teritoriul românesc era împărțit în principate autonome, Moldova și Țara Românească. Sub conducerea domnitorilor lor, cum ar fi Ștefan cel Mare și Vlad Țepeș, aceste principate au luptat pentru independență și au rezistat presiunilor străine, stabilind bazele statelor românești. În secolul al XIX-lea, mișcarea națională a crescut semnificativ și a avut loc Unirea Principatelor Române în 1859, sub domnia lui Alexandru Ioan Cuza. Acest pas important a deschis calea pentru formarea României moderne. În 1877, România și-a proclamat independența față de Imperiul Otoman și a participat la Războiul de Independență, consolidându-și statutul de națiune suverană. Între cele două războaie mondiale, România a experimentat perioade de instabilitate politică și progres economic. În 1918, a avut loc Marea Unire între Transilvania, Moldova și Țara Românească. Totuși, în timpul celui de-al Doilea Război Mondial, țara a fost ocupată de trupele Axei, iar după război, a devenit un stat satelit al Uniunii Sovietice. În 1947, România a devenit o republică comunistă sub conducerea lui Gheorghe Gheorghiu-Dej și apoi a lui Nicolae Ceaușescu. Regimul comunist a fost caracterizat de opresiune politică și o stagnare economică. Totuși, în decembrie 1989, Revoluția Română a dus la căderea regimului comunist și la instaurarea democrației în țară. După Revoluție, România a trecut printr-o perioadă de tranziție dificilă către economia de piață și democrație. În 2007, România a devenit membru al Uniunii Europene, consolidându-și angajamentul față de valorile democratice și integrarea europeană.',
            'geography_completed': 0,
            'history_completed': 0,
            'doesExist': 1
          });

          await db.insert('country', {
            'name': 'Spain',
            'geographyLesson':
                'Spania este situată în partea de sud-vest a Europei, având granițe cu Franța la nord și nord-est, Portugalia la vest și Andorra și Gibraltar la sud. Capitala sa, Madrid, este cel mai mare oraș și centrul cultural, economic și politic al țării. Cu o populație de aproximativ 47 de milioane de locuitori, Spania este una dintre cele mai populate țări din Europa. Teritoriul său este caracterizat de o mare varietate geografică, cuprinzând zone montane, câmpii, și țărmuri maritime. Munții Pirinei formează granița nordică a țării, oferind peisaje montane spectaculoase și oportunități pentru sporturi de iarnă. În centrul și sudul Spaniei se află o serie de lanțuri muntoase, cum ar fi Munții Cantabrici, Munții Centrali și Munții Betici, care influențează climatul și geografia regiunilor respective. De asemenea, Spania are o rețea vastă de râuri, precum Ebro, Tagus și Guadalquivir, care contribuie la fertilitatea câmpiilor și la dezvoltarea agriculturii. Un aspect geografic semnificativ al Spaniei este Peninsula Iberică, care include și Portugal, și este înconjurată de Oceanul Atlantic și Marea Mediterană. Această poziție strategică a facilitat comerțul maritim și a adus influențe culturale diverse de-a lungul istoriei. În plus față de Madrid, alte orașe importante din Spania includ Barcelona, Valencia, Sevilla și Bilbao, fiecare având caracteristici geografice și culturale distincte. Spania este o destinație turistică populară datorită plajelor sale mediteraneene, orașelor istorice și peisajelor naturale variate. Cel mai înalt vârf din Spania este vârful Teide din Insulele Canare, având o altitudine de 3.718 metri. Acest vârf vulcanic oferă oportunități pentru explorare și turism ecologic într-un mediu unic. Clima Spaniei variază de la mediteraneană în sud la temperată în nord, iar influențele oceanice și continentale se resimt în diferite regiuni ale țării. Această diversitate climatică oferă condiții favorabile pentru o gamă largă de activități în aer liber și agricultură. Spania include mai multe arhipelaguri importante, cum ar fi Insulele Baleare în Marea Mediterană și Insulele Canare în Oceanul Atlantic. Insulele Baleare, printre care se numără Mallorca, Menorca, Ibiza și Formentera, sunt cunoscute pentru plajele lor frumoase, apele cristaline și viața de noapte vibrantă. Aceste insule sunt o destinație populară pentru turiști din întreaga lume, oferind o varietate de activități recreative și culturale. Insulele Canare, situate în largul coastelor africane, sunt formate din țapuscă vulcanică și oferă un peisaj spectaculos și diversitate ecologică. Insula Tenerife este cunoscută pentru vârful său vulcanic Teide, iar Gran Canaria pentru dunele sale de nisip și pentru viața sa maritimă bogată.',
            'historyLesson':
                'În sud-vestul Europei, se află o țară cu o moștenire istorică bogată numită Spania. În antichitate, teritoriul spaniol era locuit de popoare precum ibero-geții și celtiberii, care au fost ulterior colonizați de romani, contribuind la formarea provinciei romane Hispania. În Evul Mediu, Spania a fost împărțită în numeroase regate și taifas, fiecare cu propria lor cultură și identitate. Printre cele mai importante regate se numărau Regatul Castiliei, Regatul Aragonului și Regatul Navarrei. În această perioadă, au existat și perioade de coabitare și conflicte între creștini, musulmani și evrei, evidențiind diversitatea religioasă și culturală a peninsulei iberice. În secolul al XV-lea, prin căsătoria regilor Ferdinand al II-lea al Aragonului și Isabela I a Castiliei, a fost creată o uniune între cele două regate, marcând începutul formării Spaniei moderne. Sub conducerea lor, a fost finalizată Reconquista, recucerirea teritoriilor musulmane din Spania, iar în 1492 a fost semnat decretul de expulzare a evreilor și a maurilor, consolidând controlul catolic asupra regatului. Perioada cuceririi și colonizării Americii de către spanioli a adus Spaniei o mare bogăție și putere în secolele XVI-XVII. Această epocă a fost marcată de mari exploratori și cuceritori precum Cristofor Columb, Hernán Cortés și Francisco Pizarro, care au extins influența spaniolă în întreaga lume. În secolul al XIX-lea, Spania a fost implicată în numeroase conflicte interne și externe, inclusiv Războiul Peninsular împotriva armatelor lui Napoleon și pierderea majorității coloniilor sale americane în urma războaielor de independență din America Latină. În secolul al XX-lea, Spania a fost martoră a unor perioade de instabilitate politică, inclusiv dictatura lui Francisco Franco între 1939 și 1975. După moartea sa, Spania a trecut printr-o tranziție către democrație, culminând cu adoptarea unei constituții democratice în 1978. În prezent, Spania este o monarhie parlamentară și membru al Uniunii Europene, având o economie diversificată și o moștenire culturală și istorică impresionantă.',
            'geography_completed': 0,
            'history_completed': 0,
            'doesExist': 1
          });

          await db.insert('country', {
            'name': 'France',
            'geographyLesson':
                'Geografia Franței oferă o diversitate remarcabilă, cuprinzând regiuni montane, câmpii fertile și litorale spectaculoase. Situată în partea de vest a Europei, Franța se învecinează cu Spania la sud-vest, Belgia și Luxemburg la nord-est, Germania și Elveția la est, Italia la sud-est și Marea Mediterană la sud. Capitala Franței, Parisul, este unul dintre cele mai mari centre culturale și economice ale lumii, cunoscut pentru atracțiile sale turistice remarcabile, precum Turnul Eiffel, Catedrala Notre-Dame și Muzeul Luvru. Cu o populație de aproximativ 67 de milioane de locuitori, Franța este una dintre cele mai populate țări din Europa. Relieful Franței este variat și spectaculos. Munții Alpi se întind în partea de sud-est a țării, marcând granița cu Italia, și includ cel mai înalt vârf al Franței, Mont Blanc, cu o altitudine de 4.810 metri. În partea sud-vestică, Munții Pirinei formează o graniță naturală cu Spania, oferind peisaje montane impresionante și facilitând activități sportive precum schiul și alpinismul. În nordul Franței se găsesc Câmpiile Nordului și Câmpiile Loarei, regiuni fertile care susțin o agricultură bogată și diverse industrii. De asemenea, Franța este traversată de numeroase râuri importante, cum ar fi Sena, Loara și Rhone, care au avut un impact semnificativ asupra dezvoltării sale economice și culturale. Franța este recunoscută și pentru coasta sa pitorească, care se întinde de-a lungul Mării Mediterane și a Oceanului Atlantic. Riviera Franceză, situată în sud-estul țării, este cunoscută pentru stațiunile sale de lux și plajele frumoase, în timp ce Bretania, în nord-vest, este faimoasă pentru peisajele sale sălbatice și stâncile impresionante. În afară de Paris, alte orașe importante din Franța includ Lyon, Marsilia, Bordeaux și Strasbourg, fiecare având propria sa identitate culturală și atracții distincte. Franța este, de asemenea, renumită pentru vinurile sale fine, gastronomia rafinată și cultura bogată. Clima Franței variază de la mediteraneană în sud la temperată în nord, cu influențe oceanice și continentale. Această diversitate climatică permite dezvoltarea unei game variate de culturi agricole și susține turismul pe tot parcursul anului.',
            'historyLesson':
                'Istoria Franței este una dintre cele mai fascinante din Europa, începând cu antichitatea și ajungând până în prezent. În acele vremuri îndepărtate, teritoriul francez era populat de triburi celtice și galice, iar apoi a fost colonizat de romani, formând provincia romană Gallia. Evul Mediu a adus feudalismul și fragmentarea țării în regate și principate, precum Regatul Franciei și Ducatul Normandiei. În secolul al XV-lea, Franța a început să se consolideze sub conducerea lui Ludovic al XI-lea, marcând începutul formării Franței moderne. Revolutia Franceză din 1789 a pus capăt monarhiei și a instaurat o republică, urmată de perioada Napoleonică care a adus expansiune teritorială și influență sub conducerea lui Napoleon Bonaparte. Secolul al XIX-lea a fost plin de schimbări și conflicte majore, inclusiv Războiul Franco-Prusac și instaurarea celei de-a Treia Republici în 1870. Secolul al XX-lea a fost marcat de cele două războaie mondiale și ocupația nazistă între 1940 și 1944. După Al Doilea Război Mondial, Franța a fost una dintre puterile fondatoare ale Uniunii Europene și a cunoscut procesul de decolonizare, pierzând majoritatea coloniilor sale în Africa și Asia. Astăzi, Franța rămâne una dintre cele mai importante și influente țări din lume, cu o economie diversificată, un sistem politic stabil și o moștenire culturală și artistică bogată. Gastronomia franceză este renumită la nivel mondial, iar arta și arhitectura sa impresionantă atrag milioane de turiști în fiecare an. Contribuțiile sale în domenii precum știința, tehnologia și literatura continuă să influențeze lumea modernă, consolidând statutul Franței ca una dintre marile puteri ale secolului XXI.',
            'geography_completed': 0,
            'history_completed': 0,
            'doesExist': 1
          });

          await db.insert('country', {
            'name': 'United States',
            'geographyLesson':
                'Statele Unite ale Americii (SUA), una dintre cele mai mari și influente țări din lume, se află în America de Nord, având granițe cu Canada la nord și Mexic la sud. Capitala sa este Washington, D.C., iar New York City este un important centru cultural, economic și financiar. Teritoriul SUA este extrem de divers, cuprinzând munți, câmpii, deșerturi și regiuni de coastă. La vest se găsesc Munții Stâncoși, iar la est se întinde Marea de Est. La sud se află Deșertul Sonora, iar la nord-vest se întinde Podișul Columbia. Aceste caracteristici geografice influențează clima și economia țării. Râurile majore, cum ar fi Mississippi și Missouri, traversează SUA, furnizând resurse naturale și fiind vitale pentru transportul intern. Mississippi este unul dintre cele mai lungi râuri din lume și a avut o mare importanță în dezvoltarea istorică și economică a țării. O caracteristică geografică iconică a SUA o reprezintă Parcul Național Yellowstone, situat în statul Wyoming, care găzduiește gheizere, izvoare termale și o varietate de faună sălbatică. Printre speciile de animale emblemă din Parcul Național Yellowstone se numără ursul grizzly, care este considerat un simbol al sălbăticiei și al puterii naturii. Ursul grizzly poate fi întâlnit în diferite părți ale parcului, căutând hrană în zonele împădurite sau de-a lungul cursurilor de apă. SUA are și o coastă extinsă, cu orașe maritime importante precum Los Angeles, San Francisco și Miami. Aceste orașe portuare au jucat un rol crucial în dezvoltarea comerțului maritim și a economiei americane. În plus față de Washington, D.C. și New York City, alte orașe importante din SUA includ Los Angeles, Chicago și Houston, fiecare având caracteristici geografice și culturale distincte. SUA este o destinație turistică populară datorită diversității sale culturale, a parcurilor naționale și a orașelor vibrante. Clima SUA variază considerabil de la nord la sud și de la est la vest, cu regiuni temperate, deșertice și subtropicale. În nord-est, iernile sunt reci și zăpădite, în timp ce în sud-vest verile sunt fierbinți și uscate. SUA include și mai multe teritorii în afara continentului principal, cum ar fi Hawaii și Puerto Rico, care oferă peisaje spectaculoase și culturi diverse. SUA este cunoscută pentru diversitatea sa culinară, cu influențe din întreaga lume, inclusiv mâncăruri tradiționale precum burgeri, pizza și friptură, dar și specialități regionale cum ar fi gumbo din Louisiana și sushi din California',
            'historyLesson':
                'Înaintea colonizării europene, teritoriul actual al Statelor Unite era locuit de populații amerindiene diverse, care aveau culturi și societăți variate. Cu sosirea exploratorilor europeni în secolul al XVI-lea, începe procesul de colonizare a Americii de Nord. În secolul al XVIII-lea, coloniile britanice din America de Nord au luptat pentru independență împotriva coroanei britanice. Declarația de Independență a fost adoptată în 1776, marcând începutul Statelor Unite ale Americii ca națiune independentă. În secolul al XIX-lea, Statele Unite au experimentat o extindere teritorială masivă spre vest, într-un proces cunoscut sub numele de "Manifest Destiny". Însă, această expansiune a alimentat tensiuni între statele slave și cele non-slave, culminând în Războiul Civil American (1861-1865), care a fost luptat între statele care susțineau sclavia și cele care se opuneau ei. După Războiul Civil, Statele Unite au cunoscut o perioadă de industrializare rapidă și dezvoltare economică. În secolul al XX-lea, ele au devenit una dintre cele mai puternice și influente națiuni din lume, jucând un rol major în ambele războaie mondiale și devenind un pilon al economiei globale. Prohibiția a fost perioada în care producția, distribuția și consumul de alcool au fost interzise prin lege în întreaga țară, între anii 1920 și 1933. Această politică a fost implementată prin adoptarea celui de-al 18-lea amendament la Constituția SUA în 1919 și prin Legea Volstead. În prezent, Statele Unite rămân o putere economică și militară dominantă, dar se confruntă cu o serie de provocări interne și internaționale, inclusiv inegalitatea economică, schimbările climatice și tensiunile geopolitice. Cu toate acestea, diversitatea sa culturală, inovația și angajamentul față de valorile democratice continuă să definească națiunea și să inspire lumea.',
            'geography_completed': 0,
            'history_completed': 0,
            'doesExist': 1
          });

          await db.insert('country', {
            'name': 'Italy',
            'geographyLesson':
                'Italia este situată în partea de sud a Europei, având granițe cu Franța la nord-vest, Elveția și Austria la nord și nord-est, Slovenia la nord-est și Croația la est. Capitala sa, Roma, este cel mai mare oraș și centrul cultural, istoric și politic al țării. Cu o populație de aproximativ 60 de milioane de locuitori, Italia este una dintre cele mai populate țări din Europa. Teritoriul său este caracterizat de o varietate geografică remarcabilă, cuprinzând munți, câmpii și țărmuri maritime. Munții Alpi formează granița nordică a țării, oferind peisaje alpine spectaculoase și oportunități pentru sporturi de iarnă. În centrul Italiei se află o serie de lanțuri muntoase, cum ar fi Apeninii, care se întind pe aproape toată lungimea peninsulei italiene și influențează climatul și geografia regiunilor respective. De asemenea, Italia are o rețea extinsă de râuri, precum Po, Tevere și Arno, care contribuie la fertilitatea câmpiilor și la dezvoltarea agriculturii. Un aspect geografic semnificativ al Italiei este Peninsula Italică, care se întinde în Marea Mediterană și este înconjurată de mai multe insule, cum ar fi Sicilia și Sardinia. Această poziție strategică a favorizat comerțul maritim și a adus influențe culturale diverse de-a lungul istoriei. Vezuviul este un vulcan activ situat în apropierea orașului Napoli din regiunea Campania din sudul Italiei. Este cunoscut în special pentru erupția sa devastatoare din anul 79 d.Hr., care a dus la distrugerea orașelor Pompei și Herculaneum. Acest vulcan este considerat unul dintre cei mai periculoși din lume din cauza populației dense și a impactului potențial asupra orașelor înconjurătoare în cazul unei noi erupții majore. În plus față de Roma, alte orașe importante din Italia includ Milano, Napoli, Florența și Veneția, fiecare având caracteristici geografice și culturale distincte. Italia este o destinație turistică populară datorită orașelor istorice, artei și arhitecturii sale bogate și peisajelor naturale variate. Cel mai înalt vârf din Italia este vârful Mont Blanc din Alpii Graiei, având o altitudine de 4.808 metri. Acest vârf glaciar oferă oportunități pentru alpinism și turism ecologic într-un mediu spectaculos. Italia este cunoscută în întreaga lume pentru producția sa bogată și variată de vinuri. Regiunea Toscana, în special, este renumită pentru vinul Chianti, un vin roșu sec. Clima Italiei variază de la mediteraneană în sud la temperată în nord, iar influențele oceanice și continentale se resimt în diferite regiuni ale țării. Această diversitate climatică oferă condiții favorabile pentru o gamă largă de activități în aer liber și agricultură. Italia include și mai multe insule importante, cum ar fi Sicilia și Sardinia, care au peisaje spectaculoase și o istorie bogată.',
            'historyLesson':
                'În sudul Europei, se găsește o țară cu o istorie bogată și variată - Italia. În antichitate, peninsula italiană era locuită de diverse popoare precum etruscii, grecii și samniții, dar a devenit cunoscută mai ales prin cucerirea romană, care a dus la formarea Republicii Romane și apoi a Imperiului Roman. În Evul Mediu, Italia a fost divizată în numeroase state și republici independente, precum Republica Venețiană, Ducatul Milano, Republica Florentină și Statul Papal. Această perioadă a fost marcată de competiția între aceste entități pentru putere și control.În timpul Renașterii, Italia a fost epicentrul unui puternic mișcări culturale și artistice, marcând o perioadă de înflorire în domenii precum arta, arhitectura și literatura. Personalități precum Leonardo da Vinci, Michelangelo și Dante Alighieri au contribuit la reputația de centru cultural al Europei al Italiei. În secolele XVIII și XIX, Italia a fost scena unor conflicte și transformări politice importante, incluzând războaiele napoleoniene și procesul de unificare a Italiei sub conducerea lui Giuseppe Garibaldi și a lui Camillo Benso, conte de Cavour. Acest proces a dus la formarea statului italian modern, care a fost completat în 1871, când Roma a devenit capitala Italiei. În secolul al XX-lea, Italia a fost implicată în ambele războaie mondiale. În Primul Război Mondial, Italia s-a alăturat Puterilor Aliate în 1915, în speranța că ar obține teritorii promițătoare de la Puterile Centrale. Luptele au fost concentrate în principal pe frontul italian în Alpii Orientali și au implicat confruntări dure cu trupele austro-ungare. După război, Italia a fost dezamăgită de rezultatele Conferinței de Pace de la Paris, care nu a satisfăcut așteptările sale teritoriale. Această perioadă a generat nemulțumiri și instabilitate politică în Italia, pregătind terenul pentru ascensiunea fascismului. În 1957, Italia a fost una dintre țările fondatoare ale Comunității Economice Europene (CEE), precursorul Uniunii Europene, semnând Tratatul de la Roma. Astfel, Italia a fost implicată încă de la început în procesul de integrare europeană. Italia este cunoscută pentru peisajele sale pitorești, patrimoniul său istoric și cultural bogat, bucătăria sa renumită și contribuțiile sale la domenii precum moda și designul.',
            'geography_completed': 0,
            'history_completed': 0,
            'doesExist': 1
          });

          await db.insert('country', {
            'name': 'China',
            'geographyLesson':
                'China, una dintre cele mai mari țări din lume ca suprafață și populație, este situată în Asia de Est, având granițe cu mai multe țări importante precum Rusia și Mongolia la nord, India, Nepal și Bhutan la sud, și Coreea de Nord, Vietnam și Laos la sud-est. Capitala sa, Beijing, este un centru cultural, economic și politic major, iar Shanghai este unul dintre cele mai mari orașe din lume, fiind un important centru financiar și comercial. Teritoriul Chinei este caracterizat de o varietate geografică impresionantă, cuprinzând munți, câmpii și regiuni de coastă. La vest, munții Himalaya formează o graniță naturală, iar la sud-vest se găsesc Munții Tian, care includ cel mai înalt vârf din China, vârful Everest. În partea de nord se află Munții Altai, iar la est se întind Munții Qinling. Aceste lanțuri muntoase influențează în mod semnificativ clima și geografia țării. Râurile majore, precum Yangtze și Fluviul Galben, traversează China, furnizând apă pentru irigații și transportul naval. Yangtze este al treilea cel mai lung râu din lume și are o importanță culturală și economică semnificativă, cu orașe importante precum Chongqing și Wuhan aflate pe malurile sale. O caracteristică geografică distinctivă a Chinei o reprezintă Marele Zid, o structură masivă de apărare construită de-a lungul secolelor pentru a proteja imperiul chinez împotriva invaziilor din nord. Acest monument istoric impresionant este o atracție turistică de prim rang și simbolizează bogata istorie și cultura a Chinei. China are și o coastă extinsă, cu orașe portuare importante precum Hong Kong, Guangzhou și Shenzhen. Aceste regiuni au jucat un rol crucial în dezvoltarea comerțului maritim și a economiei chineze moderne. În plus față de Beijing și Shanghai, alte orașe importante din China includ Guangzhou, Chengdu și Xi an, fiecare având caracteristici geografice și culturale distincte. China este o destinație turistică populară datorită patrimoniului său cultural bogat, precum și peisajelor naturale variate, cum ar fi Muntele Huangshan și Yangshuo Karst. Clima Chinei variază considerabil de la nord la sud și de la est la vest, cu regiuni temperate, subtropicale și tropicale. În nord, iernile sunt reci și uscate, în timp ce în sud verile sunt calde și umede. China include și mai multe regiuni autonome, cum ar fi Tibetul și Xinjiang, care au peisaje spectaculoase și o diversitate culturală remarcabilă. China este, de asemenea, renumită pentru bogata sa istorie culinară și diversitatea sa gastronomică, care variază de la mâncăruri picante din Sichuan la delicatese din Shanghai și fructe de mare din Canton.',
            'historyLesson':
                'În Asia de Est, se află o țară cu o istorie străveche și fascinantă - China. De-a lungul mileniilor, China a fost locuită de diverse civilizații și culturi, iar evoluția sa istorică a fost marcată de momente semnificative și transformări profunde. În perioada antică, China a fost locuită de numeroase triburi și regate, dar unificarea sa sub o autoritate centrală a început sub Dinastia Qin, care a condus în secolul al III-lea î.Hr. Dinastia Qin a fost urmată de Dinastiile Han, Tang și Song, perioade de prosperitate și inovație în domenii precum știința, tehnologia și arta. În Evul Mediu, China a cunoscut o serie de dinastii și imperii, precum Yuan (fondată de mongoli), Ming și Qing. În timpul dinastiei Tang și Song, China a fost un centru comercial și cultural important, fiind cunoscută pentru invențiile sale tehnologice precum tiparul mobil și busola. În secolul al XIX-lea, China a fost afectată de agresiunea imperialistă și influența puterilor străine, ceea ce a dus la războaiele opiumului și la Tratatul de la Nanking, care a deschis porțile Chinei pentru comerțul străin și a impus concesiuni teritoriale. Această perioadă de slăbiciune a statului chinez a culminat cu Revolta boxerilor și căderea dinastiei Qing. În secolul XX, China a trecut printr-o serie de schimbări politice și sociale semnificative. Revoluția din 1911 a condus la căderea sistemului imperial și la fondarea Republicii Chineze sub conducerea lui Sun Yat-sen. În 1949, Partidul Comunist Chinez, condus de Mao Zedong, a proclamat înființarea Republicii Populare Chineze, punând capăt unui secol de dominație străină și instabilitate internă. De-a lungul deceniilor, China a traversat reforme economice și sociale masive sub conducerea lui Deng Xiaoping și a succesorilor săi, transformându-se dintr-o economie planificată într-una orientată către piață și devenind una dintre cele mai mari puteri economice din lume. Astăzi, China este cunoscută pentru tehnologia sa avansată, economia sa în creștere rapidă și influența sa globală în domenii precum comerțul internațional și politica mondială. Pe lângă aceste aspecte, China are o istorie culturală bogată, cu contribuții semnificative în domenii precum filosofia, literatura, arta și arhitectura.',
            'geography_completed': 0,
            'history_completed': 0,
            'doesExist': 1
          });

          /*await db.insert('country', {
          'name': 'Australia',
          'geographyLesson': 'Australia, situată în emisfera sudică, este una dintre cele mai mari insule din lume și cea mai mare țară insulară. Cu o varietate de caracteristici geografice și regiuni distincte, Australia este un amestec captivant de peisaje și ecosisteme. Australia se învecinează cu Oceanul Indian și Marea Coralilor la vest și sud-vest, cu Oceanul Pacific la est și cu Marea Tasmaniei la sud-est. Nu are granițe terestre cu alte țări. Relieful Australiei este extrem de variat, cuprinzând munți, platouri, câmpii și deșerturi. Munții Great Dividing Range, care rulează de-a lungul coastei de est, sunt un element caracteristic și oferă peisaje spectaculoase. Clima din Australia variază de la aridă în interiorul deșertic al continentului până la temperată în regiunile de coastă și subtropicală în nord-est. Sezonul ploios în nord aduce precipitații abundente, în timp ce regiunile de coastă beneficiază de un climat mediteranean. Australia este bogată în resurse naturale, inclusiv minereuri, cărbune, aur, uraniu și petrol. De asemenea, dispune de o biodiversitate impresionantă, cu o varietate de specii de plante și animale, multe dintre ele endemice. Principalele centre urbane din Australia includ Sydney, Melbourne, Brisbane și Perth. Sydney-ul este centrul economic și cultural al țării, cunoscut pentru iconicul său Opera House, în timp ce Melbourne-ul este renumit pentru viața sa culturală vibrantă. Australia are o coastă lungă și variată, cu orașe portuare importante precum Sydney, Melbourne și Brisbane. Aceste orașe portuare joacă un rol crucial în comerțul maritim și economia australiană.',
          'historyLesson': 'Înainte de colonizarea europeană, teritoriul actual al Australiei era locuit de diverse populații indigene, cum ar fi aborigenii și insularii din Strâmtoarea Torres, fiecare având culturi și societăți distincte. Colonizarea europeană a început în secolul al XVIII-lea, odată cu sosirea exploratorilor olandezi și britanici. Această perioadă a adus conflicte între coloniști europeni și populațiile indigene, precum și schimbări semnificative în modul de viață al acestora din urmă. În secolul al XIX-lea, Australia a fost colonizată de britanici, iar unele regiuni au fost folosite ca colonii penale pentru deținuții britanici. Procesul de colonizare a dus la devastarea culturii și modului de viață al populațiilor indigene, precum și la confiscarea terenurilor lor. În secolul al XX-lea, Australia a devenit o națiune independentă, cu o economie în creștere și o societate în curs de modernizare. Participarea la ambele războaie mondiale și dezvoltarea economică ulterioară au contribuit la consolidarea identității naționale australiene. Australia a fost, de asemenea, marcată de politici discriminatorii împotriva populațiilor indigene, cum ar fi politica de asimilare și politica de separare a copiilor aborigeni de familiile lor. Aceste politici au fost contestate și criticate de-a lungul anilor și au dus la mișcări de protest și activism pentru drepturile indigenilor. În prezent, Australia se confruntă cu provocări precum reconcilierea cu populațiile indigene, conservarea mediului înconjurător și gestionarea imigrației. Cu toate acestea, țara rămâne unul dintre cei mai prosperi membri ai comunității mondiale și continuă să joace un rol important în afacerile internaționale.',
          'geography_completed': 0,
          'history_completed': 0,
          'doesExist': 1
        });

        await db.insert('country', {
          'name': 'South Africa',
          'geographyLesson': 'Africa de Sud, situată în sudul continentului african, este una dintre cele mai diverse și fascinante țări din lume. Cu o varietate de caracteristici geografice și regiuni distincte, Africa de Sud este un amestec captivant de peisaje și ecosisteme. Africa de Sud se învecinează cu Namibia, Botswana și Zimbabwe la nord, Mozambic și Swaziland la est, și cu Lesotho la sud. La vest, este mărginită de Oceanul Atlantic, iar la est de Oceanul Indian. Relieful Africii de Sud este extrem de variat, cuprinzând munți, platouri, câmpii și deșerturi. Munții Drakensberg, care se întind de-a lungul graniței de est, sunt un element caracteristic și oferă peisaje spectaculoase. Clima Africii de Sud variază de la aridă în deșerturile Kalahari și Namib până la temperată în regiunile de coastă și subtropicală în nord-est. Sezonul ploios în nord-est aduce precipitații abundente în timp ce regiunile de coastă beneficiază de un climat mediteranean. Africa de Sud este bogată în resurse naturale, inclusiv aur, diamante, cărbune, metale neferoase și petrol. De asemenea, dispune de o biodiversitate remarcabilă, cu o varietate de specii de plante și animale, inclusiv cele găsite în Parcul Național Kruger. Râul Orange este cel mai lung râu din Africa de Sud și este vital pentru agricultură și irigații. Lacurile principale includ Lacul Sibhayi și Lacul Chrissie. Principalele centre urbane din Africa de Sud includ Johannesburg, Pretoria, Cape Town și Durban. Johannesburg-ul este centrul economic al țării, cunoscut pentru industria minieră, în timp ce Cape Town-ul este renumit pentru frumusețea sa naturală și istoria sa bogată. Africa de Sud are o coastă lungă, cu orașe maritime importante precum Durban, Port Elizabeth și Cape Town. Aceste orașe portuare au jucat un rol crucial în dezvoltarea comerțului maritim și a economiei africane de sud.',
          'historyLesson': 'Înaintea colonizării europene, teritoriul actual al Africii de Sud era locuit de diverse populații indigene, precum khoikhoi, san și bantu, care aveau culturi și societăți distincte. Olandezii au fondat Cape Town-ul în 1652, marcând începutul colonizării europene. Această perioadă a adus conflicte și schimbări semnificative în modul de viață al populațiilor indigene. Colonizarea europeană a adus, de asemenea, conflicte între coloniștii europeni și populațiile indigene. Războaiele anglo-boere din secolul al XIX-lea au fost un exemplu major al acestor conflicte. Aceste lupte au fost caracterizate de dispute teritoriale și de lupte pentru putere între coloniștii britanici și boeri. În secolul al XX-lea, apartheidul a devenit politica oficială a guvernului Africii de Sud, instituind segregarea rasială și discriminarea împotriva majorității negre a populației. Acest sistem a fost intens contestat de mișcările de rezistență, cum ar fi Congresul Național African (ANC) și lideri precum Nelson Mandela, care au luptat pentru drepturile egale și sfârșitul apartheidului. Tranziția către democrație în Africii de Sud a avut loc în anii 1990, odată cu negocierile dintre guvernul sud-african și mișcările de opoziție. Nelson Mandela a devenit primul președinte negru al țării în 1994, marcând sfârșitul apartheidului și începutul unei noi ere în istoria Africii de Sud. De asemenea, în perioada post-apartheid, Africii de Sud a fost nevoită să se confrunte cu provocări precum reconcilierea națională, reconstrucția economică și combaterea inegalității sociale. Programul Truth and Reconciliation Commission (TRC), condus de președintele Mandela, a fost instituit pentru a investiga abuzurile comise în timpul apartheidului și a încerca să aducă reconciliere între comunitățile sud-africane. În prezent, Africii de Sud încă se confruntă cu provocări, cum ar fi sărăcia, inegalitatea economică, crimele violente și tensiunile etnice. Cu toate acestea, țara rămâne un simbol al rezistenței și al luptei pentru dreptate socială în întreaga lume.',
          'geography_completed': 0,
          'history_completed': 0,
          'doesExist': 1
        });

        await db.insert('country', {
          'name': 'Chile',
          'geographyLesson': 'Chile, situată în partea de vest a Americii de Sud, este una dintre cele mai diverse și interesante țări din lume. Cu o varietate de caracteristici geografice și regiuni distincte, Chile este un amestec captivant de peisaje și ecosisteme. Chile se întinde de-a lungul unei lungimi impresionante de aproximativ 4.300 de kilometri de la nord la sud, având ca vecini Peru la nord, Bolivia și Argentina la est, și Oceanul Pacific la vest. Această poziție îi conferă o varietate extraordinară de climă și teren. Relieful Chilei este extrem de variat, cuprinzând munți, deșerturi, câmpii și păduri. Cordiliera Anzi, care rulează de-a lungul întregii țări, este una dintre caracteristicile geografice dominante. În nord, deșertul Atacama este unul dintre cele mai aride deșerturi din lume, în timp ce la sud se află regiunea Patagoniei, caracterizată de peisaje montane, fiorduri și ghețari. Clima din Chile variază în funcție de regiune. De la climat arid în deșerturile din nord până la temperat în regiunile de coastă și subpolar în sud, Chile experimentează o gamă largă de condiții climatice. Chile este bogată în resurse naturale, inclusiv cupru, aur, argint, cărbune și păduri. De asemenea, dispune de o biodiversitate impresionantă, cu o varietate de specii de plante și animale, atât pe uscat, cât și în apele sale. Principalele centre urbane din Chile includ Santiago, Valparaíso, Concepción și Antofagasta. Santiago este centrul economic și cultural al țării, fiind situat în Valea Centrală, iar Valparaíso este un important port maritim și centru cultural. Chile are o coastă lungă și variată, cu orașe portuare importante precum Valparaíso, Antofagasta și Puerto Montt. Aceste orașe portuare joacă un rol crucial în comerțul maritim și economia chiliană.',
          'historyLesson': 'Înainte de colonizarea europeană, teritoriul actual al Chilei era locuit de diverse popoare indigene, printre care mapuche, aymara și incașe, fiecare cu culturi și societăți distincte. Colonizarea spaniolă a început în secolul al XVI-lea, odată cu sosirea lui Diego de Almagro și Pedro de Valdivia. Această perioadă a adus conflicte între spanioli și populațiile indigene, precum și schimbări semnificative în viața acestora din urmă. În secolul al XIX-lea, Chile a fost implicat în războaie de independență împotriva Spaniei, alăturându-se mișcării de independență sud-americane conduse de figuri precum Bernardo O Higgins și José de San Martín. Independența a fost obținută în 1818, iar Chile a devenit o republică independentă. În secolele XIX și XX, Chile a fost marcat de instabilitate politică, conflicte teritoriale și modernizare economică. Perioada prelungită a lui Diego Portales a adus stabilitate politică și reforme economice semnificative. În secolul al XX-lea, Chile a fost dominat de politica polarizată, inclusiv prin președinții Arturo Alessandri și Salvador Allende. Lovitura de stat militară din 1973 a condus la preluarea puterii de către generalul Augusto Pinochet, marcând o perioadă întunecată a istoriei Chilei, caracterizată prin încălcări grave ale drepturilor omului și represiune politică. Tranziția către democrație în Chile a avut loc în anii 1980 și 1990, odată cu sfârșitul regimului lui Pinochet și reinstaurarea guvernului civil. Chile a devenit un exemplu de succes al tranziției de la dictatură la democrație în America Latină. În prezent, Chile se confruntă cu provocări precum inegalitatea economică, proteste sociale și degradarea mediului înconjurător. Cu toate acestea, țara continuă să avanseze în domenii precum educația, tehnologia și dezvoltarea economică, rămânând unul dintre cei mai stabili și prosperi membri ai comunității sud-americane.',
          'geography_completed': 0,
          'history_completed': 0,
          'doesExist': 1
        });*/

          await db.insert('question', {
            'country': 'Spain',
            'subject': 1,
            'difficulty': 1,
            'question_text':
                'Care este capitala Spaniei și cel mai mare oraș al țării?',
            'answer': answer1,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Spain',
            'subject': 1,
            'difficulty': 1,
            'question_text':
                'Care lanț muntos formează granița nordică a Spaniei?',
            'answer': answer2,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Spain',
            'subject': 1,
            'difficulty': 1,
            'question_text': 'Care este cel mai înalt vârf din Spania?',
            'answer': answer3,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Spain',
            'subject': 1,
            'difficulty': 1,
            'question_text':
                'Care dintre următoarele orașe nu este situat în Spania?',
            'answer': answer4,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Spain',
            'subject': 1,
            'difficulty': 1,
            'question_text':
                'Care dintre următoarele insule nu aparține Spaniei?',
            'answer': answer5,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Spain',
            'subject': 1,
            'difficulty': 1,
            'question_text': 'Ce mare înconjoară coasta de sud a Spaniei?',
            'answer': answer6,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Spain',
            'subject': 1,
            'difficulty': 1,
            'question_text':
                'Care este cea mai mare insulă din Insulele Canare ca suprafață?',
            'answer': answer7,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Spain',
            'subject': 1,
            'difficulty': 1,
            'question_text':
                'Care este râul principal care străbate capitala Spaniei?',
            'answer': answer8,
            'correct_answer': 4,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Spain',
            'subject': 1,
            'difficulty': 1,
            'question_text': 'Care este cel mai lung râu din Spania?',
            'answer': answer9,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Spain',
            'subject': 1,
            'difficulty': 1,
            'question_text':
                'Care este climatul predominant în regiunile de coastă ale Spaniei?',
            'answer': answer10,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Spain',
            'subject': 1,
            'difficulty': 2,
            'question_text':
                'Ce caracterizează clima în regiunile de coastă ale Spaniei?',
            'answer': answer11,
            'correct_answer': 4,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Spain',
            'subject': 1,
            'difficulty': 2,
            'question_text':
                'Care lanț muntos formează granița dintre Spania și Portugalia?',
            'answer': answer12,
            'correct_answer': 4,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Spain',
            'subject': 1,
            'difficulty': 2,
            'question_text':
                'Care dintre aceste orașe spaniole este situat pe coasta de est a țării?',
            'answer': answer13,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Spain',
            'subject': 1,
            'difficulty': 2,
            'question_text': 'Care este populația Spaniei?',
            'answer': '',
            'correct_answer': 47,
            'type': 2
          });

          await db.insert('question', {
            'country': 'Spain',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'Cine a fost unul dintre marii exploratori spanioli din secolele XVI-XVII, care a descoperit America?',
            'answer': answer14,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Spain',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'Care dintre următoarele regate NU a făcut parte din Spania medievală?',
            'answer': answer15,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Spain',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'Ce eveniment important din istoria Spaniei a fost realizat prin căsătoria regilor Ferdinand al II-lea al Aragonului și Isabela I a Castiliei?',
            'answer': answer16,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Spain',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'Care dintre următoarele figuri NU a fost un cuceritor spaniol din epoca colonială?',
            'answer': answer17,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Spain',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'Care a fost perioada de conducere a dictatorului Francisco Franco în Spania?',
            'answer': answer18,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Spain',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'Cine a fost ultimul monarh care a domnit înaintea începerii dictaturii lui Francisco Franco?',
            'answer': answer19,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Spain',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'Ce perioadă istorică a marcat pierderea majorității coloniilor americane ale Spaniei?',
            'answer': answer20,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Spain',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'Care a fost decizia semnificativă din 1492 care a consolidat controlul catolic asupra regatului spaniol?',
            'answer': answer21,
            'correct_answer': 4,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Spain',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'Care a fost perioada de tranziție către democrație în Spania, după moartea lui Franco?',
            'answer': answer22,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Spain',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'Care este forma de guvernământ actuală a Spaniei?',
            'answer': answer23,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Spain',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Care dintre următoarele regate a fost ultimul care s-a unit cu celelalte pentru a forma Spania modernă?',
            'answer': answer24,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Spain',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Cine a fost primul rege al Spaniei, după unificarea regatelor Aragonului și Castiliei?',
            'answer': answer25,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Spain',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Care dintre următoarele țări NU a fost colonizată de spanioli în timpul expansiunii lor în secolele XVI-XVII?',
            'answer': answer26,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Spain',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Ce eveniment important a marcat începutul Reconquistei în Spania medievală?',
            'answer': answer27,
            'correct_answer': 4,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Spain',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Care dintre următoarele personalități a jucat un rol cheie în Reconquista?',
            'answer': answer28,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Spain',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Care a fost principalul motiv al expulzării evreilor și maurilor din Spania în 1492?',
            'answer': answer29,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Spain',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Care dintre următoarele figuri a condus o expediție navală în 1492, care a dus la descoperirea Americii?',
            'answer': answer30,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Spain',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Care a fost efectul principal al Reconquistei în Spania medievală?',
            'answer': answer31,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Spain',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'În care dintre următoarele conflicte a fost implicată Spania în secolul al XIX-lea, pierzând majoritatea coloniilor sale americane?',
            'answer': answer32,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Spain',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Care a fost numele coloniei spaniole din America de Nord fondată de Juan Ponce de León în 1513?',
            'answer': answer33,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'France',
            'subject': 1,
            'difficulty': 1,
            'question_text': 'Care este capitala Franței?',
            'answer': answer34,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'France',
            'subject': 1,
            'difficulty': 1,
            'question_text': 'Care este cel mai înalt vârf al Franței?',
            'answer': answer35,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'France',
            'subject': 1,
            'difficulty': 1,
            'question_text':
                'Care este principala atracție turistică din Paris?',
            'answer': answer36,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'France',
            'subject': 1,
            'difficulty': 1,
            'question_text':
                'Care sunt munții care formează granița sud-vestică a Franței?',
            'answer': answer37,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'France',
            'subject': 1,
            'difficulty': 1,
            'question_text':
                'Care este cel mai important râu din Franța, cunoscut pentru traversarea capitalei?',
            'answer': answer38,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'France',
            'subject': 1,
            'difficulty': 1,
            'question_text':
                'Care este regiunea franceză cunoscută pentru stațiunile de lux și plajele frumoase?',
            'answer': answer39,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'France',
            'subject': 1,
            'difficulty': 1,
            'question_text': 'Câtă populație aproximativă are Franța?',
            'answer': '',
            'correct_answer': 67,
            'type': 2
          });

          await db.insert('question', {
            'country': 'France',
            'subject': 1,
            'difficulty': 2,
            'question_text': 'Care este cel mai lung râu din Franța?',
            'answer': answer45,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'France',
            'subject': 1,
            'difficulty': 2,
            'question_text':
                'Care este numele arhipelagului situat în largul coastelor Franței în Marea Mediterană?',
            'answer': answer46,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'France',
            'subject': 1,
            'difficulty': 2,
            'question_text':
                'Câte țări se învecinează direct cu Franța și care sunt acestea?',
            'answer': answer47,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'France',
            'subject': 1,
            'difficulty': 2,
            'question_text':
                'Ce caracteristică a culturii franțuzești este renumită în întreaga lume?',
            'answer': answer45,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'France',
            'subject': 1,
            'difficulty': 2,
            'question_text':
                'Cum variază clima Franței și cum influențează aceasta agricultura și turismul?',
            'answer': answer49,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'France',
            'subject': 1,
            'difficulty': 2,
            'question_text':
                'Care regiune montană marchează granița dintre Franța și Italia și include cel mai înalt vârf al Franței, Mont Blanc?',
            'answer': answer50,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'France',
            'subject': 1,
            'difficulty': 1,
            'question_text':
                'Ce regiune din Franța este cunoscută pentru vinurile sale fine?',
            'answer': answer41,
            'correct_answer': 4,
            'type': 1
          });

          await db.insert('question', {
            'country': 'France',
            'subject': 1,
            'difficulty': 2,
            'question_text':
                'Ce parte a Franței este cunoscută pentru climatul mediteranean și plajele sale?',
            'answer': answer42,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'France',
            'subject': 1,
            'difficulty': 2,
            'question_text':
                'Care este numele regiunii franceze renumite pentru peisajele sale sălbatice și stâncile impresionante?',
            'answer': answer47,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'France',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'Care a fost una dintre provinciile romane în care a fost încorporată Franța în antichitate?',
            'answer': answer54,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'France',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'Cine a condus Franța în timpul Revoluției Franceze din 1789?',
            'answer': answer55,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'France',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'Care a fost perioada de dominație a lui Napoleon Bonaparte în Franța?',
            'answer': answer56,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'France',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'Ce eveniment a pus capăt monarhiei în Franța și a instaurat o republică în 1789?',
            'answer': answer57,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'France',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'Care a fost perioada de ocupație a Franței de către forțele naziste între 1940 și 1944?',
            'answer': answer58,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'France',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'Care a fost numele celei de-a treia perioade a istoriei Franceze, după Revoluția Franceză și perioada napoleoniană?',
            'answer': answer59,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'France',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'Cine a fost regele francez care a condus în timpul Revoluției Franceze și care a fost executat?',
            'answer': answer60,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'France',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'În ce an a avut loc bătălia de la Waterloo, în care Napoleon a fost învins definitiv?',
            'answer': answer61,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'France',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'Care dintre următorii nu a fost un rege important al Franței în Evul Mediu?',
            'answer': answer62,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'France',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'Care a fost una dintre coloniile importante pierdute de Franța în timpul procesului de decolonizare în secolul al XX-lea?',
            'answer': answer63,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'France',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Care a fost perioada de domnie a regelui Ludovic al XIV-lea, cunoscut și sub numele de "Regele Soare"?',
            'answer': answer64,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'France',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Ce nume a primit conflictul dintre Franța și Prusia care a dus la înfrângerea Franței și instaurarea celei de-a Treia Republici în 1870?',
            'answer': answer65,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'France',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Care a fost perioada de domnie a regelui Ludovic al XVI-lea și a reginei Marie Antoinette?',
            'answer': answer66,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'France',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Cine a fost celebrul general francez care a condus forțele aliate în timpul Bătăliei de la Waterloo împotriva lui Napoleon?',
            'answer': answer67,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'France',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Care a fost capitala Franței în timpul Revoluției Franceze?',
            'answer': answer68,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'France',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Care a fost perioada de domnie a împăratului Napoleon al III-lea, nepotul lui Napoleon Bonaparte?',
            'answer': answer69,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'France',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Cine a fost regele francez care a condus în timpul Războiului de O Sută de Ani împotriva Angliei?',
            'answer': answer70,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'France',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Care a fost numele reginei franceze care a jucat un rol important în conducerea țării în timpul minorității fiului ei, Ludovic al XIV-lea?',
            'answer': answer71,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'France',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Care a fost numele mișcării politice și sociale care a dus la începutul Revoluției Franceze și la căderea monarhiei?',
            'answer': answer72,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'France',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Cine a fost generalul francez care a condus forțele franceze în timpul Războiului Franco-Prusac și a fost capturat în bătălia de la Sedan?',
            'answer': answer73,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Italy',
            'subject': 1,
            'difficulty': 1,
            'question_text': 'Care este capitala Italiei?',
            'answer': answer74,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Italy',
            'subject': 1,
            'difficulty': 1,
            'question_text': 'Care este cel mai mare lanț muntos din Italia?',
            'answer': answer75,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Italy',
            'subject': 1,
            'difficulty': 1,
            'question_text': 'Care este cel mai înalt vârf din Italia?',
            'answer': answer76,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Italy',
            'subject': 1,
            'difficulty': 1,
            'question_text': 'Cât de mare este populația Italiei?',
            'answer': '',
            'correct_answer': 2,
            'type': 2
          });

          await db.insert('question', {
            'country': 'Italy',
            'subject': 1,
            'difficulty': 1,
            'question_text': 'Care este cea mai mare insulă din Italia?',
            'answer': answer78,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Italy',
            'subject': 1,
            'difficulty': 1,
            'question_text': 'Care este principala sursă de apă din Italia?',
            'answer': answer79,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Italy',
            'subject': 1,
            'difficulty': 1,
            'question_text': 'Care este clima predominantă în sudul Italiei?',
            'answer': answer80,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Italy',
            'subject': 1,
            'difficulty': 1,
            'question_text':
                'Care este cel mai cunoscut oraș pentru canalele sale?',
            'answer': answer81,
            'correct_answer': 4,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Italy',
            'subject': 1,
            'difficulty': 1,
            'question_text': 'Ce ape înconjoară Peninsula Italică?',
            'answer': answer82,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Italy',
            'subject': 1,
            'difficulty': 1,
            'question_text': 'Care este cea mai populată insulă din Italia?',
            'answer': answer83,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Italy',
            'subject': 1,
            'difficulty': 2,
            'question_text':
                'Care este altitudinea vârfului Monte Rosa din Alpii Graiei?',
            'answer': answer84,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Italy',
            'subject': 1,
            'difficulty': 2,
            'question_text':
                'Care este numele râului principal din nordul Italiei, cunoscut pentru inundațiile sale istorice?',
            'answer': answer85,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Italy',
            'subject': 1,
            'difficulty': 2,
            'question_text':
                'Care insulă italiană este cunoscută pentru forma sa de stiletto?',
            'answer': answer86,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Italy',
            'subject': 1,
            'difficulty': 2,
            'question_text':
                'Care este numele celor două insule italiene situate în Marea Mediterană, aproape de coasta africană?',
            'answer': answer87,
            'correct_answer': 4,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Italy',
            'subject': 1,
            'difficulty': 2,
            'question_text': 'Care este cel mai înalt vârf din Alpii Graiei?',
            'answer': answer88,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Italy',
            'subject': 1,
            'difficulty': 2,
            'question_text':
                'Care oraș italian este renumit pentru festivalul său de carnevale?',
            'answer': answer89,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Italy',
            'subject': 1,
            'difficulty': 2,
            'question_text':
                'Care este numele celei mai lungi râpe subterane din Italia?',
            'answer': answer90,
            'correct_answer': 4,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Italy',
            'subject': 1,
            'difficulty': 2,
            'question_text': 'Care este numele celui mai mare lac din Italia?',
            'answer': answer91,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Italy',
            'subject': 1,
            'difficulty': 2,
            'question_text':
                'Care munte vulcanic se află în apropierea orașului Napoli?',
            'answer': answer92,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Italy',
            'subject': 1,
            'difficulty': 2,
            'question_text':
                'Care regiune italiană este cunoscută pentru producția sa de vin Chianti?',
            'answer': answer93,
            'correct_answer': 1,
            'type': 1
          });
          await db.insert('question', {
            'country': 'Italy',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'Care regiune italiană este cunoscută pentru producția sa de vin Chianti?',
            'answer': answer94,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Italy',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Care a fost capitala Italiei după finalizarea procesului de unificare?',
            'answer': answer95,
            'correct_answer': 4,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Italy',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'În ce perioadă a fost Italia epicentrul unei puternice mișcări culturale și artistice?',
            'answer': answer96,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Italy',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Ce perioadă istorică este cunoscută pentru competiția între diverse state și republici independente în Italia?',
            'answer': answer97,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Italy',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Ce evenimente importante s-au întâmplat în Italia în timpul secolului al XX-lea, în contextul Primului Război Mondial?',
            'answer': answer98,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Italy',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'Cine a fost unul dintre artiștii renumiți ai Renașterii italiene?',
            'answer': answer99,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Italy',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Care au fost principalele conflicte politice și transformări în Italia în secolele XVIII și XIX?',
            'answer': answer100,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Italy',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'Cum s-a implicat Italia în Primul Război Mondial?',
            'answer': answer101,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Italy',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'Care a fost una dintre principalele consecințe ale Conferinței de Pace de la Paris pentru Italia după Primul Război Mondial?',
            'answer': answer102,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Italy',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'Care au fost unele dintre statele și republicile independente din Italia medievală?',
            'answer': answer103,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Italy',
            'subject': 2,
            'difficulty': 2,
            'question_text': 'Când a devenit completă unificarea Italiei?',
            'answer': answer104,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Italy',
            'subject': 2,
            'difficulty': 2,
            'question_text': 'Când a fost fondată Republica Romană?',
            'answer': answer105,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Italy',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'Care a fost una dintre personalitățile care au contribuit la formarea Imperiului Roman?',
            'answer': answer106,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Italy',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Ce perioadă a generat nemulțumiri și instabilitate politică în Italia, pregătind terenul pentru ascensiunea fascismului?',
            'answer': answer107,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Italy',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Care a fost una dintre principalele motive pentru care Italia s-a alăturat Puterilor Aliate în Primul Război Mondial?',
            'answer': answer108,
            'correct_answer': 4,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Italy',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Care a fost una dintre cele mai concentrate zone de luptă în Italia în timpul Primului Război Mondial?',
            'answer': answer109,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Italy',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Când a fost Italia una dintre țările fondatoare ale Comunității Economice Europene (CEE)?',
            'answer': answer110,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Italy',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Care a fost una dintre personalitățile care a contribuit la procesul de unificare a Italiei în secolul al XIX-lea?',
            'answer': answer111,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Italy',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Ce domenii sunt menționate ca fiind influențate de cultura italiană?',
            'answer': answer112,
            'correct_answer': 4,
            'type': 1
          });

          await db.insert('question', {
            'country': 'China',
            'subject': 1,
            'difficulty': 1,
            'question_text': 'Care este capitala Chinei?',
            'answer': answer114,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'China',
            'subject': 1,
            'difficulty': 1,
            'question_text': 'Care este cel mai înalt vârf din China?',
            'answer': answer115,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'China',
            'subject': 1,
            'difficulty': 1,
            'question_text':
                'Ce râu este al treilea cel mai lung râu din lume și traversează China?',
            'answer': answer116,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'China',
            'subject': 1,
            'difficulty': 1,
            'question_text':
                'Care lanț muntos formează granița de nord-est a Chinei?',
            'answer': answer117,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'China',
            'subject': 1,
            'difficulty': 1,
            'question_text':
                'Ce monument istoric impresionant este construit de-a lungul graniței nordice a Chinei?',
            'answer': answer118,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'China',
            'subject': 1,
            'difficulty': 1,
            'question_text':
                'Care oraș chinez este renumit pentru industria sa tehnologică și comercială?',
            'answer': answer119,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'China',
            'subject': 1,
            'difficulty': 1,
            'question_text':
                'Ce regiune autonomă din China este cunoscută pentru peisajele sale spectaculoase și cultura sa distinctă?',
            'answer': answer120,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'China',
            'subject': 1,
            'difficulty': 1,
            'question_text':
                'Care râu chinez se numește și "Râul Galben" datorită sedimentelor sale?',
            'answer': answer121,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'China',
            'subject': 1,
            'difficulty': 1,
            'question_text': 'Ce climă predomină în nordul Chinei?',
            'answer': answer122,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'China',
            'subject': 1,
            'difficulty': 1,
            'question_text': 'Care este cel mai populat oraș din China?',
            'answer': answer123,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'China',
            'subject': 1,
            'difficulty': 2,
            'question_text':
                'Care dintre aceste orașe chineze se află pe malurile Fluviului Yangtze?',
            'answer': answer124,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'China',
            'subject': 1,
            'difficulty': 2,
            'question_text': 'Care este cel mai înalt lanț muntos din China?',
            'answer': answer125,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'China',
            'subject': 1,
            'difficulty': 2,
            'question_text':
                'Care oraș chinez este cunoscut pentru ceramica sa?',
            'answer': answer126,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'China',
            'subject': 1,
            'difficulty': 2,
            'question_text':
                'Care regiune chineză este cunoscută pentru arhitectura sa tradițională și canalele sale?',
            'answer': answer127,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'China',
            'subject': 1,
            'difficulty': 2,
            'question_text':
                'Care insulă chineză este renumită pentru plajele sale și turismul său?',
            'answer': answer128,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'China',
            'subject': 1,
            'difficulty': 2,
            'question_text':
                'Care lanț muntos chinez formează o parte a graniței cu Nepalul?',
            'answer': answer129,
            'correct_answer': 4,
            'type': 1
          });

          await db.insert('question', {
            'country': 'China',
            'subject': 1,
            'difficulty': 2,
            'question_text':
                'Care dintre aceste lanțuri muntoase nu traversează China?',
            'answer': answer130,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'China',
            'subject': 1,
            'difficulty': 1,
            'question_text':
                'Ce regiune chineză este cunoscută pentru producția sa de ceai?',
            'answer': answer131,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'China',
            'subject': 1,
            'difficulty': 1,
            'question_text':
                'Care regiune chineză este cunoscută pentru bucătăria sa picantă?',
            'answer': answer133,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'China',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'Care a fost perioada în care China a fost locuită de numeroase triburi și regate înainte de unificarea sub o autoritate centrală?',
            'answer': answer134,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'China',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'Care dinastie a început procesul de unificare a Chinei sub o autoritate centrală?',
            'answer': answer135,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'China',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'Care dinastie chineză a fost cunoscută pentru invențiile tehnologice precum tiparul mobil și busola?',
            'answer': answer136,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'China',
            'subject': 2,
            'difficulty': 1,
            'question_text': 'Ce imperiu a fost fondat de mongoli în China?',
            'answer': answer137,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'China',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'Care a fost perioada în care China a fost un centru comercial și cultural important, cunoscută pentru inovațiile tehnologice?',
            'answer': answer138,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'China',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'Care au fost două evenimente semnificative care au marcat influența imperialistă asupra Chinei în secolul al XIX-lea?',
            'answer': answer139,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'China',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'Ce tratat a fost semnat în urma războaielor opiumului și care au fost consecințele acestuia pentru China?',
            'answer': answer140,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'China',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'Care a fost ultima dinastie imperială a Chinei și când a căzut?',
            'answer': answer141,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'China',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'Cine a fost liderul revoluției care a condus la căderea sistemului imperial în China în 1911?',
            'answer': answer142,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'China',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'Când a fost proclamată înființarea Republicii Populare Chineze și cine a fost liderul partidului care a condus această proclamare?',
            'answer': answer143,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'China',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Sub conducerea cui China a trecut printr-o serie de reforme economice și sociale masive în anii \'80?',
            'answer': answer144,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'China',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Cum a transformat China economia sa în timpul reformelor lui Deng Xiaoping?',
            'answer': answer145,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'China',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Care sunt trei aspecte pentru care este cunoscută China astăzi în contextul global?',
            'answer': answer146,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'China',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'În afară de economie și tehnologie, ce alte domenii au contribuit la istoria culturală bogată a Chinei?',
            'answer': answer147,
            'correct_answer': 4,
            'type': 1
          });

          await db.insert('question', {
            'country': 'China',
            'subject': 2,
            'difficulty': 2,
            'question_text': 'Cine a fost fondatorul dinastiei Qin din China?',
            'answer': answer148,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'China',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Care a fost capitala Chinei în timpul dinastiei Tang?',
            'answer': answer149,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'China',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Care dinastie chineză a construit celebrul Zid Chinezesc?',
            'answer': answer150,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'China',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Cine a fost liderul rebelilor în timpul Revoltei boxerilor?',
            'answer': answer151,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'China',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Ce eveniment a marcat sfârșitul perioadei de dominație străină și instabilitate internă în China?',
            'answer': answer152,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'China',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Care a fost sloganul principal al lui Deng Xiaoping în timpul reformelor economice din China?',
            'answer': answer153,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'United States',
            'subject': 2,
            'difficulty': 1,
            'question_text': 'Care sunt granițele geografice ale SUA?',
            'answer': answer154,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'United States',
            'subject': 1,
            'difficulty': 2,
            'question_text': 'Care sunt granițele geografice ale SUA?',
            'answer': answer206,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'United States',
            'subject': 1,
            'difficulty': 2,
            'question_text': 'Care este capitala SUA?',
            'answer': answer207,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'United States',
            'subject': 1,
            'difficulty': 2,
            'question_text':
                'Care este caracteristica geografică iconică a SUA?',
            'answer': answer208,
            'correct_answer': 1,
            'type': 1
          });
          await db.insert('question', {
            'country': 'United States',
            'subject': 1,
            'difficulty': 2,
            'question_text': 'Las Vegas este un oras important',
            'answer': '',
            'correct_answer': 1,
            'type': 4
          });
          await db.insert('question', {
            'country': 'United States',
            'subject': 1,
            'difficulty': 1,
            'question_text': 'Ce râuri majore traversează teritoriul SUA?',
            'answer': answer209,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'United States',
            'subject': 1,
            'difficulty': 1,
            'question_text':
                'Care sunt principalele caracteristici geografice ale teritoriului SUA?',
            'answer': answer210,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'United States',
            'subject': 1,
            'difficulty': 1,
            'question_text': 'Care este varietatea climatică a SUA ?',
            'answer': answer211,
            'correct_answer': 4,
            'type': 1
          });

          await db.insert('question', {
            'country': 'United States',
            'subject': 2,
            'difficulty': 1,
            'question_text': 'Care este capitala SUA?',
            'answer': answer155,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'United States',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'Care este caracteristica geografică iconică a SUA?',
            'answer': answer156,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'United States',
            'subject': 2,
            'difficulty': 1,
            'question_text': 'Ce râuri majore traversează teritoriul SUA?',
            'answer': answer157,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'United States',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'Care este importanța râului Mississippi pentru țară?',
            'answer': answer158,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'United States',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'Care sunt principalele caracteristici geografice ale teritoriului SUA?',
            'answer': answer159,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'United States',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'Ce rol au orașele portuare ale SUA în economia țării?',
            'answer': answer160,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'United States',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'Numește trei orașe importante din SUA, în afară de capitală și cel mai mare oraș.',
            'answer': answer161,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'United States',
            'subject': 2,
            'difficulty': 1,
            'question_text': 'Care este varietatea climatică a SUA?',
            'answer': answer162,
            'correct_answer': 4,
            'type': 1
          });

          await db.insert('question', {
            'country': 'United States',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'Ce parcuri naționale din SUA sunt menționate în lecție?',
            'answer': answer163,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'United States',
            'subject': 2,
            'difficulty': 1,
            'question_text': 'Care este importanța economică a coastelor SUA?',
            'answer': answer164,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'United States',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Care sunt teritoriile SUA în afara continentului principal?',
            'answer': answer165,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'United States',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Cum variază climatul în funcție de poziția geografică în SUA?',
            'answer': answer166,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'United States',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Ce caracteristică geografică a SUA influențează economia și transportul intern?',
            'answer': answer167,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'United States',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Numește două state care au terenuri deșertice în SUA.',
            'answer': answer168,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'United States',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Ce reprezintă Marea de Est, menționată în lecție?',
            'answer': answer169,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'United States',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Care dintre următoarele animale este asociat cu Parcul Național Yellowstone?',
            'answer': answer170,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'United States',
            'subject': 2,
            'difficulty': 2,
            'question_text': 'Ce stat găzduiește Munții Stâncoși?',
            'answer': answer171,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'United States',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Ce mâncăruri tradiționale sunt menționate în contextul diversității culinare a SUA?',
            'answer': answer172,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'United States',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Care sunt două dintre teritoriile SUA menționate în lecție, în afară de Hawaii și Puerto Rico?',
            'answer': answer173,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Romania',
            'subject': 1,
            'difficulty': 1,
            'question_text': '',
            'answer': answer174,
            'correct_answer': 1,
            'type': 3
          });

          await db.insert('question', {
            'country': 'Romania',
            'subject': 1,
            'difficulty': 1,
            'question_text': 'Care este capitala României?',
            'answer': answer175,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Romania',
            'subject': 1,
            'difficulty': 1,
            'question_text': 'Care este populatia României?',
            'answer': '',
            'correct_answer': 19,
            'type': 2
          });

          await db.insert('question', {
            'country': 'Romania',
            'subject': 1,
            'difficulty': 1,
            'question_text': 'Ce fluviu trece prin România?',
            'answer': answer177,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Romania',
            'subject': 1,
            'difficulty': 1,
            'question_text': 'Care oraș nu este situat în România?',
            'answer': answer178,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Romania',
            'subject': 1,
            'difficulty': 1,
            'question_text': 'Care este cel mai înalt vârf din România?',
            'answer': answer179,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Romania',
            'subject': 1,
            'difficulty': 1,
            'question_text': 'Care este clima României?',
            'answer': answer180,
            'correct_answer': 4,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Romania',
            'subject': 1,
            'difficulty': 1,
            'question_text': 'Cum sunt verile în România?',
            'answer': answer181,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Romania',
            'subject': 1,
            'difficulty': 1,
            'question_text':
                'România este una dintre cele mai populate țări din',
            'answer': answer182,
            'correct_answer': 4,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Romania',
            'subject': 1,
            'difficulty': 1,
            'question_text': 'Care regiune nu este in România?',
            'answer': answer183,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Romania',
            'subject': 1,
            'difficulty': 1,
            'question_text': 'Ucraina este vecină cu România',
            'answer': '',
            'correct_answer': 1,
            'type': 4
          });

          await db.insert('question', {
            'country': 'Romania',
            'subject': 1,
            'difficulty': 2,
            'question_text': 'Care țară nu este vecină cu România? ',
            'answer': answer184,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Romania',
            'subject': 1,
            'difficulty': 2,
            'question_text': 'Ce porturi oferă acces la Marea Neagră?',
            'answer': answer186,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Romania',
            'subject': 1,
            'difficulty': 2,
            'question_text': 'Ce munte împarte teritoriul României?',
            'answer': answer185,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Romania',
            'subject': 1,
            'difficulty': 2,
            'question_text': 'În ce stadiu se află România?',
            'answer': answer187,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Romania',
            'subject': 1,
            'difficulty': 2,
            'question_text': 'În ce munte se află Vârful Moldoveanu?',
            'answer': answer188,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Romania',
            'subject': 1,
            'difficulty': 2,
            'question_text': 'Pentru ce este cunoscută Transilvania?',
            'answer': answer189,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Romania',
            'subject': 1,
            'difficulty': 2,
            'question_text': 'De ce este influențată clima României?',
            'answer': answer190,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Romania',
            'subject': 1,
            'difficulty': 2,
            'question_text': 'Care locație este mai populară vara?',
            'answer': answer191,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Romania',
            'subject': 1,
            'difficulty': 2,
            'question_text': 'Care locație este mai populară iarna?',
            'answer': answer192,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Romania',
            'subject': 1,
            'difficulty': 2,
            'question_text': 'România este membră NATO',
            'answer': '',
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Romania',
            'subject': 1,
            'difficulty': 2,
            'question_text': 'Populația României în milioane este',
            'answer': '',
            'correct_answer': 19,
            'type': 2
          });

          await db.insert('question', {
            'country': 'Romania',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'În vremurile străvechi, ce popor locuia pe teritoriul României?',
            'answer': answer194,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Romania',
            'subject': 2,
            'difficulty': 1,
            'question_text': 'Ce imperiu a cucerit Dacia?',
            'answer': answer195,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Romania',
            'subject': 2,
            'difficulty': 1,
            'question_text': 'Ce principat aparținea teritoriului românesc? ',
            'answer': answer196,
            'correct_answer': 3,
            'type': 2
          });

          await db.insert('question', {
            'country': 'Romania',
            'subject': 2,
            'difficulty': 1,
            'question_text': 'În ce an a avut Unirea Principatelor Române?',
            'answer': '',
            'correct_answer': 1859,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Romania',
            'subject': 2,
            'difficulty': 1,
            'question_text': 'Ce fel de regim adoptă România în anul 1947?',
            'answer': answer198,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Romania',
            'subject': 2,
            'difficulty': 1,
            'question_text': '',
            'answer': answer197,
            'correct_answer': 1,
            'type': 3
          });

          await db.insert('question', {
            'country': 'Romania',
            'subject': 2,
            'difficulty': 1,
            'question_text': 'Marea Unire a avut loc în anul 1925',
            'answer': "",
            'correct_answer': 2,
            'type': 4
          });

          await db.insert('question', {
            'country': 'Romania',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'În ce an și-a proclamat România independența față de Imperiul Otoman?',
            'answer': '',
            'correct_answer': 1877,
            'type': 2
          });

          await db.insert('question', {
            'country': 'Romania',
            'subject': 2,
            'difficulty': 1,
            'question_text': 'În ce an a căzut comunismul în România?',
            'answer': '',
            'correct_answer': 1989,
            'type': 2
          });

          await db.insert('question', {
            'country': 'Romania',
            'subject': 2,
            'difficulty': 1,
            'question_text': 'În ce an devine România membră UE?',
            'answer': answer199,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Romania',
            'subject': 2,
            'difficulty': 1,
            'question_text': 'Cine este actualul președinte al României?',
            'answer': answer200,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Romania',
            'subject': 2,
            'difficulty': 2,
            'question_text': 'Cine a domnit Moldova în epoca medievală?',
            'answer': answer201,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Romania',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'În timpul celui de-al Doilea Război Mondial, ce putere ocupă România?',
            'answer': answer202,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Romania',
            'subject': 2,
            'difficulty': 2,
            'question_text': 'În ce an a fost cucerită Dacia?',
            'answer': '',
            'correct_answer': 106,
            'type': 2
          });

          await db.insert('question', {
            'country': 'Romania',
            'subject': 2,
            'difficulty': 2,
            'question_text': 'În ce secol a crescut mișcarea națională?',
            'answer': '',
            'correct_answer': 19,
            'type': 2
          });

          await db.insert('question', {
            'country': 'Romania',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Care a fost primul conducător al României Comuniste?',
            'answer': answer203,
            'correct_answer': 4,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Romania',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'În ce război au participat Principatele Române pentru a-și consolida statutul de națiune suverană?',
            'answer': answer204,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Romania',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Cum se numește procesul prin care Romanii influențiază cultura dacilor',
            'answer': answer205,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Romania',
            'subject': 2,
            'difficulty': 2,
            'question_text': 'Vlad Țepeș a domnit în Țara Românească',
            'answer': "",
            'correct_answer': 1,
            'type': 4
          });

          await db.insert('question', {
            'country': 'Romania',
            'subject': 2,
            'difficulty': 1,
            'question_text': '',
            'answer': answer197,
            'correct_answer': 1,
            'type': 3
          });

          await db.insert('question', {
            'country': 'South Africa',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'Cine locuia pe teritoriul actual al Africii de Sud înainte de sosirea europenilor?',
            'answer': answer212,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'South Africa',
            'subject': 2,
            'difficulty': 1,
            'question_text': 'Când au fondat olandezii Cape Town-ul?',
            'answer': answer213,
            'correct_answer': 3,
            'type': 1
          });

          await db.insert('question', {
            'country': 'South Africa',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'Războaiele anglo-boere au avut loc in secolul XIX',
            'answer': '',
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'South Africa',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'Cine a devenit primul președinte negru al Africii de Sud după sfârșitul apartheidului?',
            'answer': answer214,
            'correct_answer': 2,
            'type': 1
          });

          // Copy the data from the old table to the new one

          // Delete the old table
          /*await db.execute('DROP TABLE $table');
          await db.execute('DROP TABLE countries');

          // Rename the new table to the old one's name
          await db.execute('ALTER TABLE new_table RENAME TO $table');
          */
        }
        ;
      },
    );
  }

  Future<int> insertCountry(String countryName) async {
    Database db = await database;
    return await db.insert(table, {
      'name': countryName,
      'geographyLesson': "",
      'historyLesson': "",
      'geography_completed': 0,
      'history_completed': 0,
      'doesExist': 0
    });
  }

  Future<DateTime> getLastActivityDate(Database db) async {
    List<Map> result =
        await db.query('profile', columns: ['last_activity_date']);

    if (result.isEmpty) {
      return DateTime.fromMillisecondsSinceEpoch(0);
    }

    return DateTime.parse(result.first['last_activity_date']);
  }

  Future<void> updateLastActivityDate(String newDate) async {
    Database db = await this.database;

    await db.rawUpdate("UPDATE profile SET last_activity_date = '$newDate'");
    print('updated: new date = $newDate');
  }

  Future<int> getStreakCount() async {
    Database db = await this.database;

    List<Map> result = await db.query('profile', columns: ['streak_count']);

    DateTime lastActivityDate = await getLastActivityDate(db);

    DateTime today = DateTime.now();

    int differenceInDays = today.difference(lastActivityDate).inDays;

    if (differenceInDays > 1) {
      await db.rawUpdate('UPDATE profile SET streak_count = 0');
    }
    if (result.isEmpty) {
      return 999;
    }

    return result.first['streak_count'];
  }
   
  Future<void> incrementStreak() async {
    Database db = await this.database;
    DateTime lastActivityDate = await getLastActivityDate(db);
    DateTime today = DateTime.now();
    print('$lastActivityDate is last');
    int differenceInDays = today.difference(lastActivityDate).inDays;
    print('$differenceInDays is diff');

    if (differenceInDays == 1) {
      await db.rawUpdate('UPDATE profile SET streak_count = streak_count + 1');
    } else if (differenceInDays != 1) {
      await db.rawUpdate('UPDATE profile SET streak_count = 1');
    }
    await updateLastActivityDate(today.toIso8601String());
  }

  Future<void> incrementCoins() async {
    Database db = await this.database;

    await db.rawUpdate('UPDATE profile SET coins = coins + 5');
  }

  Future<int> insertQuestion(
    String countryName,
    String question,
    String answer,
    int correct_answer,
    int type,
    int subject,
    int difficulty,
  ) async {
    Database db = await database;
    return await db.insert('question', {
      'country': countryName,
      'subject': subject,
      'difficulty': difficulty,
      'question_text': question,
      'answer': answer,
      'correct_answer': correct_answer,
      'type': type,
    });
  }
  
  Future<int> setFaces(String faceList) async {
    Database db = await database;
    int id=1;
    return await db.update(
      'profile',
      {
        'faces': faceList,
      },
      where: 'profileID = ?',
      whereArgs: [id],
    );
  }

  Future<Map<String, dynamic>> queryFaces() async {
    Database db = await database;
    int id=1;
    List<Map<String, dynamic>> result = await db.query(
      'profile',
      columns: ['faces'],
      where: 'profileID = ?',
      whereArgs: [id],
    );
    if (result.isNotEmpty) {
      return {
        'faces': result.first['faces'],
      };
    } else {
      throw Exception('Faces not found');
    }
  }

  Future<int> setCountry(String countryName) async {
    Database db = await database;
    return await db.update(
      'country',
      {
        'doesExist': 1,
      },
      where: 'name = ?',
      whereArgs: [countryName],
    );
  }

  Future<int> deleteCountry(String countryName) async {
    Database db = await database;
    return await db.update(
      'country',
      {
        'doesExist': 0,
      },
      where: 'name = ?',
      whereArgs: [countryName],
    );
  }

  Future<int> setLesson(String countryName, String lesson, int subject) async {
    Database db = await database;
    String field = subject == 1 ? "geographyLesson" : "historyLesson";
    return await db.update(
      'country',
      {
        field: lesson,
      },
      where: 'name = ?',
      whereArgs: [countryName],
    );
  }

  Future<Map<String, dynamic>> queryLesson(String countryName) async {
    Database db = await database;
    List<Map<String, dynamic>> result = await db.query(
      'country',
      columns: ['geographyLesson', 'historyLesson'],
      where: 'name = ?',
      whereArgs: [countryName],
    );
    if (result.isNotEmpty) {
      return {
        'geographyLesson': result.first['geographyLesson'],
        'historyLesson': result.first['historyLesson'],
      };
    } else {
      throw Exception('Country not found');
    }
  }

  Future<List<Map<String, dynamic>>> queryQuestions(
      String countryName, String subject, int difficulty) async {
    Database db = await database;
    List<Map<String, dynamic>> result = await db.query(
      'question',
      where: 'country = ? AND subject = ? AND difficulty = ?',
      whereArgs: [countryName, subject, difficulty],
    );

    if (result.isNotEmpty) {
      return result
          .map((question) => {
                'question_text': question['question_text'],
                'answer': question['answer'],
                'correct_answer': question['correct_answer'].toString(),
                'type': question['type'].toString(),
              })
          .toList();
    } else {
      return [];
    }
  }

  /*Future<int> insertCountry(
    String countryName,
    String lessonGeography,
    String lessonHistory,
    String easyGeographyQuestions,
    String hardGeographyQuestions,
    String easyHistoryQuestions,
    String hardHistoryQuestions,
    String EGA1,
    String EGA2,
    String EGA3,
    String EGA4,
    String HGA1,
    String HGA2,
    String HGA3,
    String HGA4,
    String EHA1,
    String EHA2,
    String EHA3,
    String EHA4,
    String HHA1,
    String HHA2,
    String HHA3,
    String HHA4,
    String answersGeographyEasyCorrect,
    String answersGeographyHardCorrect,
    String answersHistoryEasyCorrect,
    String answersHistoryHardCorrect,
  ) async {
    Database db = await database;
    return await db.insert(table, {
      'name': countryName,
      'lesson_geography': lessonGeography,
      'lesson_history': lessonHistory,
      'geography_completed': 0,
      'history_completed': 0,
      'questionsGeographyEasy': easyGeographyQuestions,
      'questionsGeographyHard': hardGeographyQuestions,
      'questionsHistoryEasy': easyHistoryQuestions,
      'questionsHistoryHard': hardHistoryQuestions,
      'answersGeographyEasyQ1': EGA1,
      'answersGeographyEasyQ2': EGA2,
      'answersGeographyEasyQ3': EGA3,
      'answersGeographyEasyQ4': EGA4,
      'answersGeographyHardQ1': HGA1,
      'answersGeographyHardQ2': HGA2,
      'answersGeographyHardQ3': HGA3,
      'answersGeographyHardQ4': HGA4,
      'answersHistoryEasyQ1': EHA1,
      'answersHistoryEasyQ2': EHA2,
      'answersHistoryEasyQ3': EHA3,
      'answersHistoryEasyQ4': EHA4,
      'answersHistoryHardQ1': HHA1,
      'answersHistoryHardQ2': HHA2,
      'answersHistoryHardQ3': HHA3,
      'answersHistoryHardQ4': HHA4,
      'answersGeographyEasyCorrect': answersGeographyEasyCorrect,
      'answersGeographyHardCorrect': answersGeographyHardCorrect,
      'answersHistoryEasyCorrect': answersHistoryEasyCorrect,
      'answersHistoryHardCorrect': answersHistoryHardCorrect,
    });
  }*/

  Future<int> insertTrophy(int trophy) async {
    Database db = await database;
    return await db.insert(tableTrophy, {'trophy': trophy});
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table, orderBy: 'countryID ASC');
  }

  Future<List<Map<String, dynamic>>> queryTrophies() async {
    Database db = await instance.database;
    return await db.query(tableTrophy, orderBy: '$columnTrophyId ASC');
  }

  /*Future<int> deleteCountry(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }*/

  Future<int> deleteTrophy(int id) async {
    Database db = await instance.database;
    return await db
        .delete(tableTrophy, where: '$columnTrophyId = ?', whereArgs: [id]);
  }

  Future<int> updateLessonDone(int subject, String countryName) async {
    Database db = await database;
    String field = subject == 1 ? 'geography_completed' : 'history_completed';
    return await db.update(
      table,
      {
        field: 1,
      },
      where: 'name = ?',
      whereArgs: [countryName],
    );
  }

  Future<int> updatePicture(int profileIndex) async {
    Database db = await database;
    int profileID = 1;
    // Execute the update statement
    return await db.update(
      'profile',
      {'picture': profileIndex},
      where: 'profileID = ?',
      whereArgs: [profileID],
    );
  }

  Future<int> updateUserame(String newUsername) async {
    Database db = await database;
    int profileID = 1;
    // Execute the update statement
    return await db.update(
      'profile',
      {'username': newUsername},
      where: 'profileID = ?',
      whereArgs: [profileID],
    );
  }

  Future<int> updateProfileIQ(int IQ) async {
    Database db = await database;
    int profileID = 1;
    Map<String, dynamic> profileData = (await db
            .query('profile', where: 'profileID = ?', whereArgs: [profileID]))
        .first;
    int currentIQ = profileData['iq'] as int;
    IQ = currentIQ + IQ;
    return await db.update(
      'profile',
      {'iq': IQ},
      where: 'profileID = ?',
      whereArgs: [profileID],
    );
  }

  Future<int> updateProfileTrophies() async {
    Database db = await database;
    int profileID = 1;
    Map<String, dynamic> profileData = (await db
            .query('profile', where: 'profileID = ?', whereArgs: [profileID]))
        .first;
    int currentTrophies = profileData['trophies'] as int;
    currentTrophies += 1;
    return await db.update(
      'profile',
      {'trophies': currentTrophies},
      where: 'profileID = ?',
      whereArgs: [profileID],
    );
  }

  Future<int> updateMode(int modeInt) async {
    Database db = await database;
    int profileID = 1;
    return await db.update(
      'profile',
      {'dark_mode': modeInt},
      where: 'profileID = ?',
      whereArgs: [profileID],
    );
  }

  Future<int> updateLanguage(int language) async {
    Database db = await database;
    int profileID = 1;
    return await db.update(
      'profile',
      {'language': language},
      where: 'profileID = ?',
      whereArgs: [profileID],
    );
  }

  Future<int> updateProfileLesson(int subject) async {
    Database db = await database;
    int profileID = 1, currentLessons = 0;
    String field = subject == 1 ? 'geography_lessons' : 'history_lessons';
    Map<String, dynamic> profileData = (await db
            .query('profile', where: 'profileID = ?', whereArgs: [profileID]))
        .first;
    currentLessons = profileData[field] as int;
    currentLessons += 1;
    return await db.update(
      'profile',
      {
        field: currentLessons,
      },
      where: 'profileID = ?',
      whereArgs: [profileID],
    );
  }

  Future<int> updateAdmin() async {
    Database db = await database;
    int profileID = 1;
    Map<String, dynamic> profileData = (await db
            .query('profile', where: 'profileID = ?', whereArgs: [profileID]))
        .first;
    int admin = profileData['admin'] as int;
    if (admin == 1)
      admin = 0;
    else
      admin = 1;
    return await db.update(
      'profile',
      {'admin': admin},
      where: 'profileID = ?',
      whereArgs: [profileID],
    );
  }

  Future<List<Map<String, dynamic>>> queryProfile() async {
    Database db = await instance.database;
    return await db.query('profile', orderBy: 'profileID ASC');
  }

  // Future<void> clearTableAndResetId(String tableName) async {
  //   final db = _databaseName;
  //   if (db != null) {
  //     /*await db.transaction((txn) async {
  //       // Delete ALL
  //       await txn.rawDelete('DELETE FROM $tableName');
  //       // Reset  :)
  //       await txn.rawUpdate(
  //           'DELETE FROM sqlite_sequence WHERE name = ?', [tableName]);
  //     });*/
  //   }
  // }

  // Future<void> decreaseMaxId(String tableName) async {
  //   final db = _databaseName;
  //   if (db != null) {
  //     /*// Get the maximum ID
  //     final maxIdResult =
  //         await db.rawQuery('SELECT MAX(id) as max_id FROM $tableName');
  //     final maxId = maxIdResult.first['max_id'] as int? ?? 1;
  //     // Set the ID to maxId - 1
  //     await db.rawUpdate('UPDATE sqlite_sequence SET seq = ? WHERE name = ?',
  //         [maxId - 1, tableName]);*/
  //   }
  // }
}
