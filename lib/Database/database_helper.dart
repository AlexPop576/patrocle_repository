import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
    // List of countries
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
 // JSON encoded answers
  String answer1 = jsonEncode([
    'Mountains',
    'River',
    'The sea',
    'The region',
    'Pyrenees',
    'Ebro',
    'Mediterranean',
    'Iberian Peninsula'
  ]);
  String answer2 = jsonEncode(['Barcelona', 'Madrid', 'Valencia', 'Sevilla']);
  String answer3 = jsonEncode(['Mallorca', 'Ibiza', 'Sardinia', 'Tenerife']);
  String answer4 = jsonEncode([
    'Mountains',
    'River',
    'The sea',
    'The region',
    'Teide',
    'Guadalquivir',
    'Mediterranean',
    'Canary Islands'
  ]);
  String answer5 = jsonEncode([
    'Christopher Columbus',
    'Vasco da Gama',
    'Ferdinand Magellan',
    'Marco Polo'
  ]);
  String answer6 = jsonEncode([
    'Kingdom',
    'Explorer',
    'Dictator',
    'Queen',
    'Castile',
    'Columbus',
    'Franco',
    'Isabella'
  ]);
  String answer7 =
      jsonEncode(['1910-1930', '1939-1975', '1980-2000', '1960-1980']);
  String answer8 = jsonEncode([
    'Iberians and Celtiberians',
    'Ferdinand II and Isabella I',
    'Christopher Columbus',
    'Democratic Constitution',
    'Antiquity',
    '15th Century',
    'Modern Era',
    '20th Century'
  ]);
  String answer9 = jsonEncode(['Barcelona', 'Madrid', 'Paris', 'Lisabona']);
String answer10 = jsonEncode([
    'Mont Blanc',
    'French Riviera',
    'Seine',
    'Lyon',
    'Peak',
    'Resorts',
    'River',
    'City'
  ]);
  String answer11 = jsonEncode(['Tamisa', 'Sena', 'Tiber', 'Rin']);
String answer12 = jsonEncode([
    'Paris',
    'Alps',
    'Bordeaux',
    'Mediterranean Sea',
    'Capital city',
    'Mountain range',
    'Wine region',
    'Coastal area'
  ]);
  String answer13 = jsonEncode(['Germany', 'Italy', 'Gaul', 'Spain']);
  String answer14 = jsonEncode([
    'Antiquity',
    'Middle Ages',
    '15th Century',
    'French Revolution',
    'Romans',
    'Feudalism',
    'Consolidation',
    'Republic'
  ]);
  String answer15 = jsonEncode([
  'The Enlightenment Period',
  'The Medieval Era',
  'The Napoleonic Era',
  'The Renaissance'
  ]);
  String answer16 = jsonEncode([
  'Antiquity',
  'Middle Ages',
  '19th Century',
  'Napoleon',
  'Romans',
  'Feudalism',
  'Conflicts',
  'Expansion'
  ]);
  String answer17= jsonEncode(['Rome', 'Milan', 'Venice', 'Naples']);
  String answer18 = jsonEncode([
  'Mountains',
  'River',
  'Sea',
  'Region',
  'Alps',
  'Arno',
  'Mediterranean',
  'Italian Peninsula'
  ]);

  String answer19 = jsonEncode(['Sicily', 'Sardinia', 'Corsica', 'Capri']);
  String answer20 = jsonEncode([
  'Mountains',
  'River',
  'Sea',
  'Region',
  'Apennines',
  'Tiber',
  'Adriatic',
  'Sicily'
  ]);
  String answer21 = jsonEncode(
      ['The Middle Ages', 'Antiquity', 'The Renaissance', 'The 20th Century']);
  String answer22 = jsonEncode([
  'Historical Period',
  'Personality',
  'State/Entity',
  'Event',
  'Renaissance',
  'Leonardo da Vinci',
  'Republic of Venice',
  'Unification of Italy'
  ]);
  String answer23 = jsonEncode(
        ['Julius Caesar', 'Attila the Hun', 'Cleopatra', 'Alexander the Great']);
  String answer24 = jsonEncode([
  'Historical Period',
  'Personality',
  'State/Entity',
  'Event',
  'Middle Ages',
  'Giuseppe Garibaldi',
  'Papal States',
  'World War I'
  ]);
  String answer25 =
      jsonEncode(['Shanghai', 'Beijing', 'Guangzhou', 'Hong Kong']);
  String answer26 = jsonEncode([
  'Mountains',
  'River',
  'Sea',
  'Region',
  'Himalaya',
  'Yangtze',
  'Yellow Sea',
  'Guangzhou'
  ]);
  String answer27 =
        jsonEncode(['Mont Everest', 'Kilimanjaro', 'Matterhorn', 'Aconcagua']);
  String answer28 = jsonEncode([
  'Mountains',
  'River',
  'Sea',
  'Region',
  'Tian',
  'Yellow River',
  'East China Sea',
  'Tibet'
  ]);
  String answer29 = jsonEncode(
      ['Dinastia Han', 'Dinastia Tang', 'Dinastia Qin', 'Dinastia Song']);
String answer30 = jsonEncode([
'Dynasties',
'Events',
'Personalities',
'Developments',
'Tang',
'Opium Wars',
'Mao Zedong',
'Economic reforms'
]);
String answer31 = jsonEncode(['Beijing', 'Shanghai', 'Xi\'an', 'Nanjing']);
String answer32 = jsonEncode([
'Dynasties',
'Events',
'Personalities',
'Developments',
'Qin',
'Boxer Rebellion',
'Deng Xiaoping',
'Advanced technology'
]);
String answer33 = jsonEncode(
      ['San Francisco', 'Washington D.C', 'New York City', 'Chicago']);
String answer34 = jsonEncode([
    'Mountains',
    'River',
    'Sea',
    'Region',
    'Rocky Mountains',
    'Mississippi',
    'Eastern Sea',
    'Columbia Plateau'
]);
String answer35 = jsonEncode([
    'Guam and American Samoa',
    'Alaska and Guam',
    'U.S. Virgin Islands and American Samoa',
    'Puerto Rico and U.S. Virgin Islands'
]);
String answer36 = jsonEncode([
    'Mountain',
    'River',
    'Sea',
    'Region',
    'Appalachian',
    'Missouri',
    'Gulf of Mexico',
    'Great Plains'
]);
String answer38 = jsonEncode([
    'Texas and Florida',
 'Arizona and Nevada',
 'California and Oregon',
 'Alaska and Maine'
  ]);
 String answer39 = jsonEncode(
      ['Native American tribes only', 'Indigenous tribes and European settlers', 'European settlers only', 'African populations only']);
String answer40 = jsonEncode([
    'Period',
    'Event',
    'Movement',
    'Document',
    'Prohibition',
    'Manifest Destiny',
    'Declaration of Independence',
    'American Civil War',
]);
String answer41 = jsonEncode([
    'Development of a prosperous economy',
    'Decline of indigenous populations',
    'Cultural exchanges between Europeans and indigenous populations',
    'Establishment of permanent colonies'
]);
String answer42= jsonEncode([
    'Exploration',
    'War',
    'Expansion',
    'Policy',
    'Arrival of columbus',
    'Spanish-American War',
    'Louisiana Purchase',
    'Monroe Doctrine'
]);
 String answer174 = jsonEncode([
  'Mountains',
  'River',
  'Sea',
  'Region',
  'Carpathians',
  'Danube',
  'Black Sea',
  'Moldova'
]);

String answer175 = jsonEncode(['Zagreb', 'Budapest', 'Bucharest', 'Paris']);
String answer177 = jsonEncode(['Volga', 'Danube', 'Rhine', 'Seine']);
String answer178 = jsonEncode(['Cluj-Napoca', 'Timișoara', 'Sofia', 'Bucharest']);
String answer179 = jsonEncode(['Moldoveanu', 'Negoiu', 'Făgăraș', 'Pietrosu']);
String answer180 = jsonEncode([
  'Oceanic Temperate',
  'Mediterranean',
  'Polar',
  'Continental Temperate'
]);

String answer182 = jsonEncode([
  'Central Europe',
  'Western Europe',
  'Northern Europe',
  'Eastern Europe'
]);
String answer183 = jsonEncode(['Transylvania', 'Moldova', 'Catalonia', 'Maramureș']);
String answer184 = jsonEncode(['Hungary', 'Spain', 'Bulgaria', 'Ukraine']);
String answer185 = jsonEncode(['Făgăraș', 'Carpathians', 'Apuseni', 'Alps']);
String answer186 = jsonEncode(['Constanța', 'Cluj-Napoca', 'Bucharest', 'Timișoara']);
String answer188 = jsonEncode([
  'Appalachian Mountains',
  'Făgăraș Mountains',
  'Apuseni Mountains',
  'Ciucaș Mountains'
]);
String answer189 = jsonEncode([
  'Mountain landscapes',
  'Traditional villages',
  'Developed infrastructure',
  'Wildlife'
]);
String answer190 = jsonEncode(['Bucharest', 'Carpathian Mountains', 'Danube', 'Cluj-Napoca']);
String answer191 = jsonEncode(['Carpathian Mountains', 'Black Sea', 'Danube', 'Iași']);
String answer192 = jsonEncode(['Danube', 'Black Sea', 'Carpathian Mountains', 'Iași']);
String answer194 = jsonEncode(['Hungarians', 'Dacians', 'Egyptians', 'Celts']);
String answer195 = jsonEncode([
  'Ottoman Empire',
  'Roman Empire',
  'Mongol Empire',
  'Babylonian Empire'
]);
String answer196 = jsonEncode(['Moscow', 'Saxony', 'Moldova', 'Tuscany']);
String answer197 = jsonEncode([
  'Sea',
  'Union',
  'Vlad',
  'Country',
  'Unification',
  'Soviet',
  'Țepeș',
  'Romanian'
]);
String answer198 = jsonEncode(['Democratic', 'Communist', 'Totalitarian', 'Fascist']);
String answer199 = jsonEncode(['2004', '2007', '2010', '1997']);
String answer200 = jsonEncode([
  'Traian Băsescu',
  'Klaus Iohannis',
  'Emil Boc',
  'Nicolae Ceaușescu'
]);
String answer201 = jsonEncode([
  'Nicolae Titulescu',
  'Iancu de Hunedoara',
  'Ștefan Cel Mare',
  'Alexandru Ioan Cuza'
]);
String answer202 = jsonEncode(['Axis', 'Allies', 'Ottomans', 'Chinese']);
String answer203 = jsonEncode([
  'Iliescu',
  'Constantinescu',
  'Nicolae Ceaușescu',
  'Gheorghe Gheorghiu-Dej'
]);
String answer204 = jsonEncode([
  'Romanian Civil War',
  'War of Independence',
  'Balkan War',
  'Crimean War'
]);
String answer205 = jsonEncode(['Romanization', 'Leveling', 'Dacianization', 'Globalization']);
  String answer206 = jsonEncode([
    'Era',
    'Leader',
    'Event',
    'Union',
    'Romanization',
    'Gheorghe Gheorghiu-Dej',
    '1989 Revolution',
    'Marea Unire'
]);
 String answer207 = jsonEncode([
    'Region',
    'City',
    'Geographic Feature',
    'River',
    'Transylvania',
    'Bucharest',
    'Carpathian Mountains',
    'Danube'
]);
  String facesList = jsonEncode([1]);
  static final _databaseName = "MyDatabase.db";
  static final _databaseVersion = 110;

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

        await db.execute('''
          CREATE TABLE faces (
            faceID INTEGER PRIMARY KEY AUTOINCREMENT,
            face INTEGER,
            bought INTEGER,
            price INTEGER,
            color INTEGER
          )''');
  
        await db.insert('faces', {
            'face': 1,
            'bought': 1,
            'price': 50,
            'color': 0
          });

        await db.insert('faces', {
            'face': 2,
            'bought': 0,
            'price': 50,
            'color': 1
          });

          await db.insert('faces', {
            'face': 3,
            'bought': 0,
            'price': 50,
            'color': 2
          });

          await db.insert('faces', {
            'face': 4,
            'bought': 0,
            'price': 50,
            'color': 3
          });

        db.insert('profile', {
          'username': 'username',
          'picture': 1,
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
          'faces': facesList
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
          'question_text': '',
          'answer': answer1,
          'correct_answer': 1,
          'type': 3
        });
        await db.insert('question', {
                  'country': 'Spain',
                  'subject': 1,
                  'difficulty': 1,
                  'question_text':
                      'What is the capital of Spain and the largest city in the country?',
                  'answer': answer2,
                  'correct_answer': 2,
                  'type': 1
                });


        await db.insert('question', {
                  'country': 'Spain',
                  'subject': 1,
                  'difficulty': 1,
                  'question_text': 'What is the population of Spain?',
                  'answer': '',
                  'correct_answer': 47,
                  'type': 2
                });
        await db.insert('question', {
                  'country': 'Spain',
                  'subject': 1,
                  'difficulty': 1,
                  'question_text': 'Spain and Portugal are neighboring countries.',
                  'answer': '',
                  'correct_answer': 1,
                  'type': 4
                });

        await db.insert('question', {
          'country': 'Spain',
          'subject': 1,
          'difficulty': 2,
          'question_text':
              'Which of the following islands does not belong to Spain?',
          'answer': answer3,
          'correct_answer': 3,
          'type': 1
        });
        await db.insert('question', {
                  'country': 'Spain',
                  'subject': 1,
                  'difficulty': 2,
                  'question_text': '',
                  'answer': answer4,
                  'correct_answer': 1,
                  'type': 3
                });
        await db.insert('question', {
                  'country': 'Spain',
                  'subject': 1,
                  'difficulty': 2,
                  'question_text': 'How many meters is the highest mountain peak?',
                  'answer': '',
                  'correct_answer': 3718,
                  'type': 2
                });
        await db.insert('question', {
                  'country': 'Spain',
                  'subject': 1,
                  'difficulty': 2,
                  'question_text': 'Formentera belongs to Spain.',
                  'answer': '',
                  'correct_answer': 1,
                  'type': 4
                });

        await db.insert('question', {
          'country': 'Spain',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'Who was one of the great Spanish explorers of the 16th-17th centuries who discovered America?',
          'answer': answer5,
          'correct_answer': 1,
          'type': 1
        });
        await db.insert('question', {
                  'country': 'Spain',
                  'subject': 2,
                  'difficulty': 1,
                  'question_text': 'When was the decree for the expulsion of Jews and Moors signed?',
                  'answer': '',
                  'correct_answer': 1492,
                  'type': 2
                });

        await db.insert('question', {
                  'country': 'Spain',
                  'subject': 2,
                  'difficulty': 1,
                  'question_text': 'In the 19th century, Spain managed to keep all its colonies in Latin America.',
                  'answer': '',
                  'correct_answer': 2,
                  'type': 4
                });
        await db.insert('question', {
          'country': 'Spain',
          'subject': 2,
          'difficulty': 1,
          'question_text': '',
          'answer': answer6,
          'correct_answer': 1,
          'type': 3
        });
        await db.insert('question', {
                  'country': 'Spain',
                  'subject': 2,
                  'difficulty': 2,
                  'question_text':
                      'What was the period of rule of dictator Francisco Franco in Spain?',
                  'answer': answer7,
                  'correct_answer': 2,
                  'type': 1
                });
        await db.insert('question', {
          'country': 'Spain',
          'subject': 2,
          'difficulty': 2,
          'question_text': '',
          'answer': answer8,
          'correct_answer': 1,
          'type': 3
        });
        await db.insert('question', {
                  'country': 'Spain',
                  'subject': 2,
                  'difficulty': 2,
                  'question_text': 'In what year did Spain become a democracy?',
                  'answer': '',
                  'correct_answer': 1978,
                  'type': 2
                });
        await db.insert('question', {
                  'country': 'Spain',
                  'subject': 2,
                  'difficulty': 2,
                  'question_text': 'Ferdinand II and Isabella I were responsible for the completion of the Reconquista.',
                  'answer': '',
                  'correct_answer': 1,
                  'type': 4
                });
        await db.insert('question', {
          'country': 'France',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'What is the capital of France?',
          'answer': answer9,
          'correct_answer': 3,
          'type': 1
        });
        await db.insert('question', {
                  'country': 'France',
                  'subject': 1,
                  'difficulty': 1,
                  'question_text': 'What is the population of France?',
                  'answer': '',
                  'correct_answer': 67,
                  'type': 2
                });
        await db.insert('question', {
                  'country': 'France',
                  'subject': 1,
                  'difficulty': 1,
                  'question_text': 'The Pyrenees Mountains form a natural border between France and Italy.',
                  'answer': '',
                  'correct_answer': 2,
                  'type': 4
                });
        await db.insert('question', {
                  'country': 'France',
                  'subject': 1,
                  'difficulty': 1,
                  'question_text': '',
                  'answer': answer10,
                  'correct_answer': 1,
                  'type': 3
                });
        await db.insert('question', {
                  'country': 'France',
                  'subject': 1,
                  'difficulty': 2,
                  'question_text':
                      'What is the most important river in France, known for flowing through the capital?',
                  'answer': answer11,
                  'correct_answer': 2,
                  'type': 1
                });
        await db.insert('question', {
                  'country': 'France',
                  'subject': 1,
                  'difficulty': 2,
                  'question_text': '',
                  'answer': answer12,
                  'correct_answer': 1,
                  'type': 3
                });
        await db.insert('question', {
                  'country': 'France',
                  'subject': 1,
                  'difficulty': 2,
                  'question_text': 'How many meters is the highest peak in France?',
                  'answer': '',
                  'correct_answer': 4810,
                  'type': 2
                });
        await db.insert('question', {
                  'country': 'France',
                  'subject': 1,
                  'difficulty': 2,
                  'question_text': 'The Eiffel Tower is located in Paris.',
                  'answer': '',
                  'correct_answer': 1,
                  'type': 4
                });

                await db.insert('question', {
                  'country': 'France',
                  'subject': 2,
                  'difficulty': 1,
                  'question_text':
                      'Care a fost una dintre provinciile romane în care a fost încorporată Franța în antichitate?',
                  'answer': answer13,
                  'correct_answer': 3,
                  'type': 1
                });
        await db.insert('question', {
                  'country': 'France',
                  'subject': 2,
                  'difficulty': 1,
                  'question_text': 'In what year did the French Revolution take place?',
                  'answer': '',
                  'correct_answer': 1789,
                  'type': 2
                });
        await db.insert('question', {
                  'country': 'France',
                  'subject': 2,
                  'difficulty': 1,
                  'question_text': '',
                  'answer': answer14,
                  'correct_answer': 1,
                  'type': 3
                });
        await db.insert('question', {
                  'country': 'France',
                  'subject': 2,
                  'difficulty': 1,
                  'question_text': 'France was one of the founding members of the EU.',
                  'answer': '',
                  'correct_answer': 1,
                  'type': 4
                });


        await db.insert('question', {
                  'country': 'France',
                  'subject': 2,
                  'difficulty': 2,
                  'question_text':
                      'Care a fost perioada de dominație a lui Napoleon Bonaparte în Franța?',
                  'answer': answer15,
                  'correct_answer': 3,
                  'type': 1
                });
        await db.insert('question', {
                  'country': 'France',
                  'subject': 2,
                  'difficulty': 2,
                  'question_text': 'In what year was the Third Republic established?',
                  'answer': '',
                  'correct_answer': 1870,
                  'type': 2
                });
        await db.insert('question', {
                  'country': 'France',
                  'subject': 2,
                  'difficulty': 2,
                  'question_text': '',
                  'answer': answer16,
                  'correct_answer': 1,
                  'type': 3
                });
        await db.insert('question', {
                  'country': 'France',
                  'subject': 2,
                  'difficulty': 2,
                  'question_text': 'The Nazi occupation was from 1920 to 1957.',
                  'answer': '',
                  'correct_answer': 2,
                  'type': 4
                });
        await db.insert('question', {
          'country': 'Italy',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'What is the capital of Italy?',
          'answer': answer17,
          'correct_answer': 1,
          'type': 1
        });
        await db.insert('question', {
                  'country': 'Italy',
                  'subject': 1,
                  'difficulty': 2,
                  'question_text': 'What is the population of Italy?',
                  'answer': '',
                  'correct_answer': 60,
                  'type': 2
                });
        await db.insert('question', {
                  'country': 'Italy',
                  'subject': 1,
                  'difficulty': 1,
                  'question_text': '',
                  'answer': answer18,
                  'correct_answer': 1,
                  'type': 3
                });
        await db.insert('question', {
                  'country': 'Italy',
                  'subject': 1,
                  'difficulty': 1,
                  'question_text': 'Venice is renowned for its Carnival festival.',
                  'answer': '',
                  'correct_answer': 1,
                  'type': 4
                });
        await db.insert('question', {
                  'country': 'Italy',
                  'subject': 1,
                  'difficulty': 2,
                  'question_text': 'What is the largest island in Italy?',
                  'answer': answer19,
                  'correct_answer': 1,
                  'type': 1
                });
        await db.insert('question', {
                  'country': 'Italy',
                  'subject': 1,
                  'difficulty': 1,
                  'question_text': 'What is the altitude of Mont Blanc peak in the Graian Alps?',
                  'answer': '',
                  'correct_answer': 4808,
                  'type': 2
                });
        await db.insert('question', {
                  'country': 'Italy',
                  'subject': 1,
                  'difficulty': 2,
                  'question_text': '',
                  'answer': answer20,
                  'correct_answer': 1,
                  'type': 3
                });
        await db.insert('question', {
                  'country': 'Italy',
                  'subject': 1,
                  'difficulty': 2,
                  'question_text': 'Venice is renowned for its Carnival festival.',
                  'answer': '',
                  'correct_answer': 1,
                  'type': 4
                });
        
        await db.insert('question', {
            'country': 'Italy',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'In which period was Italy the epicenter of a powerful cultural and artistic movement?',
            'answer': answer21,
            'correct_answer': 3,
            'type': 1
          });
        await db.insert('question', {
                  'country': 'Italy',
                  'subject': 2,
                  'difficulty': 1,
                  'question_text': 'In what year was the modern Italian state formed?',
                  'answer': '',
                  'correct_answer': 1871,
                  'type': 2
                });
        await db.insert('question', {
                  'country': 'Italy',
                  'subject': 2,
                  'difficulty': 1,
                  'question_text': '',
                  'answer': answer22,
                  'correct_answer': 1,
                  'type': 3
                });
        await db.insert('question', {
                  'country': 'Italy',
                  'subject': 2,
                  'difficulty': 1,
                  'question_text': 'Italy joined the Allied Powers in 1915.',
                  'answer': '',
                  'correct_answer': 1,
                  'type': 4
                });
        await db.insert('question', {
                    'country': 'Italy',
                    'subject': 2,
                    'difficulty': 2,
                    'question_text':
                        'Who was one of the personalities who contributed to the formation of the Roman Empire?',
                    'answer': answer23,
                    'correct_answer': 1,
                    'type': 1
                  });
        await db.insert('question', {
                  'country': 'Italy',
                  'subject': 2,
                  'difficulty': 2,
                  'question_text': 'In which century did the two world wars take place?',
                  'answer': '',
                  'correct_answer': 20,
                  'type': 2
                });
        await db.insert('question', {
                  'country': 'Italy',
                  'subject': 2,
                  'difficulty': 2,
                  'question_text': '',
                  'answer': answer24,
                  'correct_answer': 1,
                  'type': 3
                });
        await db.insert('question', {
                  'country': 'Italy',
                  'subject': 2,
                  'difficulty': 2,
                  'question_text': 'The Napoleonic Wars took place in the 19th century.',
                  'answer': '',
                  'correct_answer': 1,
                  'type': 4
                });
        await db.insert('question', {
          'country': 'China',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'What is the capital of China?',
          'answer': answer25,
          'correct_answer': 2,
          'type': 1
        });
        await db.insert('question', {
                  'country': 'China',
                  'subject': 1,
                  'difficulty': 1,
                  'question_text': 'The Yangtze is the third longest river in the world.',
                  'answer': '',
                  'correct_answer': 1,
                  'type': 4
                });
        await db.insert('question', {
                  'country': 'China',
                  'subject': 1,
                  'difficulty': 1,
                  'question_text': '',
                  'answer': answer26,
                  'correct_answer': 1,
                  'type': 3
                });
        await db.insert('question', {
                  'country': 'China',
                  'subject': 1,
                  'difficulty': 1,
                  'question_text': 'Singapore is part of China.',
                  'answer': '',
                  'correct_answer': 2,
                  'type': 4
                });

        await db.insert('question', {
                  'country': 'China',
                  'subject': 1,
                  'difficulty': 2,
                  'question_text': 'What is the highest peak in China?',
                  'answer': answer27,
                  'correct_answer': 1,
                  'type': 1
                });
        await db.insert('question', {
                  'country': 'China',
                  'subject': 1,
                  'difficulty': 2,
                  'question_text': '',
                  'answer': answer28,
                  'correct_answer': 1,
                  'type': 3
                });
        await db.insert('question', {
                  'country': 'China',
                  'subject': 1,
                  'difficulty': 2,
                  'question_text': 'Chongqing is an important city.',
                  'answer': '',
                  'correct_answer': 1,
                  'type': 4
                });
        await db.insert('question', {
                  'country': 'China',
                  'subject': 1,
                  'difficulty': 2,
                  'question_text': 'Xinjiang is an autonomous region.',
                  'answer': '',
                  'correct_answer': 1,
                  'type': 4
                });
        await db.insert('question', {
            'country': 'China',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'Which dynasty began the process of unifying China under a central authority?',
            'answer': answer29,
            'correct_answer': 3,
            'type': 1
          });
          await db.insert('question', {
                    'country': 'China',
                    'subject': 2,
                    'difficulty': 1,
                    'question_text': 'In what year was the People Republic of China founded?',
                    'answer': '',
                    'correct_answer': 1949,
                    'type': 2
                  });
          await db.insert('question', {
                    'country': 'China',
                    'subject': 2,
                    'difficulty': 1,
                    'question_text': '',
                    'answer': answer30,
                    'correct_answer': 1,
                    'type': 3
                  });
          await db.insert('question', {
                    'country': 'China',
                    'subject': 2,
                    'difficulty': 1,
                    'question_text': 'China was affected by imperialist aggression.',
                    'answer': '',
                    'correct_answer': 1,
                    'type': 4
                  });
          await db.insert('question', {
                      'country': 'China',
                      'subject': 2,
                      'difficulty': 2,
                      'question_text':
                          'What was the capital of China during the Tang dynasty?',
                      'answer': answer31,
                      'correct_answer': 3,
                      'type': 1
                    });
          await db.insert('question', {
                    'country': 'China',
                    'subject': 2,
                    'difficulty': 2,
                    'question_text': 'In what year did the imperial system fall?',
                    'answer': '',
                    'correct_answer': 1911,
                    'type': 2
                  });
          await db.insert('question', {
                    'country': 'China',
                    'subject': 2,
                    'difficulty': 2,
                    'question_text': '',
                    'answer': answer32,
                    'correct_answer': 1,
                    'type': 3
                  });
          await db.insert('question', {
                    'country': 'China',
                    'subject': 2,
                    'difficulty': 2,
                    'question_text': 'The Yuan dynasty was founded by the Chinese.',
                    'answer': '',
                    'correct_answer': 2,
                    'type': 4
                  });
        await db.insert('question', {
          'country': 'United States',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'What is the capital of the USA?',
          'answer': answer33,
          'correct_answer': 2,
          'type': 1
        });
          await db.insert('question', {
                    'country': 'United States',
                    'subject': 1,
                    'difficulty': 1,
                    'question_text': '',
                    'answer': answer34,
                    'correct_answer': 1,
                    'type': 3
                  });
          await db.insert('question', {
                    'country': 'United States',
                    'subject': 1,
                    'difficulty': 1,
                    'question_text': 'San Francisco is a port city.',
                    'answer': '',
                    'correct_answer': 1,
                    'type': 4
                  });
          await db.insert('question', {
                    'country': 'United States',
                    'subject': 1,
                    'difficulty': 1,
                    'question_text': 'The panda bear can be found in Yellowstone National Park.',
                    'answer': '',
                    'correct_answer': 2,
                    'type': 4
                  });
          await db.insert('question', {
                    'country': 'United States',
                    'subject': 1,
                    'difficulty': 2,
                    'question_text':
                        'What are two of the US territories mentioned in the lesson besides Hawaii and Puerto Rico?',
                    'answer': answer35,
                    'correct_answer': 3,
                    'type': 1
                  });
          await db.insert('question', {
                    'country': 'United States',
                    'subject': 1,
                    'difficulty': 2,
                    'question_text': '',
                    'answer': answer36,
                    'correct_answer': 1,
                    'type': 3
                  });
          await db.insert('question', {
                    'country': 'United States',
                    'subject': 1,
                    'difficulty': 2,
                    'question_text':
                        'Name two states that have desert lands in the USA.',
                    'answer': answer38,
                    'correct_answer': 2,
                    'type': 1
                  });
          await db.insert('question', {
                    'country': 'United States',
                    'subject': 1,
                    'difficulty': 2,
                    'question_text': 'The Gobi Desert is found in the USA.',
                    'answer': '',
                    'correct_answer': 2,
                    'type': 4
                  });
        await db.insert('question', {
          'country': 'United States',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'Who lived in what is now the United States before European colonization?',
          'answer': answer39,
          'correct_answer': 1,
          'type': 1
        });
          await db.insert('question', {
                    'country': 'United States',
                    'subject': 2,
                    'difficulty': 1,
                    'question_text': 'In what year was the Declaration of Independence adopted',
                    'answer': '',
                    'correct_answer': 1776,
                    'type': 2
                  });
          await db.insert('question', {
                    'country': 'United States',
                    'subject': 2,
                    'difficulty': 1,
                    'question_text': '',
                    'answer': answer40,
                    'correct_answer': 1,
                    'type': 3
                  });
          await db.insert('question', {
                    'country': 'United States',
                    'subject': 2,
                    'difficulty': 1,
                    'question_text': 'The American Civil War ended in 1970.',
                    'answer': '',
                    'correct_answer': 2,
                    'type': 4
                  });
          await db.insert('question', {
                    'country': 'United States',
                    'subject': 2,
                    'difficulty': 2,
                    'question_text':
                        'What was the impact of the arrival of European explorers in the 16th century on North America?',
                    'answer': answer41,
                    'correct_answer': 4,
                    'type': 1
                  });
          await db.insert('question', {
                    'country': 'United States',
                    'subject': 2,
                    'difficulty': 2,
                    'question_text': 'in what year was the Volstead Act implemented.',
                    'answer': '',
                    'correct_answer': 1919,
                    'type': 2
                  });
          await db.insert('question', {
                    'country': 'United States',
                    'subject': 2,
                    'difficulty': 2,
                    'question_text': '',
                    'answer': answer42,
                    'correct_answer': 1,
                    'type': 3
                  });
          await db.insert('question', {
                    'country': 'United States',
                    'subject': 2,
                    'difficulty': 2,
                    'question_text': 'in the 19th century the USA became one of the most powerful nations in the world',
                    'answer': '',
                    'correct_answer': 1,
                    'type': 4
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
                  'question_text': 'What is the capital of Romania?',
                  'answer': answer175,
                  'correct_answer': 3,
                  'type': 1
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 1,
                  'difficulty': 1,
                  'question_text': 'What is the population of Romania?',
                  'answer': '',
                  'correct_answer': 19,
                  'type': 2
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 1,
                  'difficulty': 1,
                  'question_text': 'Which river flows through Romania?',
                  'answer': answer177,
                  'correct_answer': 2,
                  'type': 1
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 1,
                  'difficulty': 1,
                  'question_text': 'Which city is not located in Romania?',
                  'answer': answer178,
                  'correct_answer': 3,
                  'type': 1
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 1,
                  'difficulty': 1,
                  'question_text': 'What is the highest peak in Romania?',
                  'answer': answer179,
                  'correct_answer': 1,
                  'type': 1
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 1,
                  'difficulty': 1,
                  'question_text': 'What is the climate of Romania?',
                  'answer': answer180,
                  'correct_answer': 4,
                  'type': 1
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 1,
                  'difficulty': 1,
                  'question_text': 'Romania is one of the most populated countries in',
                  'answer': answer182,
                  'correct_answer': 4,
                  'type': 1
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 1,
                  'difficulty': 1,
                  'question_text': 'Which region is not in Romania?',
                  'answer': answer183,
                  'correct_answer': 3,
                  'type': 1
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 1,
                  'difficulty': 1,
                  'question_text': 'Ukraine is a neighbor of Romania',
                  'answer': '',
                  'correct_answer': 1,
                  'type': 4
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 1,
                  'difficulty': 2,
                  'question_text': 'Which country is not a neighbor of Romania?',
                  'answer': answer184,
                  'correct_answer': 2,
                  'type': 1
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 1,
                  'difficulty': 2,
                  'question_text': 'Which ports provide access to the Black Sea?',
                  'answer': answer186,
                  'correct_answer': 1,
                  'type': 1
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 1,
                  'difficulty': 2,
                  'question_text': 'Which mountain divides the territory of Romania?',
                  'answer': answer185,
                  'correct_answer': 2,
                  'type': 1
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 1,
                  'difficulty': 2,
                  'question_text': 'In which mountain is Moldoveanu Peak located?',
                  'answer': answer188,
                  'correct_answer': 3,
                  'type': 1
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 1,
                  'difficulty': 2,
                  'question_text': 'What is Transylvania known for?',
                  'answer': answer189,
                  'correct_answer': 1,
                  'type': 1
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 1,
                  'difficulty': 2,
                  'question_text': 'What influences Romania\'s climate?',
                  'answer': answer190,
                  'correct_answer': 2,
                  'type': 1
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 1,
                  'difficulty': 2,
                  'question_text': 'Which location is more popular in summer?',
                  'answer': answer191,
                  'correct_answer': 2,
                  'type': 1
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 1,
                  'difficulty': 2,
                  'question_text': 'Which location is more popular in winter?',
                  'answer': answer192,
                  'correct_answer': 3,
                  'type': 1
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 1,
                  'difficulty': 2,
                  'question_text': 'Romania is a NATO member',
                  'answer': '',
                  'correct_answer': 1,
                  'type': 4
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 1,
                  'difficulty': 2,
                  'question_text': 'Romania\'s population in millions is',
                  'answer': '',
                  'correct_answer': 19,
                  'type': 2
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 2,
                  'difficulty': 1,
                  'question_text': 'In ancient times, which people lived on the territory of Romania?',
                  'answer': answer194,
                  'correct_answer': 2,
                  'type': 1
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 2,
                  'difficulty': 1,
                  'question_text': 'Which empire conquered Dacia?',
                  'answer': answer195,
                  'correct_answer': 2,
                  'type': 1
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 2,
                  'difficulty': 1,
                  'question_text': 'Which principality belonged to the Romanian territory?',
                  'answer': answer196,
                  'correct_answer': 3,
                  'type': 2
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 2,
                  'difficulty': 1,
                  'question_text': 'In what year was the Union of the Romanian Principalities?',
                  'answer': '',
                  'correct_answer': 1859,
                  'type': 2
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 2,
                  'difficulty': 1,
                  'question_text': 'What regime did Romania adopt in 1947?',
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
                  'question_text': 'The Great Union took place in 1925',
                  'answer': "",
                  'correct_answer': 2,
                  'type': 4
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 2,
                  'difficulty': 1,
                  'question_text': 'In what year did Romania declare independence from the Ottoman Empire?',
                  'answer': '',
                  'correct_answer': 1877,
                  'type': 2
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 2,
                  'difficulty': 1,
                  'question_text': 'In what year did communism fall in Romania?',
                  'answer': '',
                  'correct_answer': 1989,
                  'type': 2
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 2,
                  'difficulty': 1,
                  'question_text': 'In what year did Romania become an EU member?',
                  'answer': answer199,
                  'correct_answer': 2,
                  'type': 1
                });


              await db.insert('question', {
                'country': 'Romania',
                'subject': 2,
                'difficulty': 1,
                'question_text': 'Who is the current President of Romania?',
                'answer': answer200,
                'correct_answer': 2,
                'type': 1
              });

              await db.insert('question', {
                'country': 'Romania',
                'subject': 2,
                'difficulty': 2,
                'question_text': 'Who ruled Moldova in the medieval period?',
                'answer': answer201,
                'correct_answer': 3,
                'type': 1
              });

              await db.insert('question', {
                'country': 'Romania',
                'subject': 2,
                'difficulty': 2,
                'question_text': 'During World War II, which power occupied Romania?',
                'answer': answer202,
                'correct_answer': 2,
                'type': 1
              });

              await db.insert('question', {
                'country': 'Romania',
                'subject': 2,
                'difficulty': 2,
                'question_text': 'In what year was Dacia conquered?',
                'answer': '',
                'correct_answer': 106,
                'type': 2
              });

              await db.insert('question', {
                'country': 'Romania',
                'subject': 2,
                'difficulty': 2,
                'question_text': 'In which century did the national movement grow?',
                'answer': '',
                'correct_answer': 19,
                'type': 2
              });

              await db.insert('question', {
                'country': 'Romania',
                'subject': 2,
                'difficulty': 2,
                'question_text': 'Who was the first leader of Communist Romania?',
                'answer': answer203,
                'correct_answer': 4,
                'type': 1
              });

              await db.insert('question', {
                'country': 'Romania',
                'subject': 2,
                'difficulty': 2,
                'question_text': 'In which war did the Romanian Principalities participate to consolidate their status as a sovereign nation?',
                'answer': answer204,
                'correct_answer': 2,
                'type': 1
              });

              await db.insert('question', {
                'country': 'Romania',
                'subject': 2,
                'difficulty': 2,
                'question_text': 'What is the name of the process through which the Romans influenced the culture of the Dacians?',
                'answer': answer205,
                'correct_answer': 1,
                'type': 1
              });

              await db.insert('question', {
                'country': 'Romania',
                'subject': 2,
                'difficulty': 2,
                'question_text': 'Vlad Țepeș ruled in Wallachia',
                'answer': "",
                'correct_answer': 1,
                'type': 4
              });

              await db.insert('question', {
                'country': 'Romania',
                'subject': 2,
                'difficulty': 2,
                'question_text': '',
                'answer': answer206,
                'correct_answer': 1,
                'type': 3
              });

              await db.insert('question', {
                'country': 'Romania',
                'subject': 1,
                'difficulty': 2,
                'question_text': '',
                'answer': answer207,
                'correct_answer': 1,
                'type': 3
              });

      },
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
        if (newVersion > oldVersion) {
          await db.execute('DROP TABLE question');
          await db.execute('DROP TABLE $table');
          await db.execute('DROP TABLE profile');
          await db.execute('DROP TABLE trophies');
          await db.execute('DROP TABLE faces');
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
            'picture': 1,
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
            'faces': facesList
          });

          await db.execute('''
          CREATE TABLE faces (
            faceID INTEGER PRIMARY KEY AUTOINCREMENT,
            face INTEGER,
            bought INTEGER,
            price INTEGER,
            color INTEGER
          )''');

          await db.insert('faces', {
            'face': 1,
            'bought': 1,
            'price': 50,
            'color': 0
          });

        await db.insert('faces', {
            'face': 2,
            'bought': 0,
            'price': 50,
            'color': 1
          });

          await db.insert('faces', {
            'face': 3,
            'bought': 0,
            'price': 50,
            'color': 2
          });

          await db.insert('faces', {
            'face': 4,
            'bought': 0,
            'price': 50,
            'color': 3
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
          'question_text': '',
          'answer': answer1,
          'correct_answer': 1,
          'type': 3
        });
          await db.insert('question', {
                    'country': 'Spain',
                    'subject': 1,
                    'difficulty': 1,
                    'question_text':
                        'What is the capital of Spain and the largest city in the country?',
                    'answer': answer2,
                    'correct_answer': 2,
                    'type': 1
                  });


          await db.insert('question', {
                    'country': 'Spain',
                    'subject': 1,
                    'difficulty': 1,
                    'question_text': 'What is the population of Spain?',
                    'answer': '',
                    'correct_answer': 47,
                    'type': 2
                  });
          await db.insert('question', {
                    'country': 'Spain',
                    'subject': 1,
                    'difficulty': 1,
                    'question_text': 'Spain and Portugal are neighboring countries.',
                    'answer': '',
                    'correct_answer': 1,
                    'type': 4
                  });

                    await db.insert('question', {
                    'country': 'Spain',
                    'subject': 1,
                    'difficulty': 2,
                    'question_text':
                        'Which of the following islands does not belong to Spain?',
                    'answer': answer3,
                    'correct_answer': 3,
                    'type': 1
                  });
          await db.insert('question', {
                    'country': 'Spain',
                    'subject': 1,
                    'difficulty': 2,
                    'question_text': '',
                    'answer': answer4,
                    'correct_answer': 1,
                    'type': 3
                  });
          await db.insert('question', {
                    'country': 'Spain',
                    'subject': 1,
                    'difficulty': 2,
                    'question_text': 'How many meters is the highest mountain peak?',
                    'answer': '',
                    'correct_answer': 3718,
                    'type': 2
                  });
          await db.insert('question', {
                    'country': 'Spain',
                    'subject': 1,
                    'difficulty': 2,
                    'question_text': 'Formentera belongs to Spain.',
                    'answer': '',
                    'correct_answer': 1,
                    'type': 4
                  });

          await db.insert('question', {
          'country': 'Spain',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'Who was one of the great Spanish explorers of the 16th-17th centuries who discovered America?',
          'answer': answer5,
          'correct_answer': 1,
          'type': 1
        });
          await db.insert('question', {
                    'country': 'Spain',
                    'subject': 2,
                    'difficulty': 1,
                    'question_text': 'When was the decree for the expulsion of Jews and Moors signed?',
                    'answer': '',
                    'correct_answer': 1492,
                    'type': 2
                  });

          await db.insert('question', {
                    'country': 'Spain',
                    'subject': 2,
                    'difficulty': 1,
                    'question_text': 'In the 19th century, Spain managed to keep all its colonies in Latin America.',
                    'answer': '',
                    'correct_answer': 2,
                    'type': 4
                  });
          await db.insert('question', {
          'country': 'Spain',
          'subject': 2,
          'difficulty': 1,
          'question_text': '',
          'answer': answer6,
          'correct_answer': 1,
          'type': 3
        });
          await db.insert('question', {
                    'country': 'Spain',
                    'subject': 2,
                    'difficulty': 2,
                    'question_text':
                        'What was the period of rule of dictator Francisco Franco in Spain?',
                    'answer': answer7,
                    'correct_answer': 2,
                    'type': 1
                  });
          await db.insert('question', {
                    'country': 'Spain',
                    'subject': 2,
                    'difficulty': 2,
                    'question_text': 'In what year did Spain become a democracy?',
                    'answer': '',
                    'correct_answer': 1978,
                    'type': 2
                  });
          await db.insert('question', {
                    'country': 'Spain',
                    'subject': 2,
                    'difficulty': 2,
                    'question_text': 'Ferdinand II and Isabella I were responsible for the completion of the Reconquista.',
                    'answer': '',
                    'correct_answer': 1,
                    'type': 4
                  });
          await db.insert('question', {
          'country': 'Spain',
          'subject': 2,
          'difficulty': 2,
          'question_text': '',
          'answer': answer8,
          'correct_answer': 1,
          'type': 3
        });
          await db.insert('question', {
          'country': 'France',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'What is the capital of France?',
          'answer': answer9,
          'correct_answer': 3,
          'type': 1
        });
          await db.insert('question', {
                    'country': 'France',
                    'subject': 1,
                    'difficulty': 1,
                    'question_text': 'What is the population of France?',
                    'answer': '',
                    'correct_answer': 67,
                    'type': 2
                  });
          await db.insert('question', {
                    'country': 'France',
                    'subject': 1,
                    'difficulty': 1,
                    'question_text': 'The Pyrenees Mountains form a natural border between France and Italy.',
                    'answer': '',
                    'correct_answer': 2,
                    'type': 4
                  });
          await db.insert('question', {
                    'country': 'France',
                    'subject': 1,
                    'difficulty': 1,
                    'question_text': '',
                    'answer': answer10,
                    'correct_answer': 1,
                    'type': 3
                  });
          await db.insert('question', {
                    'country': 'France',
                    'subject': 1,
                    'difficulty': 2,
                    'question_text':
                        'What is the most important river in France, known for flowing through the capital?',
                    'answer': answer11,
                    'correct_answer': 2,
                    'type': 1
                  });
          await db.insert('question', {
                    'country': 'France',
                    'subject': 1,
                    'difficulty': 2,
                    'question_text': '',
                    'answer': answer12,
                    'correct_answer': 1,
                    'type': 3
                  });
          await db.insert('question', {
                    'country': 'France',
                    'subject': 1,
                    'difficulty': 2,
                    'question_text': 'How many meters is the highest peak in France?',
                    'answer': '',
                    'correct_answer': 4810,
                    'type': 2
                  });
          await db.insert('question', {
                    'country': 'France',
                    'subject': 1,
                    'difficulty': 2,
                    'question_text': 'The Eiffel Tower is located in Paris.',
                    'answer': '',
                    'correct_answer': 1,
                    'type': 4
                  });

         await db.insert('question', {
          'country': 'France',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'Care a fost una dintre provinciile romane în care a fost încorporată Franța în antichitate?',
          'answer': answer13,
          'correct_answer': 3,
          'type': 1
        });
          await db.insert('question', {
                    'country': 'France',
                    'subject': 2,
                    'difficulty': 1,
                    'question_text': 'In what year did the French Revolution take place?',
                    'answer': '',
                    'correct_answer': 1789,
                    'type': 2
                  });
          await db.insert('question', {
                    'country': 'France',
                    'subject': 2,
                    'difficulty': 1,
                    'question_text': '',
                    'answer': answer14,
                    'correct_answer': 1,
                    'type': 3
                  });
          await db.insert('question', {
                    'country': 'France',
                    'subject': 2,
                    'difficulty': 1,
                    'question_text': 'France was one of the founding members of the EU.',
                    'answer': '',
                    'correct_answer': 1,
                    'type': 4
                  });


          await db.insert('question', {
                    'country': 'France',
                    'subject': 2,
                    'difficulty': 2,
                    'question_text':
                        'Care a fost perioada de dominație a lui Napoleon Bonaparte în Franța?',
                    'answer': answer15,
                    'correct_answer': 3,
                    'type': 1
                  });
          await db.insert('question', {
                    'country': 'France',
                    'subject': 2,
                    'difficulty': 2,
                    'question_text': 'In what year was the Third Republic established?',
                    'answer': '',
                    'correct_answer': 1870,
                    'type': 2
                  });
          await db.insert('question', {
                    'country': 'France',
                    'subject': 2,
                    'difficulty': 2,
                    'question_text': '',
                    'answer': answer16,
                    'correct_answer': 1,
                    'type': 3
                  });
          await db.insert('question', {
                    'country': 'France',
                    'subject': 2,
                    'difficulty': 2,
                    'question_text': 'The Nazi occupation was from 1920 to 1957.',
                    'answer': '',
                    'correct_answer': 2,
                    'type': 4
                  });
          await db.insert('question', {
          'country': 'Italy',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'What is the capital of Italy?',
          'answer': answer17,
          'correct_answer': 1,
          'type': 1
        });
        await db.insert('question', {
                  'country': 'Italy',
                  'subject': 1,
                  'difficulty': 2,
                  'question_text': 'What is the population of Italy?',
                  'answer': '',
                  'correct_answer': 60,
                  'type': 2
                });
        await db.insert('question', {
                  'country': 'Italy',
                  'subject': 1,
                  'difficulty': 1,
                  'question_text': '',
                  'answer': answer18,
                  'correct_answer': 1,
                  'type': 3
                });
        await db.insert('question', {
                  'country': 'Italy',
                  'subject': 1,
                  'difficulty': 1,
                  'question_text': 'Venice is renowned for its Carnival festival.',
                  'answer': '',
                  'correct_answer': 1,
                  'type': 4
                });
        await db.insert('question', {
                  'country': 'Italy',
                  'subject': 1,
                  'difficulty': 2,
                  'question_text': 'What is the largest island in Italy?',
                  'answer': answer19,
                  'correct_answer': 1,
                  'type': 1
                });
        await db.insert('question', {
                  'country': 'Italy',
                  'subject': 1,
                  'difficulty': 1,
                  'question_text': 'What is the altitude of Mont Blanc peak in the Graian Alps?',
                  'answer': '',
                  'correct_answer': 4808,
                  'type': 2
                });
        await db.insert('question', {
                  'country': 'Italy',
                  'subject': 1,
                  'difficulty': 2,
                  'question_text': '',
                  'answer': answer20,
                  'correct_answer': 1,
                  'type': 3
                });
        await db.insert('question', {
                  'country': 'Italy',
                  'subject': 1,
                  'difficulty': 2,
                  'question_text': 'Venice is renowned for its Carnival festival.',
                  'answer': '',
                  'correct_answer': 1,
                  'type': 4
                });
          
          await db.insert('question', {
            'country': 'Italy',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'In which period was Italy the epicenter of a powerful cultural and artistic movement?',
            'answer': answer21,
            'correct_answer': 3,
            'type': 1
          });
        await db.insert('question', {
                  'country': 'Italy',
                  'subject': 2,
                  'difficulty': 1,
                  'question_text': 'In what year was the modern Italian state formed?',
                  'answer': '',
                  'correct_answer': 1871,
                  'type': 2
                });
        await db.insert('question', {
                  'country': 'Italy',
                  'subject': 2,
                  'difficulty': 1,
                  'question_text': '',
                  'answer': answer22,
                  'correct_answer': 1,
                  'type': 3
                });
        await db.insert('question', {
                  'country': 'Italy',
                  'subject': 2,
                  'difficulty': 1,
                  'question_text': 'Italy joined the Allied Powers in 1915.',
                  'answer': '',
                  'correct_answer': 1,
                  'type': 4
                });
        await db.insert('question', {
                    'country': 'Italy',
                    'subject': 2,
                    'difficulty': 2,
                    'question_text':
                        'Who was one of the personalities who contributed to the formation of the Roman Empire?',
                    'answer': answer23,
                    'correct_answer': 1,
                    'type': 1
                  });
        await db.insert('question', {
                  'country': 'Italy',
                  'subject': 2,
                  'difficulty': 2,
                  'question_text': 'In which century did the two world wars take place?',
                  'answer': '',
                  'correct_answer': 20,
                  'type': 2
                });
        await db.insert('question', {
                  'country': 'Italy',
                  'subject': 2,
                  'difficulty': 2,
                  'question_text': '',
                  'answer': answer24,
                  'correct_answer': 1,
                  'type': 3
                });
        await db.insert('question', {
                  'country': 'Italy',
                  'subject': 2,
                  'difficulty': 2,
                  'question_text': 'The Napoleonic Wars took place in the 19th century.',
                  'answer': '',
                  'correct_answer': 1,
                  'type': 4
                });
                  await db.insert('question', {
                  'country': 'China',
                  'subject': 1,
                  'difficulty': 1,
                  'question_text': 'The Yangtze is the third longest river in the world.',
                  'answer': '',
                  'correct_answer': 1,
                  'type': 4
                });
        await db.insert('question', {
                  'country': 'China',
                  'subject': 1,
                  'difficulty': 1,
                  'question_text': '',
                  'answer': answer26,
                  'correct_answer': 1,
                  'type': 3
                });
        await db.insert('question', {
                  'country': 'China',
                  'subject': 1,
                  'difficulty': 1,
                  'question_text': 'Singapore is part of China.',
                  'answer': '',
                  'correct_answer': 2,
                  'type': 4
                });

        await db.insert('question', {
                  'country': 'China',
                  'subject': 1,
                  'difficulty': 2,
                  'question_text': 'What is the highest peak in China?',
                  'answer': answer27,
                  'correct_answer': 1,
                  'type': 1
                });
        await db.insert('question', {
                  'country': 'China',
                  'subject': 1,
                  'difficulty': 2,
                  'question_text': '',
                  'answer': answer28,
                  'correct_answer': 1,
                  'type': 3
                });
        await db.insert('question', {
                  'country': 'China',
                  'subject': 1,
                  'difficulty': 2,
                  'question_text': 'Chongqing is an important city.',
                  'answer': '',
                  'correct_answer': 1,
                  'type': 4
                });
        await db.insert('question', {
                  'country': 'China',
                  'subject': 1,
                  'difficulty': 2,
                  'question_text': 'Xinjiang is an autonomous region.',
                  'answer': '',
                  'correct_answer': 1,
                  'type': 4
                });
          await db.insert('question', {
            'country': 'China',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'Which dynasty began the process of unifying China under a central authority?',
            'answer': answer29,
            'correct_answer': 3,
            'type': 1
          });
            await db.insert('question', {
                      'country': 'China',
                      'subject': 2,
                      'difficulty': 1,
                      'question_text': 'In what year was the People Republic of China founded?',
                      'answer': '',
                      'correct_answer': 1949,
                      'type': 2
                    });
            await db.insert('question', {
                      'country': 'China',
                      'subject': 2,
                      'difficulty': 1,
                      'question_text': '',
                      'answer': answer30,
                      'correct_answer': 1,
                      'type': 3
                    });
            await db.insert('question', {
                      'country': 'China',
                      'subject': 2,
                      'difficulty': 1,
                      'question_text': 'China was affected by imperialist aggression.',
                      'answer': '',
                      'correct_answer': 1,
                      'type': 4
                    });
            await db.insert('question', {
                        'country': 'China',
                        'subject': 2,
                        'difficulty': 2,
                        'question_text':
                            'What was the capital of China during the Tang dynasty?',
                        'answer': answer31,
                        'correct_answer': 3,
                        'type': 1
                      });
            await db.insert('question', {
                      'country': 'China',
                      'subject': 2,
                      'difficulty': 2,
                      'question_text': 'In what year did the imperial system fall?',
                      'answer': '',
                      'correct_answer': 1911,
                      'type': 2
                    });
            await db.insert('question', {
                      'country': 'China',
                      'subject': 2,
                      'difficulty': 2,
                      'question_text': '',
                      'answer': answer32,
                      'correct_answer': 1,
                      'type': 3
                    });
            await db.insert('question', {
                      'country': 'China',
                      'subject': 2,
                      'difficulty': 2,
                      'question_text': 'The Yuan dynasty was founded by the Chinese.',
                      'answer': '',
                      'correct_answer': 2,
                      'type': 4
                    });
                     await db.insert('question', {
          'country': 'United States',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'What is the capital of the USA?',
          'answer': answer33,
          'correct_answer': 2,
          'type': 1
        });
          await db.insert('question', {
                    'country': 'United States',
                    'subject': 1,
                    'difficulty': 1,
                    'question_text': '',
                    'answer': answer34,
                    'correct_answer': 1,
                    'type': 3
                  });
          await db.insert('question', {
                    'country': 'United States',
                    'subject': 1,
                    'difficulty': 1,
                    'question_text': 'San Francisco is a port city.',
                    'answer': '',
                    'correct_answer': 1,
                    'type': 4
                  });
          await db.insert('question', {
                    'country': 'United States',
                    'subject': 1,
                    'difficulty': 1,
                    'question_text': 'The panda bear can be found in Yellowstone National Park.',
                    'answer': '',
                    'correct_answer': 2,
                    'type': 4
                  });
          await db.insert('question', {
                    'country': 'United States',
                    'subject': 1,
                    'difficulty': 2,
                    'question_text':
                        'What are two of the US territories mentioned in the lesson besides Hawaii and Puerto Rico?',
                    'answer': answer35,
                    'correct_answer': 3,
                    'type': 1
                  });
          await db.insert('question', {
                    'country': 'United States',
                    'subject': 1,
                    'difficulty': 2,
                    'question_text': '',
                    'answer': answer36,
                    'correct_answer': 1,
                    'type': 3
                  });
          await db.insert('question', {
                    'country': 'United States',
                    'subject': 1,
                    'difficulty': 2,
                    'question_text':
                        'Name two states that have desert lands in the USA.',
                    'answer': answer38,
                    'correct_answer': 2,
                    'type': 1
                  });
                  await db.insert('question', {
                    'country': 'United States',
                    'subject': 1,
                    'difficulty': 2,
                    'question_text': 'The Gobi Desert is found in the USA.',
                    'answer': '',
                    'correct_answer': 2,
                    'type': 4
                  });
                         await db.insert('question', {
          'country': 'United States',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'Who lived in what is now the United States before European colonization?',
          'answer': answer39,
          'correct_answer': 1,
          'type': 1
        });
          await db.insert('question', {
                    'country': 'United States',
                    'subject': 2,
                    'difficulty': 1,
                    'question_text': 'In what year was the Declaration of Independence adopted',
                    'answer': '',
                    'correct_answer': 1776,
                    'type': 2
                  });
          await db.insert('question', {
                    'country': 'United States',
                    'subject': 2,
                    'difficulty': 1,
                    'question_text': '',
                    'answer': answer40,
                    'correct_answer': 1,
                    'type': 3
                  });
          await db.insert('question', {
                    'country': 'United States',
                    'subject': 2,
                    'difficulty': 1,
                    'question_text': 'The American Civil War ended in 1970.',
                    'answer': '',
                    'correct_answer': 2,
                    'type': 4
                  });
          await db.insert('question', {
                    'country': 'United States',
                    'subject': 2,
                    'difficulty': 2,
                    'question_text':
                        'What was the impact of the arrival of European explorers in the 16th century on North America?',
                    'answer': answer41,
                    'correct_answer': 4,
                    'type': 1
                  });
          await db.insert('question', {
                    'country': 'United States',
                    'subject': 2,
                    'difficulty': 2,
                    'question_text': 'in what year was the Volstead Act implemented.',
                    'answer': '',
                    'correct_answer': 1919,
                    'type': 2
                  });
          await db.insert('question', {
                    'country': 'United States',
                    'subject': 2,
                    'difficulty': 2,
                    'question_text': '',
                    'answer': answer42,
                    'correct_answer': 1,
                    'type': 3
                  });
          await db.insert('question', {
                    'country': 'United States',
                    'subject': 2,
                    'difficulty': 2,
                    'question_text': 'in the 19th century the USA became one of the most powerful nations in the world',
                    'answer': '',
                    'correct_answer': 1,
                    'type': 4
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
                  'question_text': 'What is the capital of Romania?',
                  'answer': answer175,
                  'correct_answer': 3,
                  'type': 1
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 1,
                  'difficulty': 1,
                  'question_text': 'What is the population of Romania?',
                  'answer': '',
                  'correct_answer': 19,
                  'type': 2
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 1,
                  'difficulty': 1,
                  'question_text': 'Which river flows through Romania?',
                  'answer': answer177,
                  'correct_answer': 2,
                  'type': 1
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 1,
                  'difficulty': 1,
                  'question_text': 'Which city is not located in Romania?',
                  'answer': answer178,
                  'correct_answer': 3,
                  'type': 1
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 1,
                  'difficulty': 1,
                  'question_text': 'What is the highest peak in Romania?',
                  'answer': answer179,
                  'correct_answer': 1,
                  'type': 1
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 1,
                  'difficulty': 1,
                  'question_text': 'What is the climate of Romania?',
                  'answer': answer180,
                  'correct_answer': 4,
                  'type': 1
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 1,
                  'difficulty': 1,
                  'question_text': 'Romania is one of the most populated countries in',
                  'answer': answer182,
                  'correct_answer': 4,
                  'type': 1
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 1,
                  'difficulty': 1,
                  'question_text': 'Which region is not in Romania?',
                  'answer': answer183,
                  'correct_answer': 3,
                  'type': 1
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 1,
                  'difficulty': 1,
                  'question_text': 'Ukraine is a neighbor of Romania',
                  'answer': '',
                  'correct_answer': 1,
                  'type': 4
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 1,
                  'difficulty': 2,
                  'question_text': 'Which country is not a neighbor of Romania?',
                  'answer': answer184,
                  'correct_answer': 2,
                  'type': 1
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 1,
                  'difficulty': 2,
                  'question_text': 'Which ports provide access to the Black Sea?',
                  'answer': answer186,
                  'correct_answer': 1,
                  'type': 1
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 1,
                  'difficulty': 2,
                  'question_text': 'Which mountain divides the territory of Romania?',
                  'answer': answer185,
                  'correct_answer': 2,
                  'type': 1
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 1,
                  'difficulty': 2,
                  'question_text': 'In which mountain is Moldoveanu Peak located?',
                  'answer': answer188,
                  'correct_answer': 3,
                  'type': 1
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 1,
                  'difficulty': 2,
                  'question_text': 'What is Transylvania known for?',
                  'answer': answer189,
                  'correct_answer': 1,
                  'type': 1
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 1,
                  'difficulty': 2,
                  'question_text': 'What influences Romania\'s climate?',
                  'answer': answer190,
                  'correct_answer': 2,
                  'type': 1
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 1,
                  'difficulty': 2,
                  'question_text': 'Which location is more popular in summer?',
                  'answer': answer191,
                  'correct_answer': 2,
                  'type': 1
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 1,
                  'difficulty': 2,
                  'question_text': 'Which location is more popular in winter?',
                  'answer': answer192,
                  'correct_answer': 3,
                  'type': 1
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 1,
                  'difficulty': 2,
                  'question_text': 'Romania is a NATO member',
                  'answer': '',
                  'correct_answer': 1,
                  'type': 4
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 1,
                  'difficulty': 2,
                  'question_text': 'Romania\'s population in millions is',
                  'answer': '',
                  'correct_answer': 19,
                  'type': 2
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 2,
                  'difficulty': 1,
                  'question_text': 'In ancient times, which people lived on the territory of Romania?',
                  'answer': answer194,
                  'correct_answer': 2,
                  'type': 1
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 2,
                  'difficulty': 1,
                  'question_text': 'Which empire conquered Dacia?',
                  'answer': answer195,
                  'correct_answer': 2,
                  'type': 1
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 2,
                  'difficulty': 1,
                  'question_text': 'Which principality belonged to the Romanian territory?',
                  'answer': answer196,
                  'correct_answer': 3,
                  'type': 2
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 2,
                  'difficulty': 1,
                  'question_text': 'In what year was the Union of the Romanian Principalities?',
                  'answer': '',
                  'correct_answer': 1859,
                  'type': 2
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 2,
                  'difficulty': 1,
                  'question_text': 'What regime did Romania adopt in 1947?',
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
                  'question_text': 'The Great Union took place in 1925',
                  'answer': "",
                  'correct_answer': 2,
                  'type': 4
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 2,
                  'difficulty': 1,
                  'question_text': 'In what year did Romania declare independence from the Ottoman Empire?',
                  'answer': '',
                  'correct_answer': 1877,
                  'type': 2
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 2,
                  'difficulty': 1,
                  'question_text': 'In what year did communism fall in Romania?',
                  'answer': '',
                  'correct_answer': 1989,
                  'type': 2
                });

                await db.insert('question', {
                  'country': 'Romania',
                  'subject': 2,
                  'difficulty': 1,
                  'question_text': 'In what year did Romania become an EU member?',
                  'answer': answer199,
                  'correct_answer': 2,
                  'type': 1
                });


              await db.insert('question', {
                'country': 'Romania',
                'subject': 2,
                'difficulty': 1,
                'question_text': 'Who is the current President of Romania?',
                'answer': answer200,
                'correct_answer': 2,
                'type': 1
              });

              await db.insert('question', {
                'country': 'Romania',
                'subject': 2,
                'difficulty': 2,
                'question_text': 'Who ruled Moldova in the medieval period?',
                'answer': answer201,
                'correct_answer': 3,
                'type': 1
              });

              await db.insert('question', {
                'country': 'Romania',
                'subject': 2,
                'difficulty': 2,
                'question_text': 'During World War II, which power occupied Romania?',
                'answer': answer202,
                'correct_answer': 2,
                'type': 1
              });

              await db.insert('question', {
                'country': 'Romania',
                'subject': 2,
                'difficulty': 2,
                'question_text': 'In what year was Dacia conquered?',
                'answer': '',
                'correct_answer': 106,
                'type': 2
              });

              await db.insert('question', {
                'country': 'Romania',
                'subject': 2,
                'difficulty': 2,
                'question_text': 'In which century did the national movement grow?',
                'answer': '',
                'correct_answer': 19,
                'type': 2
              });

              await db.insert('question', {
                'country': 'Romania',
                'subject': 2,
                'difficulty': 2,
                'question_text': 'Who was the first leader of Communist Romania?',
                'answer': answer203,
                'correct_answer': 4,
                'type': 1
              });

              await db.insert('question', {
                'country': 'Romania',
                'subject': 2,
                'difficulty': 2,
                'question_text': 'In which war did the Romanian Principalities participate to consolidate their status as a sovereign nation?',
                'answer': answer204,
                'correct_answer': 2,
                'type': 1
              });

              await db.insert('question', {
                'country': 'Romania',
                'subject': 2,
                'difficulty': 2,
                'question_text': 'What is the name of the process through which the Romans influenced the culture of the Dacians?',
                'answer': answer205,
                'correct_answer': 1,
                'type': 1
              });

              await db.insert('question', {
                'country': 'Romania',
                'subject': 2,
                'difficulty': 2,
                'question_text': 'Vlad Țepeș ruled in Wallachia',
                'answer': "",
                'correct_answer': 1,
                'type': 4
              });

              await db.insert('question', {
                'country': 'Romania',
                'subject': 2,
                'difficulty': 2,
                'question_text': '',
                'answer': answer206,
                'correct_answer': 1,
                'type': 3
              });

              await db.insert('question', {
                'country': 'Romania',
                'subject': 1,
                'difficulty': 2,
                'question_text': '',
                'answer': answer207,
                'correct_answer': 1,
                'type': 3
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

  Future<void> incrementCoins(int coinsNumber) async {
    Database db = await this.database;

    await db.rawUpdate('UPDATE profile SET coins = coins + $coinsNumber');
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

  Future<List<String>> queryExistingCountries() async {
  Database db = await database;
  int exist = 1;
  List<Map<String, dynamic>> result = await db.query(
    'country',
    columns: ['name'],
    where: 'doesExist = ?',
    whereArgs: [exist],
  );

  if (result.isNotEmpty) {
    return result.map((country) => country['name'] as String).toList();
  } else {
    throw Exception('Countries not found');
  }
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
  
  Future<int> setBought(int face) async {
    Database db = await database;
    return await db.update(
      'faces',
      {
        'bought': 1,
      },
      where: 'face = ?',
      whereArgs: [face],
    );
  }

  Future<int> setFaceList(String faceList) async {
    int id = 1;
    Database db = await database;
    return await db.update(
      'profile',
      {
        'faces': faceList,
      },
      where: 'profileID = ?',
      whereArgs: [id],
    );
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

  Future<List<Map<String, dynamic>>> queryAllFaces() async {
    Database db = await instance.database;
    return await db.query('faces', orderBy: 'faceID ASC');
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
