import 'dart:async';
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
  String answer17 = jsonEncode(['Rome', 'Milan', 'Venice', 'Naples']);
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
  String answer39 = jsonEncode([
    'Native American tribes only',
    'Indigenous tribes and European settlers',
    'European settlers only',
    'African populations only'
  ]);
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
  String answer42 = jsonEncode([
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
  String answer178 =
      jsonEncode(['Cluj-Napoca', 'Timișoara', 'Sofia', 'Bucharest']);
  String answer179 =
      jsonEncode(['Moldoveanu', 'Negoiu', 'Făgăraș', 'Pietrosu']);
  String answer180 = jsonEncode(
      ['Oceanic Temperate', 'Mediterranean', 'Polar', 'Continental Temperate']);

  String answer182 = jsonEncode([
    'Central Europe',
    'Western Europe',
    'Northern Europe',
    'Eastern Europe'
  ]);
  String answer183 =
      jsonEncode(['Transylvania', 'Moldova', 'Catalonia', 'Maramureș']);
  String answer184 = jsonEncode(['Hungary', 'Spain', 'Bulgaria', 'Ukraine']);
  String answer185 = jsonEncode(['Făgăraș', 'Carpathians', 'Apuseni', 'Alps']);
  String answer186 =
      jsonEncode(['Constanța', 'Cluj-Napoca', 'Bucharest', 'Timișoara']);
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
  String answer190 = jsonEncode(
      ['Bucharest', 'Carpathian Mountains', 'Danube', 'Cluj-Napoca']);
  String answer191 =
      jsonEncode(['Carpathian Mountains', 'Black Sea', 'Danube', 'Iași']);
  String answer192 =
      jsonEncode(['Danube', 'Black Sea', 'Carpathian Mountains', 'Iași']);
  String answer194 =
      jsonEncode(['Hungarians', 'Dacians', 'Egyptians', 'Celts']);
  String answer195 = jsonEncode(
      ['Ottoman Empire', 'Roman Empire', 'Mongol Empire', 'Babylonian Empire']);
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
  String answer198 =
      jsonEncode(['Democratic', 'Communist', 'Totalitarian', 'Fascist']);
  String answer199 = jsonEncode(['2004', '2007', '2010', '1997']);
  String answer200 = jsonEncode(
      ['Traian Băsescu', 'Klaus Iohannis', 'Emil Boc', 'Nicolae Ceaușescu']);
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
  String answer205 = jsonEncode(
      ['Romanization', 'Leveling', 'Dacianization', 'Globalization']);
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
  static final _databaseVersion = 118;

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
            faces TEXT,
            double_iq INTEGER
          )''');

        await db.execute('''
          CREATE TABLE faces (
            faceID INTEGER PRIMARY KEY AUTOINCREMENT,
            face INTEGER,
            bought INTEGER,
            price INTEGER,
            color INTEGER
          )''');

        await db
            .insert('faces', {'face': 1, 'bought': 1, 'price': 50, 'color': 0});

        await db
            .insert('faces', {'face': 2, 'bought': 0, 'price': 50, 'color': 1});

        await db
            .insert('faces', {'face': 3, 'bought': 0, 'price': 50, 'color': 2});

        await db
            .insert('faces', {'face': 4, 'bought': 0, 'price': 50, 'color': 3});

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
          'faces': facesList,
          'double_iq': 0,
        });

        await db.insert('country', {
          'name': 'Romania',
          'geographyLesson':
              'Romania is located in the southeastern part of Europe, bordered by Bulgaria, Serbia, Hungary, Ukraine, and the Republic of Moldova. Its capital, Bucharest, is the largest city and the main cultural, economic, and political center of the country. With a population of approximately 19 million people, Romania is one of the most populous countries in Eastern Europe. Its territory is divided by the Carpathian Mountains, which form a natural barrier that separates the country into three distinct geographical regions: Transylvania, Moldova, and Maramureș. These mountains are often described as the heart of Romania, offering not only picturesque landscapes but also an important source of natural resources and biodiversity. The Danube, a vital navigable river, flows through the south of the country, marking the natural border with Bulgaria and providing access to the Black Sea through the ports of Constanța and Mangalia. This geographic feature has facilitated trade and cultural interactions with other regions of Europe and the world. Besides Bucharest, other important cities in Romania include Cluj-Napoca, Timișoara, Iași, and Constanța, each with its own cultural and economic wealth. Romania is a developing country, a member of the European Union and NATO, with a mixed economy in which industry, agriculture, and services play significant roles in its economic growth. The highest point in Romania is Moldoveanu Peak in the Făgăraș Mountains, with an impressive altitude of 2,544 meters. This height offers spectacular panoramas and opportunities for mountaineering and mountain tourism. The historical regions of Romania, such as Transylvania, known for its mountainous landscapes and historical towns; Moldova, renowned for its historical sites and rich cultural heritage; and Maramureș, with its rural landscapes and authentic traditions, add uniqueness and diversity to this country. Romania’s climate is temperate-continental, with hot summers and cold winters, influenced by the Carpathian Mountains and the Black Sea. This climatic variety offers favorable conditions for a diverse range of activities, from winter sports in the Carpathians to relaxation by the Black Sea during summer.',
          'historyLesson':
              'In a corner of Europe lies a country rich in history and tradition called Romania. In ancient times, the territory of Romania was inhabited by the Dacians, a proud people with a rich culture. In 106 AD, the Roman Empire conquered this territory, beginning the process of Romanization. This interaction between the Dacians and the Romans left a strong imprint on Romanian identity, reflected in the language, customs, and traditions of the people. During the medieval period, the Romanian territory was divided into autonomous principalities, Moldavia and Wallachia. Under the leadership of their rulers, such as Stephen the Great and Vlad the Impaler, these principalities fought for independence and resisted foreign pressures, laying the foundations for the Romanian states. In the 19th century, the national movement grew significantly, and the Union of the Romanian Principalities took place in 1859 under the reign of Alexandru Ioan Cuza. This important step paved the way for the formation of modern Romania. In 1877, Romania proclaimed its independence from the Ottoman Empire and participated in the War of Independence, solidifying its status as a sovereign nation. Between the two world wars, Romania experienced periods of political instability and economic progress. In 1918, the Great Union between Transylvania, Moldavia, and Wallachia occurred. However, during World War II, the country was occupied by Axis forces, and after the war, it became a satellite state of the Soviet Union. In 1947, Romania became a communist republic under the leadership of Gheorghe Gheorghiu-Dej and later Nicolae Ceaușescu. The communist regime was characterized by political oppression and economic stagnation. However, in December 1989, the Romanian Revolution led to the fall of the communist regime and the establishment of democracy in the country. After the Revolution, Romania went through a difficult transition period towards a market economy and democracy. In 2007, Romania became a member of the European Union, solidifying its commitment to democratic values and European integration.',
          'geography_completed': 0,
          'history_completed': 0,
          'doesExist': 1
        });

        await db.insert('country', {
          'name': 'Spain',
          'geographyLesson':
              'Spain is located in the southwestern part of Europe, bordered by France to the north and northeast, Portugal to the west, and Andorra and Gibraltar to the south. Its capital, Madrid, is the largest city and the cultural, economic, and political center of the country. With a population of approximately 47 million people, Spain is one of the most populous countries in Europe. Its territory is characterized by a great geographical variety, including mountainous areas, plains, and coastal shores. The Pyrenees form the northern border of the country, offering spectacular mountain landscapes and opportunities for winter sports. In central and southern Spain, there are several mountain ranges such as the Cantabrian Mountains, the Central Mountains, and the Betic Mountains, which influence the climate and geography of the respective regions. Additionally, Spain has a vast network of rivers, such as the Ebro, Tagus, and Guadalquivir, which contribute to the fertility of the plains and the development of agriculture. A significant geographical feature of Spain is the Iberian Peninsula, which also includes Portugal, and is surrounded by the Atlantic Ocean and the Mediterranean Sea. This strategic position has facilitated maritime trade and brought diverse cultural influences throughout history. In addition to Madrid, other important cities in Spain include Barcelona, Valencia, Seville, and Bilbao, each with its own distinct geographical and cultural characteristics. Spain is a popular tourist destination due to its Mediterranean beaches, historical cities, and varied natural landscapes. The highest peak in Spain is Mount Teide in the Canary Islands, with an altitude of 3,718 meters. This volcanic peak offers opportunities for exploration and ecological tourism in a unique environment. The climate of Spain ranges from Mediterranean in the south to temperate in the north, with oceanic and continental influences felt in different regions of the country. This climatic diversity provides favorable conditions for a wide range of outdoor activities and agriculture. Spain includes several important archipelagos, such as the Balearic Islands in the Mediterranean Sea and the Canary Islands in the Atlantic Ocean. The Balearic Islands, including Mallorca, Menorca, Ibiza, and Formentera, are known for their beautiful beaches, crystal-clear waters, and vibrant nightlife. These islands are a popular destination for tourists from around the world, offering a variety of recreational and cultural activities. The Canary Islands, located off the African coast, are formed from volcanic rock and offer a spectacular landscape and ecological diversity. Tenerife is known for its volcanic peak Teide, while Gran Canaria is famous for its sand dunes and rich marine life.',
          'historyLesson':
              'In southwestern Europe lies a country with a rich historical heritage called Spain. In ancient times, the Spanish territory was inhabited by peoples such as the Iberians and Celtiberians, who were later colonized by the Romans, contributing to the formation of the Roman province of Hispania. During the Middle Ages, Spain was divided into numerous kingdoms and taifas, each with its own culture and identity. Among the most important kingdoms were the Kingdom of Castile, the Kingdom of Aragon, and the Kingdom of Navarre. During this period, there were also times of coexistence and conflict among Christians, Muslims, and Jews, highlighting the religious and cultural diversity of the Iberian Peninsula. In the 15th century, through the marriage of King Ferdinand II of Aragon and Queen Isabella I of Castile, a union between the two kingdoms was created, marking the beginning of the formation of modern Spain. Under their rule, the Reconquista was completed, the reconquest of Muslim territories in Spain, and in 1492, the decree for the expulsion of Jews and Moors was signed, consolidating Catholic control over the kingdom. The period of conquest and colonization of the Americas by the Spaniards brought great wealth and power to Spain in the 16th and 17th centuries. This era was marked by great explorers and conquerors such as Christopher Columbus, Hernán Cortés, and Francisco Pizarro, who expanded Spanish influence worldwide. In the 19th century, Spain was involved in numerous internal and external conflicts, including the Peninsular War against Napoleon armies and the loss of most of its American colonies following the Latin American wars of independence. In the 20th century, Spain witnessed periods of political instability, including the dictatorship of Francisco Franco from 1939 to 1975. After his death, Spain underwent a transition to democracy, culminating in the adoption of a democratic constitution in 1978. Today, Spain is a parliamentary monarchy and a member of the European Union, with a diversified economy and an impressive cultural and historical heritage.',
          'geography_completed': 0,
          'history_completed': 0,
          'doesExist': 1
        });

        await db.insert('country', {
          'name': 'France',
          'geographyLesson':
              'France\'s geography offers remarkable diversity, encompassing mountainous regions, fertile plains, and spectacular coastlines. Located in western Europe, France borders Spain to the southwest, Belgium and Luxembourg to the northeast, Germany and Switzerland to the east, Italy to the southeast, and the Mediterranean Sea to the south. The capital of France, Paris, is one of the worlds largest cultural and economic centers, known for its remarkable tourist attractions such as the Eiffel Tower, Notre-Dame Cathedral, and the Louvre Museum. With a population of approximately 67 million people, France is one of the most populous countries in Europe. The terrain of France is varied and spectacular. The Alps extend in the southeastern part of the country, marking the border with Italy, and include France\'s highest peak, Mont Blanc, with an altitude of 4,810 meters. In the southwestern part, the Pyrenees form a natural border with Spain, offering impressive mountainous landscapes and facilitating sports activities such as skiing and mountaineering. In northern France, the Northern Plains and the Loire Plains are fertile regions that support rich agriculture and diverse industries. France is also traversed by numerous important rivers, such as the Seine, Loire, and Rhone, which have had a significant impact on its economic and cultural development. France is recognized for its picturesque coastline, which stretches along the Mediterranean Sea and the Atlantic Ocean. The French Riviera, located in the southeast of the country, is known for its luxury resorts and beautiful beaches, while Brittany, in the northwest, is famous for its wild landscapes and impressive cliffs. Besides Paris, other important cities in France include Lyon, Marseille, Bordeaux, and Strasbourg, each with its own cultural identity and distinct attractions. France is also renowned for its fine wines, refined gastronomy, and rich culture. The climate of France varies from Mediterranean in the south to temperate in the north, with oceanic and continental influences. This climatic diversity allows for the development of a wide range of agricultural crops and supports tourism throughout the year.',
          'historyLesson':
              'The history of France is one of the most fascinating in Europe, beginning in antiquity and continuing to the present day. In those distant times, the French territory was populated by Celtic and Gallic tribes and was later colonized by the Romans, forming the Roman province of Gallia. The Middle Ages brought feudalism and the fragmentation of the country into kingdoms and principalities, such as the Kingdom of France and the Duchy of Normandy. In the 15th century, France began to consolidate under the leadership of Louis XI, marking the beginning of the formation of modern France. The French Revolution of 1789 ended the monarchy and established a republic, followed by the Napoleonic era, which brought territorial expansion and influence under the leadership of Napoleon Bonaparte. The 19th century was full of major changes and conflicts, including the Franco-Prussian War and the establishment of the Third Republic in 1870. The 20th century was marked by the two World Wars and the Nazi occupation between 1940 and 1944. After World War II, France was one of the founding powers of the European Union and underwent the process of decolonization, losing most of its colonies in Africa and Asia. Today, France remains one of the most important and influential countries in the world, with a diversified economy, a stable political system, and a rich cultural and artistic heritage. French gastronomy is renowned worldwide, and its impressive art and architecture attract millions of tourists each year. Its contributions in fields such as science, technology, and literature continue to influence the modern world, consolidating France\'s status as one of the great powers of the 21st century.',
          'geography_completed': 0,
          'history_completed': 0,
          'doesExist': 1
        });

        await db.insert('country', {
          'name': 'United States',
          'geographyLesson':
              'The United States of America (USA), one of the largest and most influential countries in the world, is located in North America, bordering Canada to the north and Mexico to the south. Its capital is Washington, D.C., and New York City is a major cultural, economic, and financial center. The US territory is extremely diverse, including mountains, plains, deserts, and coastal regions. In the west, the Rocky Mountains are found, and to the east stretches the Atlantic Seaboard. In the south is the Sonoran Desert, and in the northwest is the Columbia Plateau. These geographic features influence the country’s climate and economy. Major rivers, such as the Mississippi and Missouri, traverse the USA, providing natural resources and being vital for internal transportation. The Mississippi River is one of the longest rivers in the world and has been crucial in the historical and economic development of the country. An iconic geographical feature of the USA is Yellowstone National Park, located in Wyoming, which hosts geysers, hot springs, and a variety of wildlife. Among the emblematic animal species in Yellowstone National Park is the grizzly bear, which is considered a symbol of wilderness and the power of nature. The grizzly bear can be found in various parts of the park, searching for food in the forested areas or along the watercourses. The USA also has an extensive coastline, with major maritime cities such as Los Angeles, San Francisco, and Miami. These port cities have played a crucial role in the development of maritime trade and the American economy. In addition to Washington, D.C. and New York City, other important cities in the USA include Los Angeles, Chicago, and Houston, each with distinct geographic and cultural features. The USA is a popular tourist destination due to its cultural diversity, national parks, and vibrant cities. The climate of the USA varies considerably from north to south and east to west, with temperate, desert, and subtropical regions. In the northeast, winters are cold and snowy, while in the southwest, summers are hot and dry. The USA also includes several territories outside the main continent, such as Hawaii and Puerto Rico, which offer spectacular landscapes and diverse cultures. The USA is known for its culinary diversity, with influences from around the world, including traditional dishes like burgers, pizza, and steak, as well as regional specialties such as gumbo from Louisiana and sushi from California',
          'historyLesson':
              'Before European colonization, the current territory of the United States was inhabited by diverse Native American populations, who had varied cultures and societies. With the arrival of European explorers in the 16th century, the process of colonizing North America began. In the 18th century, the British colonies in North America fought for independence against the British crown. The Declaration of Independence was adopted in 1776, marking the beginning of the United States of America as an independent nation. In the 19th century, the United States experienced massive territorial expansion westward, in a process known as "Manifest Destiny". However, this expansion fueled tensions between slave and non-slave states, culminating in the American Civil War (1861-1865), which was fought between states that supported slavery and those that opposed it. After the Civil War, the United States experienced a period of rapid industrialization and economic development. In the 20th century, it became one of the most powerful and influential nations in the world, playing a major role in both world wars and becoming a pillar of the global economy. Prohibition was the period during which the production, distribution, and consumption of alcohol were banned by law across the country, from 1920 to 1933. This policy was implemented through the adoption of the 18th Amendment to the US Constitution in 1919 and the Volstead Act. Today, the United States remains a dominant economic and military power, but it faces a series of internal and international challenges, including economic inequality, climate change, and geopolitical tensions. Nevertheless, its cultural diversity, innovation, and commitment to democratic values continue to define the nation and inspire the world.',
          'geography_completed': 0,
          'history_completed': 0,
          'doesExist': 1
        });

        await db.insert('country', {
          'name': 'Italy',
          'geographyLesson':
              'Italy is located in southern Europe, bordered by France to the northwest, Switzerland and Austria to the north and northeast, Slovenia to the northeast, and Croatia to the east. Its capital, Rome, is the largest city and the cultural, historical, and political center of the country. With a population of approximately 60 million inhabitants, Italy is one of the most populous countries in Europe. Its territory is characterized by remarkable geographical diversity, including mountains, plains, and coastal shores. The Alps form the northern border of the country, offering spectacular alpine landscapes and opportunities for winter sports. In central Italy, there are a series of mountain ranges such as the Apennines, which stretch almost the entire length of the Italian peninsula and influence the climate and geography of the respective regions. Italy also has an extensive network of rivers, such as the Po, Tiber, and Arno, which contribute to the fertility of the plains and the development of agriculture. A significant geographical aspect of Italy is the Italian Peninsula, which extends into the Mediterranean Sea and is surrounded by several islands, such as Sicily and Sardinia. This strategic position has favored maritime trade and brought diverse cultural influences throughout history. Mount Vesuvius is an active volcano located near the city of Naples in the Campania region of southern Italy. It is especially known for its devastating eruption in 79 AD, which led to the destruction of the cities of Pompeii and Herculaneum. This volcano is considered one of the most dangerous in the world due to the dense population and the potential impact on surrounding cities in the event of a major eruption. In addition to Rome, other important cities in Italy include Milan, Naples, Florence, and Venice, each with distinct geographical and cultural characteristics. Italy is a popular tourist destination due to its historic cities, rich art and architecture, and varied natural landscapes. The highest peak in Italy is Mont Blanc in the Graian Alps, with an altitude of 4,808 meters. This glacial peak offers opportunities for mountaineering and ecotourism in a spectacular environment. Italy is known worldwide for its rich and varied wine production. The Tuscany region, in particular, is renowned for Chianti, a dry red wine. Italy\'s climate varies from Mediterranean in the south to temperate in the north, with oceanic and continental influences felt in different regions of the country. This climatic diversity provides favorable conditions for a wide range of outdoor activities and agriculture. Italy also includes several important islands, such as Sicily and Sardinia, which have spectacular landscapes and a rich history.',
          'historyLesson':
              'In southern Europe lies a country with a rich and varied history - Italy. In ancient times, the Italian peninsula was inhabited by diverse peoples such as the Etruscans, Greeks, and Samnites, but it became best known through Roman conquest, which led to the formation of the Roman Republic and later the Roman Empire. In the Middle Ages, Italy was divided into numerous independent states and republics, such as the Venetian Republic, the Duchy of Milan, the Florentine Republic, and the Papal States. This period was marked by competition between these entities for power and control. During the Renaissance, Italy was the epicenter of a powerful cultural and artistic movement, marking a period of flourishing in fields such as art, architecture, and literature. Figures such as Leonardo da Vinci, Michelangelo, and Dante Alighieri contributed to Italy’s reputation as the cultural center of Europe. In the 18th and 19th centuries, Italy was the scene of significant political conflicts and transformations, including the Napoleonic wars and the process of Italian unification under the leadership of Giuseppe Garibaldi and Camillo Benso, Count of Cavour. This process led to the formation of the modern Italian state, which was completed in 1871 when Rome became the capital of Italy. In the 20th century, Italy was involved in both world wars. In World War I, Italy joined the Allied Powers in 1915, hoping to gain promising territories from the Central Powers. The battles were mainly concentrated on the Italian front in the Eastern Alps and involved tough confrontations with Austro-Hungarian troops. After the war, Italy was disappointed by the results of the Paris Peace Conference, which did not meet its territorial expectations. This period generated dissatisfaction and political instability in Italy, paving the way for the rise of fascism. In 1957, Italy was one of the founding countries of the European Economic Community (EEC), the precursor to the European Union, by signing the Treaty of Rome. Thus, Italy was involved from the beginning in the process of European integration. Italy is known for its picturesque landscapes, rich historical and cultural heritage, renowned cuisine, and contributions to fields such as fashion and design.',
          'geography_completed': 0,
          'history_completed': 0,
          'doesExist': 1
        });

        await db.insert('country', {
          'name': 'China',
          'geographyLesson':
              'China, one of the largest countries in the world by area and population, is located in East Asia, bordered by several major countries such as Russia and Mongolia to the north, India, Nepal, and Bhutan to the south, and North Korea, Vietnam, and Laos to the southeast. Its capital, Beijing, is a major cultural, economic, and political center, while Shanghai is one of the largest cities in the world, serving as an important financial and commercial hub. China\'s territory is characterized by impressive geographical diversity, including mountains, plains, and coastal regions. To the west, the Himalayas form a natural border, while the Tian Mountains, which include the highest peak in China, Mount Everest, are located to the southwest. In the north are the Altai Mountains, and to the east stretch the Qinling Mountains. These mountain ranges significantly influence the country\'s climate and geography. Major rivers, such as the Yangtze and the Yellow River, traverse China, providing water for irrigation and river transport. The Yangtze is the third longest river in the world and holds significant cultural and economic importance, with major cities such as Chongqing and Wuhan located along its banks. A distinctive geographical feature of China is the Great Wall, a massive defensive structure built over the centuries to protect the Chinese empire against invasions from the north. This impressive historical monument is a top tourist attraction and symbolizes China\'s rich history and culture. China also has an extensive coastline, with important port cities such as Hong Kong, Guangzhou, and Shenzhen. These regions have played a crucial role in the development of maritime trade and the modern Chinese economy. In addition to Beijing and Shanghai, other important cities in China include Guangzhou, Chengdu, and Xi\'an, each with distinct geographical and cultural characteristics. China is a popular tourist destination due to its rich cultural heritage and varied natural landscapes, such as Mount Huangshan and Yangshuo Karst. China\'s climate varies significantly from north to south and east to west, with temperate, subtropical, and tropical regions. In the north, winters are cold and dry, while in the south, summers are warm and humid. China also includes several autonomous regions, such as Tibet and Xinjiang, which have spectacular landscapes and remarkable cultural diversity. China is also renowned for its rich culinary history and gastronomic diversity, ranging from spicy Sichuan cuisine to Shanghai delicacies and Cantonese seafood.',
          'historyLesson':
              'In East Asia, there is a country with an ancient and fascinating history - China. Over the millennia, China has been inhabited by various civilizations and cultures, and its historical evolution has been marked by significant moments and profound transformations. In ancient times, China was inhabited by numerous tribes and kingdoms, but its unification under a central authority began under the Qin Dynasty, which ruled in the 3rd century BC. The Qin Dynasty was followed by the Han, Tang, and Song Dynasties, periods of prosperity and innovation in fields such as science, technology, and art. In the Middle Ages, China experienced a series of dynasties and empires, such as the Yuan (founded by the Mongols), Ming, and Qing. During the Tang and Song dynasties, China was an important commercial and cultural center, known for its technological inventions such as movable type printing and the compass. In the 19th century, China was affected by imperialist aggression and the influence of foreign powers, leading to the Opium Wars and the Treaty of Nanking, which opened China’s doors to foreign trade and imposed territorial concessions. This period of weakness in the Chinese state culminated in the Boxer Rebellion and the fall of the Qing Dynasty. In the 20th century, China underwent significant political and social changes. The 1911 Revolution led to the fall of the imperial system and the founding of the Republic of China under the leadership of Sun Yat-sen. In 1949, the Chinese Communist Party, led by Mao Zedong, proclaimed the establishment of the People’s Republic of China, ending a century of foreign domination and internal instability. Over the decades, China has undergone massive economic and social reforms under the leadership of Deng Xiaoping and his successors, transforming from a planned economy to a market-oriented one and becoming one of the world’s largest economic powers. Today, China is known for its advanced technology, rapidly growing economy, and global influence in areas such as international trade and world politics. In addition to these aspects, China has a rich cultural history, with significant contributions in fields such as philosophy, literature, art, and architecture.',
          'geography_completed': 0,
          'history_completed': 0,
          'doesExist': 1
        });

        /*  await db.insert('country', {
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
          'question_text': 'What is the population of Spain? (milions)',
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
          'question_text':
              'When was the decree for the expulsion of Jews and Moors signed?',
          'answer': '',
          'correct_answer': 1492,
          'type': 2
        });

        await db.insert('question', {
          'country': 'Spain',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'In the 19th century, Spain managed to keep all its colonies in Latin America.',
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
          'question_text':
              'Ferdinand II and Isabella I were responsible for the completion of the Reconquista.',
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
          'question_text': 'What is the population of France? (milions)',
          'answer': '',
          'correct_answer': 67,
          'type': 2
        });
        await db.insert('question', {
          'country': 'France',
          'subject': 1,
          'difficulty': 1,
          'question_text':
              'The Pyrenees Mountains form a natural border between France and Italy.',
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
              'Which was one of the Roman provinces where France was incorporated in antiquity?',
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
              'What was the period of Napoleon Bonaparte\'s rule in France?',
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
          'question_text': 'What is the population of Italy? (milions)',
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
          'question_text':
              'What is the altitude of Mont Blanc peak in the Graian Alps?',
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
          'question_text':
              'In which century did the two world wars take place?',
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
          'question_text':
              'The Napoleonic Wars took place in the 19th century.',
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
          'question_text':
              'The Yangtze is the third longest river in the world.',
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
          'question_text':
              'In what year was the People Republic of China founded?',
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
          'question_text':
              'The panda bear can be found in Yellowstone National Park.',
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
          'question_text': 'Name two states that have desert lands in the USA.',
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
          'question_text':
              'In what year was the Declaration of Independence adopted',
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
          'question_text':
              'in the 19th century the USA became one of the most powerful nations in the world',
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
          'question_text': 'What is the population of Romania? (milions)',
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
          'question_text':
              'In ancient times, which people lived on the territory of Romania?',
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
          'question_text':
              'Which principality belonged to the Romanian territory?',
          'answer': answer196,
          'correct_answer': 3,
          'type': 2
        });

        await db.insert('question', {
          'country': 'Romania',
          'subject': 2,
          'difficulty': 1,
          'question_text':
              'In what year was the Union of the Romanian Principalities?',
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
          'question_text':
              'In what year did Romania declare independence from the Ottoman Empire?',
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
          'question_text':
              'In which war did the Romanian Principalities participate to consolidate their status as a sovereign nation?',
          'answer': answer204,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Romania',
          'subject': 2,
          'difficulty': 2,
          'question_text':
              'What is the name of the process through which the Romans influenced the culture of the Dacians?',
          'answer': answer205,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Romania',
          'subject': 2,
          'difficulty': 2,
          'question_text': 'Vlad Tepes ruled in Wallachia',
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
            faces TEXT,
            double_iq
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
            'faces': facesList,
            'double_iq': 0,
          });

          await db.execute('''
          CREATE TABLE faces (
            faceID INTEGER PRIMARY KEY AUTOINCREMENT,
            face INTEGER,
            bought INTEGER,
            price INTEGER,
            color INTEGER
          )''');

          await db.insert(
              'faces', {'face': 1, 'bought': 1, 'price': 50, 'color': 0});

          await db.insert(
              'faces', {'face': 2, 'bought': 0, 'price': 50, 'color': 1});

          await db.insert(
              'faces', {'face': 3, 'bought': 0, 'price': 50, 'color': 2});

          await db.insert(
              'faces', {'face': 4, 'bought': 0, 'price': 50, 'color': 3});

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
                'Romania is located in the southeastern part of Europe, bordered by Bulgaria, Serbia, Hungary, Ukraine, and the Republic of Moldova. Its capital, Bucharest, is the largest city and the main cultural, economic, and political center of the country. With a population of approximately 19 million people, Romania is one of the most populous countries in Eastern Europe. Its territory is divided by the Carpathian Mountains, which form a natural barrier that separates the country into three distinct geographical regions: Transylvania, Moldova, and Maramureș. These mountains are often described as the heart of Romania, offering not only picturesque landscapes but also an important source of natural resources and biodiversity. The Danube, a vital navigable river, flows through the south of the country, marking the natural border with Bulgaria and providing access to the Black Sea through the ports of Constanța and Mangalia. This geographic feature has facilitated trade and cultural interactions with other regions of Europe and the world. Besides Bucharest, other important cities in Romania include Cluj-Napoca, Timișoara, Iași, and Constanța, each with its own cultural and economic wealth. Romania is a developing country, a member of the European Union and NATO, with a mixed economy in which industry, agriculture, and services play significant roles in its economic growth. The highest point in Romania is Moldoveanu Peak in the Făgăraș Mountains, with an impressive altitude of 2,544 meters. This height offers spectacular panoramas and opportunities for mountaineering and mountain tourism. The historical regions of Romania, such as Transylvania, known for its mountainous landscapes and historical towns; Moldova, renowned for its historical sites and rich cultural heritage; and Maramureș, with its rural landscapes and authentic traditions, add uniqueness and diversity to this country. Romania’s climate is temperate-continental, with hot summers and cold winters, influenced by the Carpathian Mountains and the Black Sea. This climatic variety offers favorable conditions for a diverse range of activities, from winter sports in the Carpathians to relaxation by the Black Sea during summer.',
            'historyLesson':
                'In a corner of Europe lies a country rich in history and tradition called Romania. In ancient times, the territory of Romania was inhabited by the Dacians, a proud people with a rich culture. In 106 AD, the Roman Empire conquered this territory, beginning the process of Romanization. This interaction between the Dacians and the Romans left a strong imprint on Romanian identity, reflected in the language, customs, and traditions of the people. During the medieval period, the Romanian territory was divided into autonomous principalities, Moldavia and Wallachia. Under the leadership of their rulers, such as Stephen the Great and Vlad the Impaler, these principalities fought for independence and resisted foreign pressures, laying the foundations for the Romanian states. In the 19th century, the national movement grew significantly, and the Union of the Romanian Principalities took place in 1859 under the reign of Alexandru Ioan Cuza. This important step paved the way for the formation of modern Romania. In 1877, Romania proclaimed its independence from the Ottoman Empire and participated in the War of Independence, solidifying its status as a sovereign nation. Between the two world wars, Romania experienced periods of political instability and economic progress. In 1918, the Great Union between Transylvania, Moldavia, and Wallachia occurred. However, during World War II, the country was occupied by Axis forces, and after the war, it became a satellite state of the Soviet Union. In 1947, Romania became a communist republic under the leadership of Gheorghe Gheorghiu-Dej and later Nicolae Ceaușescu. The communist regime was characterized by political oppression and economic stagnation. However, in December 1989, the Romanian Revolution led to the fall of the communist regime and the establishment of democracy in the country. After the Revolution, Romania went through a difficult transition period towards a market economy and democracy. In 2007, Romania became a member of the European Union, solidifying its commitment to democratic values and European integration.',
            'geography_completed': 0,
            'history_completed': 0,
            'doesExist': 1
          });

          await db.insert('country', {
            'name': 'Spain',
            'geographyLesson':
                'Spain is located in the southwestern part of Europe, bordered by France to the north and northeast, Portugal to the west, and Andorra and Gibraltar to the south. Its capital, Madrid, is the largest city and the cultural, economic, and political center of the country. With a population of approximately 47 million people, Spain is one of the most populous countries in Europe. Its territory is characterized by a great geographical variety, including mountainous areas, plains, and coastal shores. The Pyrenees form the northern border of the country, offering spectacular mountain landscapes and opportunities for winter sports. In central and southern Spain, there are several mountain ranges such as the Cantabrian Mountains, the Central Mountains, and the Betic Mountains, which influence the climate and geography of the respective regions. Additionally, Spain has a vast network of rivers, such as the Ebro, Tagus, and Guadalquivir, which contribute to the fertility of the plains and the development of agriculture. A significant geographical feature of Spain is the Iberian Peninsula, which also includes Portugal, and is surrounded by the Atlantic Ocean and the Mediterranean Sea. This strategic position has facilitated maritime trade and brought diverse cultural influences throughout history. In addition to Madrid, other important cities in Spain include Barcelona, Valencia, Seville, and Bilbao, each with its own distinct geographical and cultural characteristics. Spain is a popular tourist destination due to its Mediterranean beaches, historical cities, and varied natural landscapes. The highest peak in Spain is Mount Teide in the Canary Islands, with an altitude of 3,718 meters. This volcanic peak offers opportunities for exploration and ecological tourism in a unique environment. The climate of Spain ranges from Mediterranean in the south to temperate in the north, with oceanic and continental influences felt in different regions of the country. This climatic diversity provides favorable conditions for a wide range of outdoor activities and agriculture. Spain includes several important archipelagos, such as the Balearic Islands in the Mediterranean Sea and the Canary Islands in the Atlantic Ocean. The Balearic Islands, including Mallorca, Menorca, Ibiza, and Formentera, are known for their beautiful beaches, crystal-clear waters, and vibrant nightlife. These islands are a popular destination for tourists from around the world, offering a variety of recreational and cultural activities. The Canary Islands, located off the African coast, are formed from volcanic rock and offer a spectacular landscape and ecological diversity. Tenerife is known for its volcanic peak Teide, while Gran Canaria is famous for its sand dunes and rich marine life.',
            'historyLesson':
                'In southwestern Europe lies a country with a rich historical heritage called Spain. In ancient times, the Spanish territory was inhabited by peoples such as the Iberians and Celtiberians, who were later colonized by the Romans, contributing to the formation of the Roman province of Hispania. During the Middle Ages, Spain was divided into numerous kingdoms and taifas, each with its own culture and identity. Among the most important kingdoms were the Kingdom of Castile, the Kingdom of Aragon, and the Kingdom of Navarre. During this period, there were also times of coexistence and conflict among Christians, Muslims, and Jews, highlighting the religious and cultural diversity of the Iberian Peninsula. In the 15th century, through the marriage of King Ferdinand II of Aragon and Queen Isabella I of Castile, a union between the two kingdoms was created, marking the beginning of the formation of modern Spain. Under their rule, the Reconquista was completed, the reconquest of Muslim territories in Spain, and in 1492, the decree for the expulsion of Jews and Moors was signed, consolidating Catholic control over the kingdom. The period of conquest and colonization of the Americas by the Spaniards brought great wealth and power to Spain in the 16th and 17th centuries. This era was marked by great explorers and conquerors such as Christopher Columbus, Hernán Cortés, and Francisco Pizarro, who expanded Spanish influence worldwide. In the 19th century, Spain was involved in numerous internal and external conflicts, including the Peninsular War against Napoleon armies and the loss of most of its American colonies following the Latin American wars of independence. In the 20th century, Spain witnessed periods of political instability, including the dictatorship of Francisco Franco from 1939 to 1975. After his death, Spain underwent a transition to democracy, culminating in the adoption of a democratic constitution in 1978. Today, Spain is a parliamentary monarchy and a member of the European Union, with a diversified economy and an impressive cultural and historical heritage.',
            'geography_completed': 0,
            'history_completed': 0,
            'doesExist': 1
          });

          await db.insert('country', {
            'name': 'France',
            'geographyLesson':
                'France\'s geography offers remarkable diversity, encompassing mountainous regions, fertile plains, and spectacular coastlines. Located in western Europe, France borders Spain to the southwest, Belgium and Luxembourg to the northeast, Germany and Switzerland to the east, Italy to the southeast, and the Mediterranean Sea to the south. The capital of France, Paris, is one of the worlds largest cultural and economic centers, known for its remarkable tourist attractions such as the Eiffel Tower, Notre-Dame Cathedral, and the Louvre Museum. With a population of approximately 67 million people, France is one of the most populous countries in Europe. The terrain of France is varied and spectacular. The Alps extend in the southeastern part of the country, marking the border with Italy, and include France\'s highest peak, Mont Blanc, with an altitude of 4,810 meters. In the southwestern part, the Pyrenees form a natural border with Spain, offering impressive mountainous landscapes and facilitating sports activities such as skiing and mountaineering. In northern France, the Northern Plains and the Loire Plains are fertile regions that support rich agriculture and diverse industries. France is also traversed by numerous important rivers, such as the Seine, Loire, and Rhone, which have had a significant impact on its economic and cultural development. France is recognized for its picturesque coastline, which stretches along the Mediterranean Sea and the Atlantic Ocean. The French Riviera, located in the southeast of the country, is known for its luxury resorts and beautiful beaches, while Brittany, in the northwest, is famous for its wild landscapes and impressive cliffs. Besides Paris, other important cities in France include Lyon, Marseille, Bordeaux, and Strasbourg, each with its own cultural identity and distinct attractions. France is also renowned for its fine wines, refined gastronomy, and rich culture. The climate of France varies from Mediterranean in the south to temperate in the north, with oceanic and continental influences. This climatic diversity allows for the development of a wide range of agricultural crops and supports tourism throughout the year.',
            'historyLesson':
                'The history of France is one of the most fascinating in Europe, beginning in antiquity and continuing to the present day. In those distant times, the French territory was populated by Celtic and Gallic tribes and was later colonized by the Romans, forming the Roman province of Gallia. The Middle Ages brought feudalism and the fragmentation of the country into kingdoms and principalities, such as the Kingdom of France and the Duchy of Normandy. In the 15th century, France began to consolidate under the leadership of Louis XI, marking the beginning of the formation of modern France. The French Revolution of 1789 ended the monarchy and established a republic, followed by the Napoleonic era, which brought territorial expansion and influence under the leadership of Napoleon Bonaparte. The 19th century was full of major changes and conflicts, including the Franco-Prussian War and the establishment of the Third Republic in 1870. The 20th century was marked by the two World Wars and the Nazi occupation between 1940 and 1944. After World War II, France was one of the founding powers of the European Union and underwent the process of decolonization, losing most of its colonies in Africa and Asia. Today, France remains one of the most important and influential countries in the world, with a diversified economy, a stable political system, and a rich cultural and artistic heritage. French gastronomy is renowned worldwide, and its impressive art and architecture attract millions of tourists each year. Its contributions in fields such as science, technology, and literature continue to influence the modern world, consolidating France\'s status as one of the great powers of the 21st century.',
            'geography_completed': 0,
            'history_completed': 0,
            'doesExist': 1
          });

          await db.insert('country', {
            'name': 'United States',
            'geographyLesson':
                'The United States of America (USA), one of the largest and most influential countries in the world, is located in North America, bordering Canada to the north and Mexico to the south. Its capital is Washington, D.C., and New York City is a major cultural, economic, and financial center. The US territory is extremely diverse, including mountains, plains, deserts, and coastal regions. In the west, the Rocky Mountains are found, and to the east stretches the Atlantic Seaboard. In the south is the Sonoran Desert, and in the northwest is the Columbia Plateau. These geographic features influence the country’s climate and economy. Major rivers, such as the Mississippi and Missouri, traverse the USA, providing natural resources and being vital for internal transportation. The Mississippi River is one of the longest rivers in the world and has been crucial in the historical and economic development of the country. An iconic geographical feature of the USA is Yellowstone National Park, located in Wyoming, which hosts geysers, hot springs, and a variety of wildlife. Among the emblematic animal species in Yellowstone National Park is the grizzly bear, which is considered a symbol of wilderness and the power of nature. The grizzly bear can be found in various parts of the park, searching for food in the forested areas or along the watercourses. The USA also has an extensive coastline, with major maritime cities such as Los Angeles, San Francisco, and Miami. These port cities have played a crucial role in the development of maritime trade and the American economy. In addition to Washington, D.C. and New York City, other important cities in the USA include Los Angeles, Chicago, and Houston, each with distinct geographic and cultural features. The USA is a popular tourist destination due to its cultural diversity, national parks, and vibrant cities. The climate of the USA varies considerably from north to south and east to west, with temperate, desert, and subtropical regions. In the northeast, winters are cold and snowy, while in the southwest, summers are hot and dry. The USA also includes several territories outside the main continent, such as Hawaii and Puerto Rico, which offer spectacular landscapes and diverse cultures. The USA is known for its culinary diversity, with influences from around the world, including traditional dishes like burgers, pizza, and steak, as well as regional specialties such as gumbo from Louisiana and sushi from California',
            'historyLesson':
                'Before European colonization, the current territory of the United States was inhabited by diverse Native American populations, who had varied cultures and societies. With the arrival of European explorers in the 16th century, the process of colonizing North America began. In the 18th century, the British colonies in North America fought for independence against the British crown. The Declaration of Independence was adopted in 1776, marking the beginning of the United States of America as an independent nation. In the 19th century, the United States experienced massive territorial expansion westward, in a process known as "Manifest Destiny". However, this expansion fueled tensions between slave and non-slave states, culminating in the American Civil War (1861-1865), which was fought between states that supported slavery and those that opposed it. After the Civil War, the United States experienced a period of rapid industrialization and economic development. In the 20th century, it became one of the most powerful and influential nations in the world, playing a major role in both world wars and becoming a pillar of the global economy. Prohibition was the period during which the production, distribution, and consumption of alcohol were banned by law across the country, from 1920 to 1933. This policy was implemented through the adoption of the 18th Amendment to the US Constitution in 1919 and the Volstead Act. Today, the United States remains a dominant economic and military power, but it faces a series of internal and international challenges, including economic inequality, climate change, and geopolitical tensions. Nevertheless, its cultural diversity, innovation, and commitment to democratic values continue to define the nation and inspire the world.',
            'geography_completed': 0,
            'history_completed': 0,
            'doesExist': 1
          });

          await db.insert('country', {
            'name': 'Italy',
            'geographyLesson':
                'Italy is located in southern Europe, bordered by France to the northwest, Switzerland and Austria to the north and northeast, Slovenia to the northeast, and Croatia to the east. Its capital, Rome, is the largest city and the cultural, historical, and political center of the country. With a population of approximately 60 million inhabitants, Italy is one of the most populous countries in Europe. Its territory is characterized by remarkable geographical diversity, including mountains, plains, and coastal shores. The Alps form the northern border of the country, offering spectacular alpine landscapes and opportunities for winter sports. In central Italy, there are a series of mountain ranges such as the Apennines, which stretch almost the entire length of the Italian peninsula and influence the climate and geography of the respective regions. Italy also has an extensive network of rivers, such as the Po, Tiber, and Arno, which contribute to the fertility of the plains and the development of agriculture. A significant geographical aspect of Italy is the Italian Peninsula, which extends into the Mediterranean Sea and is surrounded by several islands, such as Sicily and Sardinia. This strategic position has favored maritime trade and brought diverse cultural influences throughout history. Mount Vesuvius is an active volcano located near the city of Naples in the Campania region of southern Italy. It is especially known for its devastating eruption in 79 AD, which led to the destruction of the cities of Pompeii and Herculaneum. This volcano is considered one of the most dangerous in the world due to the dense population and the potential impact on surrounding cities in the event of a major eruption. In addition to Rome, other important cities in Italy include Milan, Naples, Florence, and Venice, each with distinct geographical and cultural characteristics. Italy is a popular tourist destination due to its historic cities, rich art and architecture, and varied natural landscapes. The highest peak in Italy is Mont Blanc in the Graian Alps, with an altitude of 4,808 meters. This glacial peak offers opportunities for mountaineering and ecotourism in a spectacular environment. Italy is known worldwide for its rich and varied wine production. The Tuscany region, in particular, is renowned for Chianti, a dry red wine. Italy\'s climate varies from Mediterranean in the south to temperate in the north, with oceanic and continental influences felt in different regions of the country. This climatic diversity provides favorable conditions for a wide range of outdoor activities and agriculture. Italy also includes several important islands, such as Sicily and Sardinia, which have spectacular landscapes and a rich history.',
            'historyLesson':
                'In southern Europe lies a country with a rich and varied history - Italy. In ancient times, the Italian peninsula was inhabited by diverse peoples such as the Etruscans, Greeks, and Samnites, but it became best known through Roman conquest, which led to the formation of the Roman Republic and later the Roman Empire. In the Middle Ages, Italy was divided into numerous independent states and republics, such as the Venetian Republic, the Duchy of Milan, the Florentine Republic, and the Papal States. This period was marked by competition between these entities for power and control. During the Renaissance, Italy was the epicenter of a powerful cultural and artistic movement, marking a period of flourishing in fields such as art, architecture, and literature. Figures such as Leonardo da Vinci, Michelangelo, and Dante Alighieri contributed to Italy’s reputation as the cultural center of Europe. In the 18th and 19th centuries, Italy was the scene of significant political conflicts and transformations, including the Napoleonic wars and the process of Italian unification under the leadership of Giuseppe Garibaldi and Camillo Benso, Count of Cavour. This process led to the formation of the modern Italian state, which was completed in 1871 when Rome became the capital of Italy. In the 20th century, Italy was involved in both world wars. In World War I, Italy joined the Allied Powers in 1915, hoping to gain promising territories from the Central Powers. The battles were mainly concentrated on the Italian front in the Eastern Alps and involved tough confrontations with Austro-Hungarian troops. After the war, Italy was disappointed by the results of the Paris Peace Conference, which did not meet its territorial expectations. This period generated dissatisfaction and political instability in Italy, paving the way for the rise of fascism. In 1957, Italy was one of the founding countries of the European Economic Community (EEC), the precursor to the European Union, by signing the Treaty of Rome. Thus, Italy was involved from the beginning in the process of European integration. Italy is known for its picturesque landscapes, rich historical and cultural heritage, renowned cuisine, and contributions to fields such as fashion and design.',
            'geography_completed': 0,
            'history_completed': 0,
            'doesExist': 1
          });

          await db.insert('country', {
            'name': 'China',
            'geographyLesson':
                'China, one of the largest countries in the world by area and population, is located in East Asia, bordered by several major countries such as Russia and Mongolia to the north, India, Nepal, and Bhutan to the south, and North Korea, Vietnam, and Laos to the southeast. Its capital, Beijing, is a major cultural, economic, and political center, while Shanghai is one of the largest cities in the world, serving as an important financial and commercial hub. China\'s territory is characterized by impressive geographical diversity, including mountains, plains, and coastal regions. To the west, the Himalayas form a natural border, while the Tian Mountains, which include the highest peak in China, Mount Everest, are located to the southwest. In the north are the Altai Mountains, and to the east stretch the Qinling Mountains. These mountain ranges significantly influence the country\'s climate and geography. Major rivers, such as the Yangtze and the Yellow River, traverse China, providing water for irrigation and river transport. The Yangtze is the third longest river in the world and holds significant cultural and economic importance, with major cities such as Chongqing and Wuhan located along its banks. A distinctive geographical feature of China is the Great Wall, a massive defensive structure built over the centuries to protect the Chinese empire against invasions from the north. This impressive historical monument is a top tourist attraction and symbolizes China\'s rich history and culture. China also has an extensive coastline, with important port cities such as Hong Kong, Guangzhou, and Shenzhen. These regions have played a crucial role in the development of maritime trade and the modern Chinese economy. In addition to Beijing and Shanghai, other important cities in China include Guangzhou, Chengdu, and Xi\'an, each with distinct geographical and cultural characteristics. China is a popular tourist destination due to its rich cultural heritage and varied natural landscapes, such as Mount Huangshan and Yangshuo Karst. China\'s climate varies significantly from north to south and east to west, with temperate, subtropical, and tropical regions. In the north, winters are cold and dry, while in the south, summers are warm and humid. China also includes several autonomous regions, such as Tibet and Xinjiang, which have spectacular landscapes and remarkable cultural diversity. China is also renowned for its rich culinary history and gastronomic diversity, ranging from spicy Sichuan cuisine to Shanghai delicacies and Cantonese seafood.',
            'historyLesson':
                'In East Asia, there is a country with an ancient and fascinating history - China. Over the millennia, China has been inhabited by various civilizations and cultures, and its historical evolution has been marked by significant moments and profound transformations. In ancient times, China was inhabited by numerous tribes and kingdoms, but its unification under a central authority began under the Qin Dynasty, which ruled in the 3rd century BC. The Qin Dynasty was followed by the Han, Tang, and Song Dynasties, periods of prosperity and innovation in fields such as science, technology, and art. In the Middle Ages, China experienced a series of dynasties and empires, such as the Yuan (founded by the Mongols), Ming, and Qing. During the Tang and Song dynasties, China was an important commercial and cultural center, known for its technological inventions such as movable type printing and the compass. In the 19th century, China was affected by imperialist aggression and the influence of foreign powers, leading to the Opium Wars and the Treaty of Nanking, which opened China’s doors to foreign trade and imposed territorial concessions. This period of weakness in the Chinese state culminated in the Boxer Rebellion and the fall of the Qing Dynasty. In the 20th century, China underwent significant political and social changes. The 1911 Revolution led to the fall of the imperial system and the founding of the Republic of China under the leadership of Sun Yat-sen. In 1949, the Chinese Communist Party, led by Mao Zedong, proclaimed the establishment of the People’s Republic of China, ending a century of foreign domination and internal instability. Over the decades, China has undergone massive economic and social reforms under the leadership of Deng Xiaoping and his successors, transforming from a planned economy to a market-oriented one and becoming one of the world’s largest economic powers. Today, China is known for its advanced technology, rapidly growing economy, and global influence in areas such as international trade and world politics. In addition to these aspects, China has a rich cultural history, with significant contributions in fields such as philosophy, literature, art, and architecture.',
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
            'question_text': 'What is the population of Spain? (milions)',
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
            'question_text':
                'When was the decree for the expulsion of Jews and Moors signed?',
            'answer': '',
            'correct_answer': 1492,
            'type': 2
          });

          await db.insert('question', {
            'country': 'Spain',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'In the 19th century, Spain managed to keep all its colonies in Latin America.',
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
            'question_text':
                'Ferdinand II and Isabella I were responsible for the completion of the Reconquista.',
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
            'question_text': 'What is the population of France? (milions)',
            'answer': '',
            'correct_answer': 67,
            'type': 2
          });
          await db.insert('question', {
            'country': 'France',
            'subject': 1,
            'difficulty': 1,
            'question_text':
                'The Pyrenees Mountains form a natural border between France and Italy.',
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
                'Which was one of the Roman provinces where France was incorporated in antiquity?',
            'answer': answer13,
            'correct_answer': 3,
            'type': 1
          });
          await db.insert('question', {
            'country': 'France',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'In what year did the French Revolution take place?',
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
            'question_text':
                'France was one of the founding members of the EU.',
            'answer': '',
            'correct_answer': 1,
            'type': 4
          });

          await db.insert('question', {
            'country': 'France',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'What was the period of Napoleon Bonaparte\'s rule in France?',
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
            'question_text': 'What is the population of Italy? (milions)',
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
            'question_text':
                'What is the altitude of Mont Blanc peak in the Graian Alps?',
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
            'question_text':
                'In what year was the modern Italian state formed?',
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
            'question_text':
                'In which century did the two world wars take place?',
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
            'question_text':
                'The Napoleonic Wars took place in the 19th century.',
            'answer': '',
            'correct_answer': 1,
            'type': 4
          });
          await db.insert('question', {
            'country': 'China',
            'subject': 1,
            'difficulty': 1,
            'question_text':
                'The Yangtze is the third longest river in the world.',
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
            'question_text':
                'In what year was the People Republic of China founded?',
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
            'question_text':
                'The panda bear can be found in Yellowstone National Park.',
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
            'question_text':
                'In what year was the Declaration of Independence adopted',
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
            'question_text':
                'in the 19th century the USA became one of the most powerful nations in the world',
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
            'question_text': 'What is the population of Romania? (milions)',
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
            'question_text':
                'Romania is one of the most populated countries in',
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
            'question_text':
                'In ancient times, which people lived on the territory of Romania?',
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
            'question_text':
                'Which principality belonged to the Romanian territory?',
            'answer': answer196,
            'correct_answer': 3,
            'type': 2
          });

          await db.insert('question', {
            'country': 'Romania',
            'subject': 2,
            'difficulty': 1,
            'question_text':
                'In what year was the Union of the Romanian Principalities?',
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
            'question_text':
                'In what year did Romania declare independence from the Ottoman Empire?',
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
            'question_text':
                'During World War II, which power occupied Romania?',
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
            'question_text':
                'In which war did the Romanian Principalities participate to consolidate their status as a sovereign nation?',
            'answer': answer204,
            'correct_answer': 2,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Romania',
            'subject': 2,
            'difficulty': 2,
            'question_text':
                'What is the name of the process through which the Romans influenced the culture of the Dacians?',
            'answer': answer205,
            'correct_answer': 1,
            'type': 1
          });

          await db.insert('question', {
            'country': 'Romania',
            'subject': 2,
            'difficulty': 2,
            'question_text': 'Vlad Tepes ruled in Wallachia',
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
  await db.rawUpdate("UPDATE profile SET last_activity_date = ?", [newDate]);
  print('Updated last activity date to: $newDate');
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
  
  print('Last activity date: $lastActivityDate');
  print('Today: $today');
  
  int differenceInDays = today.difference(lastActivityDate).inDays;
  
  print('Difference in days: $differenceInDays');

  // Get the current streak count
  List<Map> result = await db.query('profile', columns: ['streak_count']);
  int currentStreak = result.isNotEmpty ? result.first['streak_count'] : 0;

  if (differenceInDays == 1) {
    await db.rawUpdate('UPDATE profile SET streak_count = streak_count + 1');
  } else if (differenceInDays > 1) {
    await db.rawUpdate('UPDATE profile SET streak_count = 1');
  } else if (currentStreak == 0) {
    // If the streak is 0, set it to 1 when a lesson is completed
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
    int id = 1;
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
    int id = 1;
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

  Future<int> updateDoubleIQ(int value) async {
    Database db = await database;
    int profileID = 1;
    return await db.update(
      'profile',
      {'double_iq': value},
      where: 'profileID = ?',
      whereArgs: [profileID],
    );
  }
}
