import 'dart:convert';

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
    //"Australia",
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
    //"Chile",
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
    //"South Africa",
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

  String answer1 = jsonEncode(['Barcelona','Madrid','Valencia','Sevilla']);
  String answer2 = jsonEncode(['Munții Pirinei','Munții Cantabrici','Munții Betici','Munții Centrali']);
  String answer3 = jsonEncode(['Vârful Teide','Vârful Aneto','Vârful Mulhacén','Vârful Pico de Orizaba']);
  String answer4 = jsonEncode(['Lisbona','Barcelona','Sevilla','Bilbao']);
  String answer5 = jsonEncode(['Mallorca','Ibiza','Sardinia','Tenerife']);
  String answer6 = jsonEncode(['Marea Neagră','Marea Caspică','Marea Mediterană','Marea Azov']);
  String answer7 = jsonEncode(['Gran Canaria','Tenerife','Lanzarote','Fuerteventura']);
  String answer8 = jsonEncode(['Ebro','Tagus','Guadalquivir','Manzanares']);
  String answer9 = jsonEncode(['Ebro','Guadalquivir','Tagus','Duero']);


  static final _databaseName = "MyDatabase.db";
  static final _databaseVersion = 31;

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
            admin INTEGER
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
          'admin': 0
        });

        await db.insert('country', {
          'name': 'Romania',
          'geographyLesson': 'România este situată în partea de sud-est a Europei, având granițe cu Bulgaria, Serbia, Ungaria, Ucraina și Republica Moldova. Capitala sa, București, este cel mai mare oraș și principal centru cultural, economic și politic al țării. Cu o populație de aproximativ 19 milioane de locuitori, România este una dintre cele mai populate țări din Europa de Est. Teritoriul său este împărțit de Munții Carpați, care formează o barieră naturală ce separă țara în trei regiuni geografice distincte: Transilvania, Moldova și Maramureșul. Acești munți sunt adesea descrisi ca fiind inima României, oferind nu doar peisaje pitorești, ci și o sursă importantă de resurse naturale și biodiversitate. Dunărea, un fluviu navigabil vital, curge prin sudul țării, marcând granița naturală cu Bulgaria și oferind acces la Marea Neagră prin porturile Constanța și Mangalia. Acest aspect geografic a facilitat comerțul și interacțiunile culturale cu alte regiuni din Europa și din întreaga lume. În afară de București, alte orașe importante din România includ Cluj-Napoca, Timișoara, Iași și Constanța, fiecare cu propriile sale bogății culturale și economice. România este o țară în curs de dezvoltare, membră a Uniunii Europene și a NATO, cu o economie mixtă în care industria, agricultura și serviciile joacă roluri importante în creșterea sa economică. Cel mai înalt punct al României este vârful Moldoveanu din Munții Făgăraș, având o altitudine impresionantă de 2.544 de metri. Această înălțime oferă panorame spectaculoase și oportunități pentru alpinism și turism montan. Regiunile istorice ale României, cum ar fi Transilvania, cunoscută pentru peisajele sale montane și orașele istorice, Moldova, renumită pentru siturile sale istorice și moștenirea culturală bogată, și Maramureșul, cu peisajele sale rurale și tradițiile autentice, adaugă unicitate și diversitate acestei țări. Clima României este temperată continentală, cu veri călduroase și ierni reci, fiind influențată de Munții Carpați și de Marea Neagră. Această varietate climatică oferă condiții favorabile pentru o gamă diversă de activități, de la sporturile de iarnă în Carpați până la relaxare la malul Mării Negre în timpul verii.',
          'historyLesson': 'Într-un colț al Europei, se întinde o țară plină de istorie și tradiție numită România. În vremurile străvechi, teritoriul României era locuit de daci, un popor mândru și cu o cultură bogată. În anul 106 d.Hr., Imperiul Roman a cucerit acest teritoriu, începând procesul de romanizare. Această interacțiune între daci și romani a lăsat o amprentă puternică în identitatea românească, reflectată în limba, obiceiurile și tradițiile poporului. În perioada medievală, teritoriul românesc era împărțit în principate autonome, Moldova și Țara Românească. Sub conducerea domnitorilor lor, cum ar fi Ștefan cel Mare și Vlad Țepeș, aceste principate au luptat pentru independență și au rezistat presiunilor străine, stabilind bazele statelor românești. În secolul al XIX-lea, mișcarea națională a crescut semnificativ și a avut loc Unirea Principatelor Române în 1859, sub domnia lui Alexandru Ioan Cuza. Acest pas important a deschis calea pentru formarea României moderne. În 1877, România și-a proclamat independența față de Imperiul Otoman și a participat la Războiul de Independență, consolidându-și statutul de națiune suverană. Între cele două războaie mondiale, România a experimentat perioade de instabilitate politică și progres economic. În 1918, a avut loc Marea Unire între Transilvania, Moldova și Țara Românească. Totuși, în timpul celui de-al Doilea Război Mondial, țara a fost ocupată de trupele Axei, iar după război, a devenit un stat satelit al Uniunii Sovietice. În 1947, România a devenit o republică comunistă sub conducerea lui Gheorghe Gheorghiu-Dej și apoi a lui Nicolae Ceaușescu. Regimul comunist a fost caracterizat de opresiune politică și o stagnare economică. Totuși, în decembrie 1989, Revoluția Română a dus la căderea regimului comunist și la instaurarea democrației în țară. După Revoluție, România a trecut printr-o perioadă de tranziție dificilă către economia de piață și democrație. În 2007, România a devenit membru al Uniunii Europene, consolidându-și angajamentul față de valorile democratice și integrarea europeană.',
          'geography_completed': 0,
          'history_completed': 0,
          'doesExist': 1
        });

        await db.insert('country', {
          'name': 'Spain',
          'geographyLesson': 'Spania este situată în partea de sud-vest a Europei, având granițe cu Franța la nord și nord-est, Portugalia la vest și Andorra și Gibraltar la sud. Capitala sa, Madrid, este cel mai mare oraș și centrul cultural, economic și politic al țării. Cu o populație de aproximativ 47 de milioane de locuitori, Spania este una dintre cele mai populate țări din Europa. Teritoriul său este caracterizat de o mare varietate geografică, cuprinzând zone montane, câmpii, și țărmuri maritime. Munții Pirinei formează granița nordică a țării, oferind peisaje montane spectaculoase și oportunități pentru sporturi de iarnă. În centrul și sudul Spaniei se află o serie de lanțuri muntoase, cum ar fi Munții Cantabrici, Munții Centrali și Munții Betici, care influențează climatul și geografia regiunilor respective. De asemenea, Spania are o rețea vastă de râuri, precum Ebro, Tagus și Guadalquivir, care contribuie la fertilitatea câmpiilor și la dezvoltarea agriculturii. Un aspect geografic semnificativ al Spaniei este Peninsula Iberică, care include și Portugal, și este înconjurată de Oceanul Atlantic și Marea Mediterană. Această poziție strategică a facilitat comerțul maritim și a adus influențe culturale diverse de-a lungul istoriei. În plus față de Madrid, alte orașe importante din Spania includ Barcelona, Valencia, Sevilla și Bilbao, fiecare având caracteristici geografice și culturale distincte. Spania este o destinație turistică populară datorită plajelor sale mediteraneene, orașelor istorice și peisajelor naturale variate. Cel mai înalt vârf din Spania este vârful Teide din Insulele Canare, având o altitudine de 3.718 metri. Acest vârf vulcanic oferă oportunități pentru explorare și turism ecologic într-un mediu unic. Clima Spaniei variază de la mediteraneană în sud la temperată în nord, iar influențele oceanice și continentale se resimt în diferite regiuni ale țării. Această diversitate climatică oferă condiții favorabile pentru o gamă largă de activități în aer liber și agricultură. Spania include mai multe arhipelaguri importante, cum ar fi Insulele Baleare în Marea Mediterană și Insulele Canare în Oceanul Atlantic. Insulele Baleare, printre care se numără Mallorca, Menorca, Ibiza și Formentera, sunt cunoscute pentru plajele lor frumoase, apele cristaline și viața de noapte vibrantă. Aceste insule sunt o destinație populară pentru turiști din întreaga lume, oferind o varietate de activități recreative și culturale. Insulele Canare, situate în largul coastelor africane, sunt formate din țapuscă vulcanică și oferă un peisaj spectaculos și diversitate ecologică. Insula Tenerife este cunoscută pentru vârful său vulcanic Teide, iar Gran Canaria pentru dunele sale de nisip și pentru viața sa maritimă bogată.',
          'historyLesson': 'În sud-vestul Europei, se află o țară cu o moștenire istorică bogată numită Spania. În antichitate, teritoriul spaniol era locuit de popoare precum ibero-geții și celtiberii, care au fost ulterior colonizați de romani, contribuind la formarea provinciei romane Hispania. În Evul Mediu, Spania a fost împărțită în numeroase regate și taifas, fiecare cu propria lor cultură și identitate. Printre cele mai importante regate se numărau Regatul Castiliei, Regatul Aragonului și Regatul Navarrei. În această perioadă, au existat și perioade de coabitare și conflicte între creștini, musulmani și evrei, evidențiind diversitatea religioasă și culturală a peninsulei iberice. În secolul al XV-lea, prin căsătoria regilor Ferdinand al II-lea al Aragonului și Isabela I a Castiliei, a fost creată o uniune între cele două regate, marcând începutul formării Spaniei moderne. Sub conducerea lor, a fost finalizată Reconquista, recucerirea teritoriilor musulmane din Spania, iar în 1492 a fost semnat decretul de expulzare a evreilor și a maurilor, consolidând controlul catolic asupra regatului. Perioada cuceririi și colonizării Americii de către spanioli a adus Spaniei o mare bogăție și putere în secolele XVI-XVII. Această epocă a fost marcată de mari exploratori și cuceritori precum Cristofor Columb, Hernán Cortés și Francisco Pizarro, care au extins influența spaniolă în întreaga lume. În secolul al XIX-lea, Spania a fost implicată în numeroase conflicte interne și externe, inclusiv Războiul Peninsular împotriva armatelor lui Napoleon și pierderea majorității coloniilor sale americane în urma războaielor de independență din America Latină. În secolul al XX-lea, Spania a fost martoră a unor perioade de instabilitate politică, inclusiv dictatura lui Francisco Franco între 1939 și 1975. După moartea sa, Spania a trecut printr-o tranziție către democrație, culminând cu adoptarea unei constituții democratice în 1978. În prezent, Spania este o monarhie parlamentară și membru al Uniunii Europene, având o economie diversificată și o moștenire culturală și istorică impresionantă.',
          'geography_completed': 0,
          'history_completed': 0,
          'doesExist': 1
        });

        await db.insert('country', {
          'name': 'France',
          'geographyLesson': 'Geografia Franței oferă o diversitate remarcabilă, cuprinzând regiuni montane, câmpii fertile și litorale spectaculoase. Situată în partea de vest a Europei, Franța se învecinează cu Spania la sud-vest, Belgia și Luxemburg la nord-est, Germania și Elveția la est, Italia la sud-est și Marea Mediterană la sud. Capitala Franței, Parisul, este unul dintre cele mai mari centre culturale și economice ale lumii, cunoscut pentru atracțiile sale turistice remarcabile, precum Turnul Eiffel, Catedrala Notre-Dame și Muzeul Luvru. Cu o populație de aproximativ 67 de milioane de locuitori, Franța este una dintre cele mai populate țări din Europa. Relieful Franței este variat și spectaculos. Munții Alpi se întind în partea de sud-est a țării, marcând granița cu Italia, și includ cel mai înalt vârf al Franței, Mont Blanc, cu o altitudine de 4.810 metri. În partea sud-vestică, Munții Pirinei formează o graniță naturală cu Spania, oferind peisaje montane impresionante și facilitând activități sportive precum schiul și alpinismul. În nordul Franței se găsesc Câmpiile Nordului și Câmpiile Loarei, regiuni fertile care susțin o agricultură bogată și diverse industrii. De asemenea, Franța este traversată de numeroase râuri importante, cum ar fi Sena, Loara și Rhone, care au avut un impact semnificativ asupra dezvoltării sale economice și culturale. Franța este recunoscută și pentru coasta sa pitorească, care se întinde de-a lungul Mării Mediterane și a Oceanului Atlantic. Riviera Franceză, situată în sud-estul țării, este cunoscută pentru stațiunile sale de lux și plajele frumoase, în timp ce Bretania, în nord-vest, este faimoasă pentru peisajele sale sălbatice și stâncile impresionante. În afară de Paris, alte orașe importante din Franța includ Lyon, Marsilia, Bordeaux și Strasbourg, fiecare având propria sa identitate culturală și atracții distincte. Franța este, de asemenea, renumită pentru vinurile sale fine, gastronomia rafinată și cultura bogată. Clima Franței variază de la mediteraneană în sud la temperată în nord, cu influențe oceanice și continentale. Această diversitate climatică permite dezvoltarea unei game variate de culturi agricole și susține turismul pe tot parcursul anului.',
          'historyLesson': 'Istoria Franței este una dintre cele mai fascinante din Europa, începând cu antichitatea și ajungând până în prezent. În acele vremuri îndepărtate, teritoriul francez era populat de triburi celtice și galice, iar apoi a fost colonizat de romani, formând provincia romană Gallia. Evul Mediu a adus feudalismul și fragmentarea țării în regate și principate, precum Regatul Franciei și Ducatul Normandiei. În secolul al XV-lea, Franța a început să se consolideze sub conducerea lui Ludovic al XI-lea, marcând începutul formării Franței moderne. Revolutia Franceză din 1789 a pus capăt monarhiei și a instaurat o republică, urmată de perioada Napoleonică care a adus expansiune teritorială și influență sub conducerea lui Napoleon Bonaparte. Secolul al XIX-lea a fost plin de schimbări și conflicte majore, inclusiv Războiul Franco-Prusac și instaurarea celei de-a Treia Republici în 1870. Secolul al XX-lea a fost marcat de cele două războaie mondiale și ocupația nazistă între 1940 și 1944. După Al Doilea Război Mondial, Franța a fost una dintre puterile fondatoare ale Uniunii Europene și a cunoscut procesul de decolonizare, pierzând majoritatea coloniilor sale în Africa și Asia. Astăzi, Franța rămâne una dintre cele mai importante și influente țări din lume, cu o economie diversificată, un sistem politic stabil și o moștenire culturală și artistică bogată. Gastronomia franceză este renumită la nivel mondial, iar arta și arhitectura sa impresionantă atrag milioane de turiști în fiecare an. Contribuțiile sale în domenii precum știința, tehnologia și literatura continuă să influențeze lumea modernă, consolidând statutul Franței ca una dintre marile puteri ale secolului XXI.',
          'geography_completed': 0,
          'history_completed': 0,
          'doesExist': 1
        });

        await db.insert('country', {
          'name': 'United States',
          'geographyLesson': 'Statele Unite ale Americii (SUA), una dintre cele mai mari și influente țări din lume, se află în America de Nord, având granițe cu Canada la nord și Mexic la sud. Capitala sa este Washington, D.C., iar New York City este un important centru cultural, economic și financiar. Teritoriul SUA este extrem de divers, cuprinzând munți, câmpii, deșerturi și regiuni de coastă. La vest se găsesc Munții Stâncoși, iar la est se întinde Marea de Est. La sud se află Deșertul Sonora, iar la nord-vest se întinde Podișul Columbia. Aceste caracteristici geografice influențează clima și economia țării. Râurile majore, cum ar fi Mississippi și Missouri, traversează SUA, furnizând resurse naturale și fiind vitale pentru transportul intern. Mississippi este unul dintre cele mai lungi râuri din lume și a avut o mare importanță în dezvoltarea istorică și economică a țării. O caracteristică geografică iconică a SUA o reprezintă Parcul Național Yellowstone, situat în statul Wyoming, care găzduiește gheizere, izvoare termale și o varietate de faună sălbatică. Printre speciile de animale emblemă din Parcul Național Yellowstone se numără ursul grizzly, care este considerat un simbol al sălbăticiei și al puterii naturii. Ursul grizzly poate fi întâlnit în diferite părți ale parcului, căutând hrană în zonele împădurite sau de-a lungul cursurilor de apă. SUA are și o coastă extinsă, cu orașe maritime importante precum Los Angeles, San Francisco și Miami. Aceste orașe portuare au jucat un rol crucial în dezvoltarea comerțului maritim și a economiei americane. În plus față de Washington, D.C. și New York City, alte orașe importante din SUA includ Los Angeles, Chicago și Houston, fiecare având caracteristici geografice și culturale distincte. SUA este o destinație turistică populară datorită diversității sale culturale, a parcurilor naționale și a orașelor vibrante. Clima SUA variază considerabil de la nord la sud și de la est la vest, cu regiuni temperate, deșertice și subtropicale. În nord-est, iernile sunt reci și zăpădite, în timp ce în sud-vest verile sunt fierbinți și uscate. SUA include și mai multe teritorii în afara continentului principal, cum ar fi Hawaii și Puerto Rico, care oferă peisaje spectaculoase și culturi diverse. SUA este cunoscută pentru diversitatea sa culinară, cu influențe din întreaga lume, inclusiv mâncăruri tradiționale precum burgeri, pizza și friptură, dar și specialități regionale cum ar fi gumbo din Louisiana și sushi din California',
          'historyLesson': 'Înaintea colonizării europene, teritoriul actual al Statelor Unite era locuit de populații amerindiene diverse, care aveau culturi și societăți variate. Cu sosirea exploratorilor europeni în secolul al XVI-lea, începe procesul de colonizare a Americii de Nord. În secolul al XVIII-lea, coloniile britanice din America de Nord au luptat pentru independență împotriva coroanei britanice. Declarația de Independență a fost adoptată în 1776, marcând începutul Statelor Unite ale Americii ca națiune independentă. În secolul al XIX-lea, Statele Unite au experimentat o extindere teritorială masivă spre vest, într-un proces cunoscut sub numele de "Manifest Destiny". Însă, această expansiune a alimentat tensiuni între statele slave și cele non-slave, culminând în Războiul Civil American (1861-1865), care a fost luptat între statele care susțineau sclavia și cele care se opuneau ei. După Războiul Civil, Statele Unite au cunoscut o perioadă de industrializare rapidă și dezvoltare economică. În secolul al XX-lea, ele au devenit una dintre cele mai puternice și influente națiuni din lume, jucând un rol major în ambele războaie mondiale și devenind un pilon al economiei globale. Prohibiția a fost perioada în care producția, distribuția și consumul de alcool au fost interzise prin lege în întreaga țară, între anii 1920 și 1933. Această politică a fost implementată prin adoptarea celui de-al 18-lea amendament la Constituția SUA în 1919 și prin Legea Volstead. În prezent, Statele Unite rămân o putere economică și militară dominantă, dar se confruntă cu o serie de provocări interne și internaționale, inclusiv inegalitatea economică, schimbările climatice și tensiunile geopolitice. Cu toate acestea, diversitatea sa culturală, inovația și angajamentul față de valorile democratice continuă să definească națiunea și să inspire lumea.',
          'geography_completed': 0,
          'history_completed': 0,
          'doesExist': 1
        });

        await db.insert('country', {
          'name': 'Italy',
          'geographyLesson': 'Italia este situată în partea de sud a Europei, având granițe cu Franța la nord-vest, Elveția și Austria la nord și nord-est, Slovenia la nord-est și Croația la est. Capitala sa, Roma, este cel mai mare oraș și centrul cultural, istoric și politic al țării. Cu o populație de aproximativ 60 de milioane de locuitori, Italia este una dintre cele mai populate țări din Europa. Teritoriul său este caracterizat de o varietate geografică remarcabilă, cuprinzând munți, câmpii și țărmuri maritime. Munții Alpi formează granița nordică a țării, oferind peisaje alpine spectaculoase și oportunități pentru sporturi de iarnă. În centrul Italiei se află o serie de lanțuri muntoase, cum ar fi Apeninii, care se întind pe aproape toată lungimea peninsulei italiene și influențează climatul și geografia regiunilor respective. De asemenea, Italia are o rețea extinsă de râuri, precum Po, Tevere și Arno, care contribuie la fertilitatea câmpiilor și la dezvoltarea agriculturii. Un aspect geografic semnificativ al Italiei este Peninsula Italică, care se întinde în Marea Mediterană și este înconjurată de mai multe insule, cum ar fi Sicilia și Sardinia. Această poziție strategică a favorizat comerțul maritim și a adus influențe culturale diverse de-a lungul istoriei. Vezuviul este un vulcan activ situat în apropierea orașului Napoli din regiunea Campania din sudul Italiei. Este cunoscut în special pentru erupția sa devastatoare din anul 79 d.Hr., care a dus la distrugerea orașelor Pompei și Herculaneum. Acest vulcan este considerat unul dintre cei mai periculoși din lume din cauza populației dense și a impactului potențial asupra orașelor înconjurătoare în cazul unei noi erupții majore. În plus față de Roma, alte orașe importante din Italia includ Milano, Napoli, Florența și Veneția, fiecare având caracteristici geografice și culturale distincte. Italia este o destinație turistică populară datorită orașelor istorice, artei și arhitecturii sale bogate și peisajelor naturale variate. Cel mai înalt vârf din Italia este vârful Mont Blanc din Alpii Graiei, având o altitudine de 4.808 metri. Acest vârf glaciar oferă oportunități pentru alpinism și turism ecologic într-un mediu spectaculos. Italia este cunoscută în întreaga lume pentru producția sa bogată și variată de vinuri. Regiunea Toscana, în special, este renumită pentru vinul Chianti, un vin roșu sec. Clima Italiei variază de la mediteraneană în sud la temperată în nord, iar influențele oceanice și continentale se resimt în diferite regiuni ale țării. Această diversitate climatică oferă condiții favorabile pentru o gamă largă de activități în aer liber și agricultură. Italia include și mai multe insule importante, cum ar fi Sicilia și Sardinia, care au peisaje spectaculoase și o istorie bogată.',
          'historyLesson': 'În sudul Europei, se găsește o țară cu o istorie bogată și variată - Italia. În antichitate, peninsula italiană era locuită de diverse popoare precum etruscii, grecii și samniții, dar a devenit cunoscută mai ales prin cucerirea romană, care a dus la formarea Republicii Romane și apoi a Imperiului Roman. În Evul Mediu, Italia a fost divizată în numeroase state și republici independente, precum Republica Venețiană, Ducatul Milano, Republica Florentină și Statul Papal. Această perioadă a fost marcată de competiția între aceste entități pentru putere și control.În timpul Renașterii, Italia a fost epicentrul unui puternic mișcări culturale și artistice, marcând o perioadă de înflorire în domenii precum arta, arhitectura și literatura. Personalități precum Leonardo da Vinci, Michelangelo și Dante Alighieri au contribuit la reputația de centru cultural al Europei al Italiei. În secolele XVIII și XIX, Italia a fost scena unor conflicte și transformări politice importante, incluzând războaiele napoleoniene și procesul de unificare a Italiei sub conducerea lui Giuseppe Garibaldi și a lui Camillo Benso, conte de Cavour. Acest proces a dus la formarea statului italian modern, care a fost completat în 1871, când Roma a devenit capitala Italiei. În secolul al XX-lea, Italia a fost implicată în ambele războaie mondiale. În Primul Război Mondial, Italia s-a alăturat Puterilor Aliate în 1915, în speranța că ar obține teritorii promițătoare de la Puterile Centrale. Luptele au fost concentrate în principal pe frontul italian în Alpii Orientali și au implicat confruntări dure cu trupele austro-ungare. După război, Italia a fost dezamăgită de rezultatele Conferinței de Pace de la Paris, care nu a satisfăcut așteptările sale teritoriale. Această perioadă a generat nemulțumiri și instabilitate politică în Italia, pregătind terenul pentru ascensiunea fascismului. În 1957, Italia a fost una dintre țările fondatoare ale Comunității Economice Europene (CEE), precursorul Uniunii Europene, semnând Tratatul de la Roma. Astfel, Italia a fost implicată încă de la început în procesul de integrare europeană. Italia este cunoscută pentru peisajele sale pitorești, patrimoniul său istoric și cultural bogat, bucătăria sa renumită și contribuțiile sale la domenii precum moda și designul.',
          'geography_completed': 0,
          'history_completed': 0,
          'doesExist': 1
        });

        await db.insert('country', {
          'name': 'China',
          'geographyLesson': 'China, una dintre cele mai mari țări din lume ca suprafață și populație, este situată în Asia de Est, având granițe cu mai multe țări importante precum Rusia și Mongolia la nord, India, Nepal și Bhutan la sud, și Coreea de Nord, Vietnam și Laos la sud-est. Capitala sa, Beijing, este un centru cultural, economic și politic major, iar Shanghai este unul dintre cele mai mari orașe din lume, fiind un important centru financiar și comercial. Teritoriul Chinei este caracterizat de o varietate geografică impresionantă, cuprinzând munți, câmpii și regiuni de coastă. La vest, munții Himalaya formează o graniță naturală, iar la sud-vest se găsesc Munții Tian, care includ cel mai înalt vârf din China, vârful Everest. În partea de nord se află Munții Altai, iar la est se întind Munții Qinling. Aceste lanțuri muntoase influențează în mod semnificativ clima și geografia țării. Râurile majore, precum Yangtze și Fluviul Galben, traversează China, furnizând apă pentru irigații și transportul naval. Yangtze este al treilea cel mai lung râu din lume și are o importanță culturală și economică semnificativă, cu orașe importante precum Chongqing și Wuhan aflate pe malurile sale. O caracteristică geografică distinctivă a Chinei o reprezintă Marele Zid, o structură masivă de apărare construită de-a lungul secolelor pentru a proteja imperiul chinez împotriva invaziilor din nord. Acest monument istoric impresionant este o atracție turistică de prim rang și simbolizează bogata istorie și cultura a Chinei. China are și o coastă extinsă, cu orașe portuare importante precum Hong Kong, Guangzhou și Shenzhen. Aceste regiuni au jucat un rol crucial în dezvoltarea comerțului maritim și a economiei chineze moderne. În plus față de Beijing și Shanghai, alte orașe importante din China includ Guangzhou, Chengdu și Xi an, fiecare având caracteristici geografice și culturale distincte. China este o destinație turistică populară datorită patrimoniului său cultural bogat, precum și peisajelor naturale variate, cum ar fi Muntele Huangshan și Yangshuo Karst. Clima Chinei variază considerabil de la nord la sud și de la est la vest, cu regiuni temperate, subtropicale și tropicale. În nord, iernile sunt reci și uscate, în timp ce în sud verile sunt calde și umede. China include și mai multe regiuni autonome, cum ar fi Tibetul și Xinjiang, care au peisaje spectaculoase și o diversitate culturală remarcabilă. China este, de asemenea, renumită pentru bogata sa istorie culinară și diversitatea sa gastronomică, care variază de la mâncăruri picante din Sichuan la delicatese din Shanghai și fructe de mare din Canton.',
          'historyLesson': 'În Asia de Est, se află o țară cu o istorie străveche și fascinantă - China. De-a lungul mileniilor, China a fost locuită de diverse civilizații și culturi, iar evoluția sa istorică a fost marcată de momente semnificative și transformări profunde. În perioada antică, China a fost locuită de numeroase triburi și regate, dar unificarea sa sub o autoritate centrală a început sub Dinastia Qin, care a condus în secolul al III-lea î.Hr. Dinastia Qin a fost urmată de Dinastiile Han, Tang și Song, perioade de prosperitate și inovație în domenii precum știința, tehnologia și arta. În Evul Mediu, China a cunoscut o serie de dinastii și imperii, precum Yuan (fondată de mongoli), Ming și Qing. În timpul dinastiei Tang și Song, China a fost un centru comercial și cultural important, fiind cunoscută pentru invențiile sale tehnologice precum tiparul mobil și busola. În secolul al XIX-lea, China a fost afectată de agresiunea imperialistă și influența puterilor străine, ceea ce a dus la războaiele opiumului și la Tratatul de la Nanking, care a deschis porțile Chinei pentru comerțul străin și a impus concesiuni teritoriale. Această perioadă de slăbiciune a statului chinez a culminat cu Revolta boxerilor și căderea dinastiei Qing. În secolul XX, China a trecut printr-o serie de schimbări politice și sociale semnificative. Revoluția din 1911 a condus la căderea sistemului imperial și la fondarea Republicii Chineze sub conducerea lui Sun Yat-sen. În 1949, Partidul Comunist Chinez, condus de Mao Zedong, a proclamat înființarea Republicii Populare Chineze, punând capăt unui secol de dominație străină și instabilitate internă. De-a lungul deceniilor, China a traversat reforme economice și sociale masive sub conducerea lui Deng Xiaoping și a succesorilor săi, transformându-se dintr-o economie planificată într-una orientată către piață și devenind una dintre cele mai mari puteri economice din lume. Astăzi, China este cunoscută pentru tehnologia sa avansată, economia sa în creștere rapidă și influența sa globală în domenii precum comerțul internațional și politica mondială. Pe lângă aceste aspecte, China are o istorie culturală bogată, cu contribuții semnificative în domenii precum filosofia, literatura, arta și arhitectura.',
          'geography_completed': 0,
          'history_completed': 0,
          'doesExist': 1
        });

        await db.insert('country', {
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
        });

        await db.insert('question', {
          'country': 'Spain',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'Care este capitala Spaniei și cel mai mare oraș al țării?',
          'answer': answer1,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Spain',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'Care lanț muntos formează granița nordică a Spaniei?',
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
          'question_text': 'Care dintre următoarele orașe nu este situat în Spania?',
          'answer': answer4,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Spain',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'Care dintre următoarele insule nu aparține Spaniei?',
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
          'question_text': 'Care este cea mai mare insulă din Insulele Canare ca suprafață?',
          'answer': answer7,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Spain',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'Care este râul principal care străbate capitala Spaniei?',
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
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
        if (newVersion > oldVersion) {
          //await db.execute('DROP TABLE profile');
          //await db.execute('DROP TABLE $table');
          /*await db.execute('''
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
            admin INTEGER
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
            'admin': 0
          });*/
          /*await db.execute('''
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
          }*/

          //preinstall
          await db.insert('country', {
          'name': 'Romania',
          'geographyLesson': 'România este situată în partea de sud-est a Europei, având granițe cu Bulgaria, Serbia, Ungaria, Ucraina și Republica Moldova. Capitala sa, București, este cel mai mare oraș și principal centru cultural, economic și politic al țării. Cu o populație de aproximativ 19 milioane de locuitori, România este una dintre cele mai populate țări din Europa de Est. Teritoriul său este împărțit de Munții Carpați, care formează o barieră naturală ce separă țara în trei regiuni geografice distincte: Transilvania, Moldova și Maramureșul. Acești munți sunt adesea descrisi ca fiind inima României, oferind nu doar peisaje pitorești, ci și o sursă importantă de resurse naturale și biodiversitate. Dunărea, un fluviu navigabil vital, curge prin sudul țării, marcând granița naturală cu Bulgaria și oferind acces la Marea Neagră prin porturile Constanța și Mangalia. Acest aspect geografic a facilitat comerțul și interacțiunile culturale cu alte regiuni din Europa și din întreaga lume. În afară de București, alte orașe importante din România includ Cluj-Napoca, Timișoara, Iași și Constanța, fiecare cu propriile sale bogății culturale și economice. România este o țară în curs de dezvoltare, membră a Uniunii Europene și a NATO, cu o economie mixtă în care industria, agricultura și serviciile joacă roluri importante în creșterea sa economică. Cel mai înalt punct al României este vârful Moldoveanu din Munții Făgăraș, având o altitudine impresionantă de 2.544 de metri. Această înălțime oferă panorame spectaculoase și oportunități pentru alpinism și turism montan. Regiunile istorice ale României, cum ar fi Transilvania, cunoscută pentru peisajele sale montane și orașele istorice, Moldova, renumită pentru siturile sale istorice și moștenirea culturală bogată, și Maramureșul, cu peisajele sale rurale și tradițiile autentice, adaugă unicitate și diversitate acestei țări. Clima României este temperată continentală, cu veri călduroase și ierni reci, fiind influențată de Munții Carpați și de Marea Neagră. Această varietate climatică oferă condiții favorabile pentru o gamă diversă de activități, de la sporturile de iarnă în Carpați până la relaxare la malul Mării Negre în timpul verii.',
          'historyLesson': 'Într-un colț al Europei, se întinde o țară plină de istorie și tradiție numită România. În vremurile străvechi, teritoriul României era locuit de daci, un popor mândru și cu o cultură bogată. În anul 106 d.Hr., Imperiul Roman a cucerit acest teritoriu, începând procesul de romanizare. Această interacțiune între daci și romani a lăsat o amprentă puternică în identitatea românească, reflectată în limba, obiceiurile și tradițiile poporului. În perioada medievală, teritoriul românesc era împărțit în principate autonome, Moldova și Țara Românească. Sub conducerea domnitorilor lor, cum ar fi Ștefan cel Mare și Vlad Țepeș, aceste principate au luptat pentru independență și au rezistat presiunilor străine, stabilind bazele statelor românești. În secolul al XIX-lea, mișcarea națională a crescut semnificativ și a avut loc Unirea Principatelor Române în 1859, sub domnia lui Alexandru Ioan Cuza. Acest pas important a deschis calea pentru formarea României moderne. În 1877, România și-a proclamat independența față de Imperiul Otoman și a participat la Războiul de Independență, consolidându-și statutul de națiune suverană. Între cele două războaie mondiale, România a experimentat perioade de instabilitate politică și progres economic. În 1918, a avut loc Marea Unire între Transilvania, Moldova și Țara Românească. Totuși, în timpul celui de-al Doilea Război Mondial, țara a fost ocupată de trupele Axei, iar după război, a devenit un stat satelit al Uniunii Sovietice. În 1947, România a devenit o republică comunistă sub conducerea lui Gheorghe Gheorghiu-Dej și apoi a lui Nicolae Ceaușescu. Regimul comunist a fost caracterizat de opresiune politică și o stagnare economică. Totuși, în decembrie 1989, Revoluția Română a dus la căderea regimului comunist și la instaurarea democrației în țară. După Revoluție, România a trecut printr-o perioadă de tranziție dificilă către economia de piață și democrație. În 2007, România a devenit membru al Uniunii Europene, consolidându-și angajamentul față de valorile democratice și integrarea europeană.',
          'geography_completed': 0,
          'history_completed': 0,
          'doesExist': 1
        });

        await db.insert('country', {
          'name': 'Spain',
          'geographyLesson': 'Spania este situată în partea de sud-vest a Europei, având granițe cu Franța la nord și nord-est, Portugalia la vest și Andorra și Gibraltar la sud. Capitala sa, Madrid, este cel mai mare oraș și centrul cultural, economic și politic al țării. Cu o populație de aproximativ 47 de milioane de locuitori, Spania este una dintre cele mai populate țări din Europa. Teritoriul său este caracterizat de o mare varietate geografică, cuprinzând zone montane, câmpii, și țărmuri maritime. Munții Pirinei formează granița nordică a țării, oferind peisaje montane spectaculoase și oportunități pentru sporturi de iarnă. În centrul și sudul Spaniei se află o serie de lanțuri muntoase, cum ar fi Munții Cantabrici, Munții Centrali și Munții Betici, care influențează climatul și geografia regiunilor respective. De asemenea, Spania are o rețea vastă de râuri, precum Ebro, Tagus și Guadalquivir, care contribuie la fertilitatea câmpiilor și la dezvoltarea agriculturii. Un aspect geografic semnificativ al Spaniei este Peninsula Iberică, care include și Portugal, și este înconjurată de Oceanul Atlantic și Marea Mediterană. Această poziție strategică a facilitat comerțul maritim și a adus influențe culturale diverse de-a lungul istoriei. În plus față de Madrid, alte orașe importante din Spania includ Barcelona, Valencia, Sevilla și Bilbao, fiecare având caracteristici geografice și culturale distincte. Spania este o destinație turistică populară datorită plajelor sale mediteraneene, orașelor istorice și peisajelor naturale variate. Cel mai înalt vârf din Spania este vârful Teide din Insulele Canare, având o altitudine de 3.718 metri. Acest vârf vulcanic oferă oportunități pentru explorare și turism ecologic într-un mediu unic. Clima Spaniei variază de la mediteraneană în sud la temperată în nord, iar influențele oceanice și continentale se resimt în diferite regiuni ale țării. Această diversitate climatică oferă condiții favorabile pentru o gamă largă de activități în aer liber și agricultură. Spania include mai multe arhipelaguri importante, cum ar fi Insulele Baleare în Marea Mediterană și Insulele Canare în Oceanul Atlantic. Insulele Baleare, printre care se numără Mallorca, Menorca, Ibiza și Formentera, sunt cunoscute pentru plajele lor frumoase, apele cristaline și viața de noapte vibrantă. Aceste insule sunt o destinație populară pentru turiști din întreaga lume, oferind o varietate de activități recreative și culturale. Insulele Canare, situate în largul coastelor africane, sunt formate din țapuscă vulcanică și oferă un peisaj spectaculos și diversitate ecologică. Insula Tenerife este cunoscută pentru vârful său vulcanic Teide, iar Gran Canaria pentru dunele sale de nisip și pentru viața sa maritimă bogată.',
          'historyLesson': 'În sud-vestul Europei, se află o țară cu o moștenire istorică bogată numită Spania. În antichitate, teritoriul spaniol era locuit de popoare precum ibero-geții și celtiberii, care au fost ulterior colonizați de romani, contribuind la formarea provinciei romane Hispania. În Evul Mediu, Spania a fost împărțită în numeroase regate și taifas, fiecare cu propria lor cultură și identitate. Printre cele mai importante regate se numărau Regatul Castiliei, Regatul Aragonului și Regatul Navarrei. În această perioadă, au existat și perioade de coabitare și conflicte între creștini, musulmani și evrei, evidențiind diversitatea religioasă și culturală a peninsulei iberice. În secolul al XV-lea, prin căsătoria regilor Ferdinand al II-lea al Aragonului și Isabela I a Castiliei, a fost creată o uniune între cele două regate, marcând începutul formării Spaniei moderne. Sub conducerea lor, a fost finalizată Reconquista, recucerirea teritoriilor musulmane din Spania, iar în 1492 a fost semnat decretul de expulzare a evreilor și a maurilor, consolidând controlul catolic asupra regatului. Perioada cuceririi și colonizării Americii de către spanioli a adus Spaniei o mare bogăție și putere în secolele XVI-XVII. Această epocă a fost marcată de mari exploratori și cuceritori precum Cristofor Columb, Hernán Cortés și Francisco Pizarro, care au extins influența spaniolă în întreaga lume. În secolul al XIX-lea, Spania a fost implicată în numeroase conflicte interne și externe, inclusiv Războiul Peninsular împotriva armatelor lui Napoleon și pierderea majorității coloniilor sale americane în urma războaielor de independență din America Latină. În secolul al XX-lea, Spania a fost martoră a unor perioade de instabilitate politică, inclusiv dictatura lui Francisco Franco între 1939 și 1975. După moartea sa, Spania a trecut printr-o tranziție către democrație, culminând cu adoptarea unei constituții democratice în 1978. În prezent, Spania este o monarhie parlamentară și membru al Uniunii Europene, având o economie diversificată și o moștenire culturală și istorică impresionantă.',
          'geography_completed': 0,
          'history_completed': 0,
          'doesExist': 1
        });

        await db.insert('country', {
          'name': 'France',
          'geographyLesson': 'Geografia Franței oferă o diversitate remarcabilă, cuprinzând regiuni montane, câmpii fertile și litorale spectaculoase. Situată în partea de vest a Europei, Franța se învecinează cu Spania la sud-vest, Belgia și Luxemburg la nord-est, Germania și Elveția la est, Italia la sud-est și Marea Mediterană la sud. Capitala Franței, Parisul, este unul dintre cele mai mari centre culturale și economice ale lumii, cunoscut pentru atracțiile sale turistice remarcabile, precum Turnul Eiffel, Catedrala Notre-Dame și Muzeul Luvru. Cu o populație de aproximativ 67 de milioane de locuitori, Franța este una dintre cele mai populate țări din Europa. Relieful Franței este variat și spectaculos. Munții Alpi se întind în partea de sud-est a țării, marcând granița cu Italia, și includ cel mai înalt vârf al Franței, Mont Blanc, cu o altitudine de 4.810 metri. În partea sud-vestică, Munții Pirinei formează o graniță naturală cu Spania, oferind peisaje montane impresionante și facilitând activități sportive precum schiul și alpinismul. În nordul Franței se găsesc Câmpiile Nordului și Câmpiile Loarei, regiuni fertile care susțin o agricultură bogată și diverse industrii. De asemenea, Franța este traversată de numeroase râuri importante, cum ar fi Sena, Loara și Rhone, care au avut un impact semnificativ asupra dezvoltării sale economice și culturale. Franța este recunoscută și pentru coasta sa pitorească, care se întinde de-a lungul Mării Mediterane și a Oceanului Atlantic. Riviera Franceză, situată în sud-estul țării, este cunoscută pentru stațiunile sale de lux și plajele frumoase, în timp ce Bretania, în nord-vest, este faimoasă pentru peisajele sale sălbatice și stâncile impresionante. În afară de Paris, alte orașe importante din Franța includ Lyon, Marsilia, Bordeaux și Strasbourg, fiecare având propria sa identitate culturală și atracții distincte. Franța este, de asemenea, renumită pentru vinurile sale fine, gastronomia rafinată și cultura bogată. Clima Franței variază de la mediteraneană în sud la temperată în nord, cu influențe oceanice și continentale. Această diversitate climatică permite dezvoltarea unei game variate de culturi agricole și susține turismul pe tot parcursul anului.',
          'historyLesson': 'Istoria Franței este una dintre cele mai fascinante din Europa, începând cu antichitatea și ajungând până în prezent. În acele vremuri îndepărtate, teritoriul francez era populat de triburi celtice și galice, iar apoi a fost colonizat de romani, formând provincia romană Gallia. Evul Mediu a adus feudalismul și fragmentarea țării în regate și principate, precum Regatul Franciei și Ducatul Normandiei. În secolul al XV-lea, Franța a început să se consolideze sub conducerea lui Ludovic al XI-lea, marcând începutul formării Franței moderne. Revolutia Franceză din 1789 a pus capăt monarhiei și a instaurat o republică, urmată de perioada Napoleonică care a adus expansiune teritorială și influență sub conducerea lui Napoleon Bonaparte. Secolul al XIX-lea a fost plin de schimbări și conflicte majore, inclusiv Războiul Franco-Prusac și instaurarea celei de-a Treia Republici în 1870. Secolul al XX-lea a fost marcat de cele două războaie mondiale și ocupația nazistă între 1940 și 1944. După Al Doilea Război Mondial, Franța a fost una dintre puterile fondatoare ale Uniunii Europene și a cunoscut procesul de decolonizare, pierzând majoritatea coloniilor sale în Africa și Asia. Astăzi, Franța rămâne una dintre cele mai importante și influente țări din lume, cu o economie diversificată, un sistem politic stabil și o moștenire culturală și artistică bogată. Gastronomia franceză este renumită la nivel mondial, iar arta și arhitectura sa impresionantă atrag milioane de turiști în fiecare an. Contribuțiile sale în domenii precum știința, tehnologia și literatura continuă să influențeze lumea modernă, consolidând statutul Franței ca una dintre marile puteri ale secolului XXI.',
          'geography_completed': 0,
          'history_completed': 0,
          'doesExist': 1
        });

        await db.insert('country', {
          'name': 'United States',
          'geographyLesson': 'Statele Unite ale Americii (SUA), una dintre cele mai mari și influente țări din lume, se află în America de Nord, având granițe cu Canada la nord și Mexic la sud. Capitala sa este Washington, D.C., iar New York City este un important centru cultural, economic și financiar. Teritoriul SUA este extrem de divers, cuprinzând munți, câmpii, deșerturi și regiuni de coastă. La vest se găsesc Munții Stâncoși, iar la est se întinde Marea de Est. La sud se află Deșertul Sonora, iar la nord-vest se întinde Podișul Columbia. Aceste caracteristici geografice influențează clima și economia țării. Râurile majore, cum ar fi Mississippi și Missouri, traversează SUA, furnizând resurse naturale și fiind vitale pentru transportul intern. Mississippi este unul dintre cele mai lungi râuri din lume și a avut o mare importanță în dezvoltarea istorică și economică a țării. O caracteristică geografică iconică a SUA o reprezintă Parcul Național Yellowstone, situat în statul Wyoming, care găzduiește gheizere, izvoare termale și o varietate de faună sălbatică. Printre speciile de animale emblemă din Parcul Național Yellowstone se numără ursul grizzly, care este considerat un simbol al sălbăticiei și al puterii naturii. Ursul grizzly poate fi întâlnit în diferite părți ale parcului, căutând hrană în zonele împădurite sau de-a lungul cursurilor de apă. SUA are și o coastă extinsă, cu orașe maritime importante precum Los Angeles, San Francisco și Miami. Aceste orașe portuare au jucat un rol crucial în dezvoltarea comerțului maritim și a economiei americane. În plus față de Washington, D.C. și New York City, alte orașe importante din SUA includ Los Angeles, Chicago și Houston, fiecare având caracteristici geografice și culturale distincte. SUA este o destinație turistică populară datorită diversității sale culturale, a parcurilor naționale și a orașelor vibrante. Clima SUA variază considerabil de la nord la sud și de la est la vest, cu regiuni temperate, deșertice și subtropicale. În nord-est, iernile sunt reci și zăpădite, în timp ce în sud-vest verile sunt fierbinți și uscate. SUA include și mai multe teritorii în afara continentului principal, cum ar fi Hawaii și Puerto Rico, care oferă peisaje spectaculoase și culturi diverse. SUA este cunoscută pentru diversitatea sa culinară, cu influențe din întreaga lume, inclusiv mâncăruri tradiționale precum burgeri, pizza și friptură, dar și specialități regionale cum ar fi gumbo din Louisiana și sushi din California',
          'historyLesson': 'Înaintea colonizării europene, teritoriul actual al Statelor Unite era locuit de populații amerindiene diverse, care aveau culturi și societăți variate. Cu sosirea exploratorilor europeni în secolul al XVI-lea, începe procesul de colonizare a Americii de Nord. În secolul al XVIII-lea, coloniile britanice din America de Nord au luptat pentru independență împotriva coroanei britanice. Declarația de Independență a fost adoptată în 1776, marcând începutul Statelor Unite ale Americii ca națiune independentă. În secolul al XIX-lea, Statele Unite au experimentat o extindere teritorială masivă spre vest, într-un proces cunoscut sub numele de "Manifest Destiny". Însă, această expansiune a alimentat tensiuni între statele slave și cele non-slave, culminând în Războiul Civil American (1861-1865), care a fost luptat între statele care susțineau sclavia și cele care se opuneau ei. După Războiul Civil, Statele Unite au cunoscut o perioadă de industrializare rapidă și dezvoltare economică. În secolul al XX-lea, ele au devenit una dintre cele mai puternice și influente națiuni din lume, jucând un rol major în ambele războaie mondiale și devenind un pilon al economiei globale. Prohibiția a fost perioada în care producția, distribuția și consumul de alcool au fost interzise prin lege în întreaga țară, între anii 1920 și 1933. Această politică a fost implementată prin adoptarea celui de-al 18-lea amendament la Constituția SUA în 1919 și prin Legea Volstead. În prezent, Statele Unite rămân o putere economică și militară dominantă, dar se confruntă cu o serie de provocări interne și internaționale, inclusiv inegalitatea economică, schimbările climatice și tensiunile geopolitice. Cu toate acestea, diversitatea sa culturală, inovația și angajamentul față de valorile democratice continuă să definească națiunea și să inspire lumea.',
          'geography_completed': 0,
          'history_completed': 0,
          'doesExist': 1
        });

        await db.insert('country', {
          'name': 'Italy',
          'geographyLesson': 'Italia este situată în partea de sud a Europei, având granițe cu Franța la nord-vest, Elveția și Austria la nord și nord-est, Slovenia la nord-est și Croația la est. Capitala sa, Roma, este cel mai mare oraș și centrul cultural, istoric și politic al țării. Cu o populație de aproximativ 60 de milioane de locuitori, Italia este una dintre cele mai populate țări din Europa. Teritoriul său este caracterizat de o varietate geografică remarcabilă, cuprinzând munți, câmpii și țărmuri maritime. Munții Alpi formează granița nordică a țării, oferind peisaje alpine spectaculoase și oportunități pentru sporturi de iarnă. În centrul Italiei se află o serie de lanțuri muntoase, cum ar fi Apeninii, care se întind pe aproape toată lungimea peninsulei italiene și influențează climatul și geografia regiunilor respective. De asemenea, Italia are o rețea extinsă de râuri, precum Po, Tevere și Arno, care contribuie la fertilitatea câmpiilor și la dezvoltarea agriculturii. Un aspect geografic semnificativ al Italiei este Peninsula Italică, care se întinde în Marea Mediterană și este înconjurată de mai multe insule, cum ar fi Sicilia și Sardinia. Această poziție strategică a favorizat comerțul maritim și a adus influențe culturale diverse de-a lungul istoriei. Vezuviul este un vulcan activ situat în apropierea orașului Napoli din regiunea Campania din sudul Italiei. Este cunoscut în special pentru erupția sa devastatoare din anul 79 d.Hr., care a dus la distrugerea orașelor Pompei și Herculaneum. Acest vulcan este considerat unul dintre cei mai periculoși din lume din cauza populației dense și a impactului potențial asupra orașelor înconjurătoare în cazul unei noi erupții majore. În plus față de Roma, alte orașe importante din Italia includ Milano, Napoli, Florența și Veneția, fiecare având caracteristici geografice și culturale distincte. Italia este o destinație turistică populară datorită orașelor istorice, artei și arhitecturii sale bogate și peisajelor naturale variate. Cel mai înalt vârf din Italia este vârful Mont Blanc din Alpii Graiei, având o altitudine de 4.808 metri. Acest vârf glaciar oferă oportunități pentru alpinism și turism ecologic într-un mediu spectaculos. Italia este cunoscută în întreaga lume pentru producția sa bogată și variată de vinuri. Regiunea Toscana, în special, este renumită pentru vinul Chianti, un vin roșu sec. Clima Italiei variază de la mediteraneană în sud la temperată în nord, iar influențele oceanice și continentale se resimt în diferite regiuni ale țării. Această diversitate climatică oferă condiții favorabile pentru o gamă largă de activități în aer liber și agricultură. Italia include și mai multe insule importante, cum ar fi Sicilia și Sardinia, care au peisaje spectaculoase și o istorie bogată.',
          'historyLesson': 'În sudul Europei, se găsește o țară cu o istorie bogată și variată - Italia. În antichitate, peninsula italiană era locuită de diverse popoare precum etruscii, grecii și samniții, dar a devenit cunoscută mai ales prin cucerirea romană, care a dus la formarea Republicii Romane și apoi a Imperiului Roman. În Evul Mediu, Italia a fost divizată în numeroase state și republici independente, precum Republica Venețiană, Ducatul Milano, Republica Florentină și Statul Papal. Această perioadă a fost marcată de competiția între aceste entități pentru putere și control.În timpul Renașterii, Italia a fost epicentrul unui puternic mișcări culturale și artistice, marcând o perioadă de înflorire în domenii precum arta, arhitectura și literatura. Personalități precum Leonardo da Vinci, Michelangelo și Dante Alighieri au contribuit la reputația de centru cultural al Europei al Italiei. În secolele XVIII și XIX, Italia a fost scena unor conflicte și transformări politice importante, incluzând războaiele napoleoniene și procesul de unificare a Italiei sub conducerea lui Giuseppe Garibaldi și a lui Camillo Benso, conte de Cavour. Acest proces a dus la formarea statului italian modern, care a fost completat în 1871, când Roma a devenit capitala Italiei. În secolul al XX-lea, Italia a fost implicată în ambele războaie mondiale. În Primul Război Mondial, Italia s-a alăturat Puterilor Aliate în 1915, în speranța că ar obține teritorii promițătoare de la Puterile Centrale. Luptele au fost concentrate în principal pe frontul italian în Alpii Orientali și au implicat confruntări dure cu trupele austro-ungare. După război, Italia a fost dezamăgită de rezultatele Conferinței de Pace de la Paris, care nu a satisfăcut așteptările sale teritoriale. Această perioadă a generat nemulțumiri și instabilitate politică în Italia, pregătind terenul pentru ascensiunea fascismului. În 1957, Italia a fost una dintre țările fondatoare ale Comunității Economice Europene (CEE), precursorul Uniunii Europene, semnând Tratatul de la Roma. Astfel, Italia a fost implicată încă de la început în procesul de integrare europeană. Italia este cunoscută pentru peisajele sale pitorești, patrimoniul său istoric și cultural bogat, bucătăria sa renumită și contribuțiile sale la domenii precum moda și designul.',
          'geography_completed': 0,
          'history_completed': 0,
          'doesExist': 1
        });

        await db.insert('country', {
          'name': 'China',
          'geographyLesson': 'China, una dintre cele mai mari țări din lume ca suprafață și populație, este situată în Asia de Est, având granițe cu mai multe țări importante precum Rusia și Mongolia la nord, India, Nepal și Bhutan la sud, și Coreea de Nord, Vietnam și Laos la sud-est. Capitala sa, Beijing, este un centru cultural, economic și politic major, iar Shanghai este unul dintre cele mai mari orașe din lume, fiind un important centru financiar și comercial. Teritoriul Chinei este caracterizat de o varietate geografică impresionantă, cuprinzând munți, câmpii și regiuni de coastă. La vest, munții Himalaya formează o graniță naturală, iar la sud-vest se găsesc Munții Tian, care includ cel mai înalt vârf din China, vârful Everest. În partea de nord se află Munții Altai, iar la est se întind Munții Qinling. Aceste lanțuri muntoase influențează în mod semnificativ clima și geografia țării. Râurile majore, precum Yangtze și Fluviul Galben, traversează China, furnizând apă pentru irigații și transportul naval. Yangtze este al treilea cel mai lung râu din lume și are o importanță culturală și economică semnificativă, cu orașe importante precum Chongqing și Wuhan aflate pe malurile sale. O caracteristică geografică distinctivă a Chinei o reprezintă Marele Zid, o structură masivă de apărare construită de-a lungul secolelor pentru a proteja imperiul chinez împotriva invaziilor din nord. Acest monument istoric impresionant este o atracție turistică de prim rang și simbolizează bogata istorie și cultura a Chinei. China are și o coastă extinsă, cu orașe portuare importante precum Hong Kong, Guangzhou și Shenzhen. Aceste regiuni au jucat un rol crucial în dezvoltarea comerțului maritim și a economiei chineze moderne. În plus față de Beijing și Shanghai, alte orașe importante din China includ Guangzhou, Chengdu și Xi an, fiecare având caracteristici geografice și culturale distincte. China este o destinație turistică populară datorită patrimoniului său cultural bogat, precum și peisajelor naturale variate, cum ar fi Muntele Huangshan și Yangshuo Karst. Clima Chinei variază considerabil de la nord la sud și de la est la vest, cu regiuni temperate, subtropicale și tropicale. În nord, iernile sunt reci și uscate, în timp ce în sud verile sunt calde și umede. China include și mai multe regiuni autonome, cum ar fi Tibetul și Xinjiang, care au peisaje spectaculoase și o diversitate culturală remarcabilă. China este, de asemenea, renumită pentru bogata sa istorie culinară și diversitatea sa gastronomică, care variază de la mâncăruri picante din Sichuan la delicatese din Shanghai și fructe de mare din Canton.',
          'historyLesson': 'În Asia de Est, se află o țară cu o istorie străveche și fascinantă - China. De-a lungul mileniilor, China a fost locuită de diverse civilizații și culturi, iar evoluția sa istorică a fost marcată de momente semnificative și transformări profunde. În perioada antică, China a fost locuită de numeroase triburi și regate, dar unificarea sa sub o autoritate centrală a început sub Dinastia Qin, care a condus în secolul al III-lea î.Hr. Dinastia Qin a fost urmată de Dinastiile Han, Tang și Song, perioade de prosperitate și inovație în domenii precum știința, tehnologia și arta. În Evul Mediu, China a cunoscut o serie de dinastii și imperii, precum Yuan (fondată de mongoli), Ming și Qing. În timpul dinastiei Tang și Song, China a fost un centru comercial și cultural important, fiind cunoscută pentru invențiile sale tehnologice precum tiparul mobil și busola. În secolul al XIX-lea, China a fost afectată de agresiunea imperialistă și influența puterilor străine, ceea ce a dus la războaiele opiumului și la Tratatul de la Nanking, care a deschis porțile Chinei pentru comerțul străin și a impus concesiuni teritoriale. Această perioadă de slăbiciune a statului chinez a culminat cu Revolta boxerilor și căderea dinastiei Qing. În secolul XX, China a trecut printr-o serie de schimbări politice și sociale semnificative. Revoluția din 1911 a condus la căderea sistemului imperial și la fondarea Republicii Chineze sub conducerea lui Sun Yat-sen. În 1949, Partidul Comunist Chinez, condus de Mao Zedong, a proclamat înființarea Republicii Populare Chineze, punând capăt unui secol de dominație străină și instabilitate internă. De-a lungul deceniilor, China a traversat reforme economice și sociale masive sub conducerea lui Deng Xiaoping și a succesorilor săi, transformându-se dintr-o economie planificată într-una orientată către piață și devenind una dintre cele mai mari puteri economice din lume. Astăzi, China este cunoscută pentru tehnologia sa avansată, economia sa în creștere rapidă și influența sa globală în domenii precum comerțul internațional și politica mondială. Pe lângă aceste aspecte, China are o istorie culturală bogată, cu contribuții semnificative în domenii precum filosofia, literatura, arta și arhitectura.',
          'geography_completed': 0,
          'history_completed': 0,
          'doesExist': 1
        });

        await db.insert('country', {
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
        });

        await db.insert('question', {
          'country': 'Spain',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'Care este capitala Spaniei și cel mai mare oraș al țării?',
          'answer': answer1,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Spain',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'Care lanț muntos formează granița nordică a Spaniei?',
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
          'question_text': 'Care dintre următoarele orașe nu este situat în Spania?',
          'answer': answer4,
          'correct_answer': 1,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Spain',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'Care dintre următoarele insule nu aparține Spaniei?',
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
          'question_text': 'Care este cea mai mare insulă din Insulele Canare ca suprafață?',
          'answer': answer7,
          'correct_answer': 2,
          'type': 1
        });

        await db.insert('question', {
          'country': 'Spain',
          'subject': 1,
          'difficulty': 1,
          'question_text': 'Care este râul principal care străbate capitala Spaniei?',
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

          // Copy the data from the old table to the new one

          // Delete the old table
          /*await db.execute('DROP TABLE $table');
          await db.execute('DROP TABLE countries');

          // Rename the new table to the old one's name
          await db.execute('ALTER TABLE new_table RENAME TO $table');
          */
        }
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

  Future<int> deleteCountry(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

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
