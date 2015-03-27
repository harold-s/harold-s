# -*- coding: utf-8 -*-
require 'json'

#Copy of Javascript Array from https://github.com/Bluefieldscom/intl-tel-input/blob/master/build/js/intlTelInput.js
allCountries = [ [ "Afghanistan (‫افغانستان‬‎)", "af", "93" ], [ "Albania (Shqipëri)", "al", "355" ], [ "Algeria (‫الجزائر‬‎)", "dz", "213" ], [ "American Samoa", "as", "1684" ], [ "Andorra", "ad", "376" ], [ "Angola", "ao", "244" ], [ "Anguilla", "ai", "1264" ], [ "Antigua and Barbuda", "ag", "1268" ], [ "Argentina", "ar", "54" ], [ "Armenia (Հայաստան)", "am", "374" ], [ "Aruba", "aw", "297" ], [ "Australia", "au", "61" ], [ "Austria (Österreich)", "at", "43" ], [ "Azerbaijan (Azərbaycan)", "az", "994" ], [ "Bahamas", "bs", "1242" ], [ "Bahrain (‫البحرين‬‎)", "bh", "973" ], [ "Bangladesh (বাংলাদেশ)", "bd", "880" ], [ "Barbados", "bb", "1246" ], [ "Belarus (Беларусь)", "by", "375" ], [ "Belgium (België)", "be", "32" ], [ "Belize", "bz", "501" ], [ "Benin (Bénin)", "bj", "229" ], [ "Bermuda", "bm", "1441" ], [ "Bhutan (འབྲུག)", "bt", "975" ], [ "Bolivia", "bo", "591" ], [ "Bosnia and Herzegovina (Босна и Херцеговина)", "ba", "387" ], [ "Botswana", "bw", "267" ], [ "Brazil (Brasil)", "br", "55" ], [ "British Indian Ocean Territory", "io", "246" ], [ "British Virgin Islands", "vg", "1284" ], [ "Brunei", "bn", "673" ], [ "Bulgaria (България)", "bg", "359" ], [ "Burkina Faso", "bf", "226" ], [ "Burundi (Uburundi)", "bi", "257" ], [ "Cambodia (កម្ពុជា)", "kh", "855" ], [ "Cameroon (Cameroun)", "cm", "237" ], [ "Canada", "ca", "1", 1, [ "204", "226", "236", "249", "250", "289", "306", "343", "365", "387", "403", "416", "418", "431", "437", "438", "450", "506", "514", "519", "548", "579", "581", "587", "604", "613", "639", "647", "672", "705", "709", "742", "778", "780", "782", "807", "819", "825", "867", "873", "902", "905" ]], [ "Cape Verde (Kabu Verdi)", "cv", "238" ], [ "Caribbean Netherlands", "bq", "599", 1 ], [ "Cay Islands", "ky", "1345" ], [ "Central African Republic (République centrafricaine)", "cf", "236" ], [ "Chad (Tchad)", "td", "235" ], [ "Chile", "cl", "56" ], [ "China (中国)", "cn", "86" ], [ "Colombia", "co", "57" ], [ "Comoros (‫جزر القمر‬‎)", "km", "269" ], [ "Congo (DRC) (Jamhuri ya Kidemokrasia ya Kongo)", "cd", "243" ], [ "Congo (Republic) (Congo-Brazzaville)", "cg", "242" ], [ "Cook Islands", "ck", "682" ], [ "Costa Rica", "cr", "506" ], [ "Côte d’Ivoire", "ci", "225" ], [ "Croatia (Hrvatska)", "hr", "385" ], [ "Cuba", "cu", "53" ], [ "Curaçao", "cw", "599", 0 ], [ "Cyprus (Κύπρος)", "cy", "357" ], [ "Czech Republic (Česká republika)", "cz", "420" ], [ "Denmark (Danmark)", "dk", "45" ], [ "Djibouti", "dj", "253" ], [ "Dominica", "dm", "1767" ], [ "Dominican Republic (República Dominicana)", "do", "1", 2, [ "809", "829", "849" ]], [ "Ecuador", "ec", "593" ], [ "Egypt (‫مصر‬‎)", "eg", "20" ], [ "El Salvador", "sv", "503" ], [ "Equatorial Guinea (Guinea Ecuatorial)", "gq", "240" ], [ "Eritrea", "er", "291" ], [ "Estonia (Eesti)", "ee", "372" ], [ "Ethiopia", "et", "251" ], [ "Falkland Islands (Islas Malvinas)", "fk", "500" ], [ "Faroe Islands (Føroyar)", "fo", "298" ], [ "Fiji", "fj", "679" ], [ "Finland (Suomi)", "fi", "358" ], [ "France", "fr", "33" ], [ "French Guiana (Guyane française)", "gf", "594" ], [ "French Polynesia (Polynésie française)", "pf", "689" ], [ "Gabon", "ga", "241" ], [ "Gambia", "gm", "220" ], [ "Georgia (საქართველო)", "ge", "995" ], [ "Germany (Deutschland)", "de", "49" ], [ "Ghana (Gaana)", "gh", "233" ], [ "Gibraltar", "gi", "350" ], [ "Greece (Ελλάδα)", "gr", "30" ], [ "Greenland (Kalaallit Nunaat)", "gl", "299" ], [ "Grenada", "gd", "1473" ], [ "Guadeloupe", "gp", "590", 0 ], [ "Guam", "gu", "1671" ], [ "Guatemala", "gt", "502" ], [ "Guinea (Guinée)", "gn", "224" ], [ "Guinea-Bissau (Guiné Bissau)", "gw", "245" ], [ "Guyana", "gy", "592" ], [ "Haiti", "ht", "509" ], [ "Honduras", "hn", "504" ], [ "Hong Kong (香港)", "hk", "852" ], [ "Hungary (Magyarország)", "hu", "36" ], [ "Iceland (Ísland)", "is", "354" ], [ "India (भारत)", "in", "91" ], [ "Indonesia", "id", "62" ], [ "Iran (‫ایران‬‎)", "ir", "98" ], [ "Iraq (‫العراق‬‎)", "iq", "964" ], [ "Ireland", "ie", "353" ], [ "Israel (‫ישראל‬‎)", "il", "972" ], [ "Italy (Italia)", "it", "39", 0 ], [ "Jamaica", "jm", "1876" ], [ "Japan (日本)", "jp", "81" ], [ "Jordan (‫الأردن‬‎)", "jo", "962" ], [ "Kazakhstan (Казахстан)", "kz", "7", 1 ], [ "Kenya", "ke", "254" ], [ "Kiribati", "ki", "686" ], [ "Kuwait (‫الكويت‬‎)", "kw", "965" ], [ "Kyrgyzstan (Кыргызстан)", "kg", "996" ], [ "Laos (ລາວ)", "la", "856" ], [ "Latvia (Latvija)", "lv", "371" ], [ "Lebanon (‫لبنان‬‎)", "lb", "961" ], [ "Lesotho", "ls", "266" ], [ "Liberia", "lr", "231" ], [ "Libya (‫ليبيا‬‎)", "ly", "218" ], [ "Liechtenstein", "li", "423" ], [ "Lithuania (Lietuva)", "lt", "370" ], [ "Luxembourg", "lu", "352" ], [ "Macau (澳門)", "mo", "853" ], [ "Macedonia (FYROM) (Македонија)", "mk", "389" ], [ "Madagascar (Madagasikara)", "mg", "261" ], [ "Malawi", "mw", "265" ], [ "Malaysia", "my", "60" ], [ "Maldives", "mv", "960" ], [ "Mali", "ml", "223" ], [ "Malta", "mt", "356" ], [ "Marshall Islands", "mh", "692" ], [ "Martinique", "mq", "596" ], [ "Mauritania (‫موريتانيا‬‎)", "mr", "222" ], [ "Mauritius (Moris)", "mu", "230" ], [ "Mexico (México)", "mx", "52" ], [ "Micronesia", "fm", "691" ], [ "Moldova (Republica Moldova)", "md", "373" ], [ "Monaco", "mc", "377" ], [ "Mongolia (Монгол)", "mn", "976" ], [ "Montenegro (Crna Gora)", "me", "382" ], [ "Montserrat", "ms", "1664" ], [ "Morocco (‫المغرب‬‎)", "ma", "212" ], [ "Mozambique (Moçambique)", "mz", "258" ], [ "Myanmar (Burma) (မြန်မာ)", "mm", "95" ], [ "Namibia (Namibië)", "na", "264" ], [ "Nauru", "nr", "674" ], [ "Nepal (नेपाल)", "np", "977" ], [ "Netherlands (Nederland)", "nl", "31" ], [ "New Caledonia (Nouvelle-Calédonie)", "nc", "687" ], [ "New Zealand", "nz", "64" ], [ "Nicaragua", "ni", "505" ], [ "Niger (Nijar)", "ne", "227" ], [ "Nigeria", "ng", "234" ], [ "Niue", "nu", "683" ], [ "Norfolk Island", "nf", "672" ], [ "North Korea (조선 민주주의 인민 공화국)", "kp", "850" ], [ "Northern Mariana Islands", "mp", "1670" ], [ "Norway (Norge)", "no", "47" ], [ "Oman (‫عُمان‬‎)", "om", "968" ], [ "Pakistan (‫پاکستان‬‎)", "pk", "92" ], [ "Palau", "pw", "680" ], [ "Palestine (‫فلسطين‬‎)", "ps", "970" ], [ "Panama (Panamá)", "pa", "507" ], [ "Papua New Guinea", "pg", "675" ], [ "Paraguay", "py", "595" ], [ "Peru (Perú)", "pe", "51" ], [ "Philippines", "ph", "63" ], [ "Poland (Polska)", "pl", "48" ], [ "Portugal", "pt", "351" ], [ "Puerto Rico", "pr", "1", 3, [ "787", "939" ]], [ "Qatar (‫قطر‬‎)", "qa", "974" ], [ "Réunion (La Réunion)", "re", "262" ], [ "Romania (România)", "ro", "40" ], [ "Russia (Россия)", "ru", "7", 0 ], [ "Rwanda", "rw", "250" ], [ "Saint Barthélemy (Saint-Barthélemy)", "bl", "590", 1 ], [ "Saint Helena", "sh", "290" ], [ "Saint Kitts and Nevis", "kn", "1869" ], [ "Saint Lucia", "lc", "1758" ], [ "Saint Martin (Saint-Martin (partie française))", "mf", "590", 2 ], [ "Saint Pierre and Miquelon (Saint-Pierre-et-Miquelon)", "pm", "508" ], [ "Saint Vincent and the Grenadines", "vc", "1784" ], [ "Samoa", "ws", "685" ], [ "San Marino", "sm", "378" ], [ "São Tomé and Príncipe (São Tomé e Príncipe)", "st", "239" ], [ "Saudi Arabia (‫المملكة العربية السعودية‬‎)", "sa", "966" ], [ "Senegal (Sénégal)", "sn", "221" ], [ "Serbia (Србија)", "rs", "381" ], [ "Seychelles", "sc", "248" ], [ "Sierra Leone", "sl", "232" ], [ "Singapore", "sg", "65" ], [ "Sint Maarten", "sx", "1721" ], [ "Slovakia (Slovensko)", "sk", "421" ], [ "Slovenia (Slovenija)", "si", "386" ], [ "Solomon Islands", "sb", "677" ], [ "Somalia (Soomaaliya)", "so", "252" ], [ "South Africa", "za", "27" ], [ "South Korea (대한민국)", "kr", "82" ], [ "South Sudan (‫جنوب السودان‬‎)", "ss", "211" ], [ "Spain (España)", "es", "34" ], [ "Sri Lanka (ශ්‍රී ලංකාව)", "lk", "94" ], [ "Sudan (‫السودان‬‎)", "sd", "249" ], [ "Suriname", "sr", "597" ], [ "Swaziland", "sz", "268" ], [ "Sweden (Sverige)", "se", "46" ], [ "Switzerland (Schweiz)", "ch", "41" ], [ "Syria (‫سوريا‬‎)", "sy", "963" ], [ "Taiwan (台灣)", "tw", "886" ], [ "Tajikistan", "tj", "992" ], [ "Tanzania", "tz", "255" ], [ "Thailand (ไทย)", "th", "66" ], [ "Timor-Leste", "tl", "670" ], [ "Togo", "tg", "228" ], [ "Tokelau", "tk", "690" ], [ "Tonga", "to", "676" ], [ "Trinidad and Tobago", "tt", "1868" ], [ "Tunisia (‫تونس‬‎)", "tn", "216" ], [ "Turkey (Türkiye)", "tr", "90" ], [ "Turkmenistan", "tm", "993" ], [ "Turks and Caicos Islands", "tc", "1649" ], [ "Tuvalu", "tv", "688" ], [ "U.S. Virgin Islands", "vi", "1340" ], [ "Uganda", "ug", "256" ], [ "Ukraine (Україна)", "ua", "380" ], [ "United Arab Emirates (‫الإمارات العربية المتحدة‬‎)", "ae", "971" ], [ "United Kingdom", "gb", "44" ], [ "United States", "us", "1", 0 ], [ "Uruguay", "uy", "598" ], [ "Uzbekistan (Oʻzbekiston)", "uz", "998" ], [ "Vanuatu", "vu", "678" ], [ "Vatican City (Città del Vaticano)", "va", "39", 1 ], [ "Venezuela", "ve", "58" ], [ "Vietnam (Việt Nam)", "vn", "84" ], [ "Wallis and Futuna", "wf", "681" ], [ "Yemen (‫اليمن‬‎)", "ye", "967" ], [ "Zambia", "zm", "260" ], [ "Zimbabwe", "zw", "263" ]]

#Liste of French names for country (ISO 3166-1 alpha-2) from http://www.buddyweb.fr/extensions/
country_names_french = {"af"=>"Afghanistan", "za"=>"Afrique du Sud", "ax"=>"Åland", "al"=>"Albanie", "dz"=>"Algérie", "de"=>"Allemagne", "ad"=>"Andorre", "ao"=>"Angola", "ai"=>"Anguilla", "aq"=>"Antarctique", "ag"=>"Antigua-et-Barbuda", "sa"=>"Arabie saoudite", "ar"=>"Argentine", "am"=>"Arménie", "aw"=>"Aruba", "au"=>"Australie", "at"=>"Autriche", "az"=>"Azerbaïdjan", "bs"=>"Bahamas", "bh"=>"Bahreïn", "bd"=>"Bangladesh", "bb"=>"Barbade", "by"=>"Biélorussie", "be"=>"Belgique", "bz"=>"Belize", "bj"=>"Bénin", "bm"=>"Bermudes", "bt"=>"Bhoutan", "bo"=>"Bolivie", "bq"=>"Bonaire, Saint-Eustache et Saba", "ba"=>"Bosnie-Herzégovine", "bw"=>"Botswana", "bv"=>"Île Bouvet", "br"=>"Brésil", "bn"=>"Brunei", "bg"=>"Bulgarie", "bf"=>"Burkina Faso", "bi"=>"Burundi", "ky"=>"Îles Caïmans", "kh"=>"Cambodge", "cm"=>"Cameroun", "ca"=>"Canada", "cv"=>"Cap-Vert", "cf"=>"République centrafricaine", "cl"=>"Chili", "cn"=>"Chine", "cx"=>"Île Christmas", "cy"=>"Chypre (pays)", "cc"=>"Îles Cocos", "co"=>"Colombie", "km"=>"Comores", "cg"=>"République du Congo / (Congo)", "cd"=>"République démocratique du Congo / (République démocratique du Congo)", "ck"=>"Îles Cook", "kr"=>"Corée du Sud", "kp"=>"Corée du Nord", "cr"=>"Costa Rica", "ci"=>"Côte d’Ivoire", "hr"=>"Croatie", "cu"=>"Cuba", "cw"=>"Curaçao", "dk"=>"Danemark", "dj"=>"Djibouti", "do"=>"République dominicaine", "dm"=>"Dominique", "eg"=>"Égypte", "sv"=>"Salvador", "ae"=>"Émirats arabes unis", "ec"=>"Équateur", "er"=>"Érythrée", "es"=>"Espagne", "ee"=>"Estonie", "us"=>"États-Unis", "et"=>"Éthiopie", "fk"=>"Îles Malouines", "fo"=>"Îles Féroé", "fj"=>"Fidji", "fi"=>"Finlande", "fr"=>"France", "ga"=>"Gabon", "gm"=>"Gambie", "ge"=>"Géorgie (pays)", "gs"=>"Géorgie du Sud-et-les Îles Sandwich du Sud", "gh"=>"Ghana", "gi"=>"Gibraltar", "gr"=>"Grèce", "gd"=>"Grenade (pays)", "gl"=>"Groenland", "gp"=>"Guadeloupe", "gu"=>"Guam", "gt"=>"Guatemala", "gg"=>"Guernesey", "gn"=>"Guinée", "gw"=>"Guinée-Bissau", "gq"=>"Guinée équatoriale", "gy"=>"Guyana", "gf"=>"Guyane", "ht"=>"Haïti", "hm"=>"Îles Heard-et-MacDonald", "hn"=>"Honduras", "hk"=>"Hong Kong", "hu"=>"Hongrie", "im"=>"Île de Man", "um"=>"Îles mineures éloignées des États-Unis", "vg"=>"Îles Vierges britanniques", "vi"=>"Îles Vierges des États-Unis", "in"=>"Inde", "id"=>"Indonésie", "ir"=>"Iran", "iq"=>"Irak", "ie"=>"Irlande (pays)", "is"=>"Islande", "il"=>"Israël", "it"=>"Italie", "jm"=>"Jamaïque", "jp"=>"Japon", "je"=>"Jersey", "jo"=>"Jordanie", "kz"=>"Kazakhstan", "ke"=>"Kenya", "kg"=>"Kirghizistan", "ki"=>"Kiribati", "kw"=>"Koweït", "la"=>"Laos", "ls"=>"Lesotho", "lv"=>"Lettonie", "lb"=>"Liban", "lr"=>"Liberia", "ly"=>"Libye", "li"=>"Liechtenstein", "lt"=>"Lituanie", "lu"=>"Luxembourg (pays)", "mo"=>"Macao", "mk"=>"Macédoine (pays)", "mg"=>"Madagascar", "my"=>"Malaisie", "mw"=>"Malawi", "mv"=>"Maldives", "ml"=>"Mali", "mt"=>"Malte", "mp"=>"Îles Mariannes du Nord", "ma"=>"Maroc", "mh"=>"Marshall (pays)", "mq"=>"Martinique", "mu"=>"Maurice (pays)", "mr"=>"Mauritanie", "yt"=>"Mayotte", "mx"=>"Mexique", "fm"=>"Micronésie (pays)", "md"=>"Moldavie", "mc"=>"Monaco", "mn"=>"Mongolie", "me"=>"Monténégro", "ms"=>"Montserrat", "mz"=>"Mozambique", "mm"=>"Birmanie", "na"=>"Namibie", "nr"=>"Nauru", "np"=>"Népal", "ni"=>"Nicaragua", "ne"=>"Niger", "ng"=>"Nigeria", "nu"=>"Niue", "nf"=>"Île Norfolk", "no"=>"Norvège", "nc"=>"Nouvelle-Calédonie", "nz"=>"Nouvelle-Zélande", "io"=>"Territoire britannique de l’océan Indien", "om"=>"Oman", "ug"=>"Ouganda", "uz"=>"Ouzbékistan", "pk"=>"Pakistan", "pw"=>"Palaos", "ps"=>"Autorité palestinienne", "pa"=>"Panama", "pg"=>"Papouasie-Nouvelle-Guinée", "py"=>"Paraguay", "nl"=>"Pays-Bas", "pe"=>"Pérou", "ph"=>"Philippines", "pn"=>"Îles Pitcairn", "pl"=>"Pologne", "pf"=>"Polynésie française", "pr"=>"Porto Rico", "pt"=>"Portugal", "qa"=>"Qatar", "re"=>"La Réunion", "ro"=>"Roumanie", "gb"=>"Royaume-Uni", "ru"=>"Russie", "rw"=>"Rwanda", "eh"=>"Sahara occidental", "bl"=>"Saint-Barthélemy", "kn"=>"Saint-Christophe-et-Niévès", "sm"=>"Saint-Marin", "mf"=>"Saint-Martin (Antilles françaises)", "sx"=>"Saint-Martin", "pm"=>"Saint-Pierre-et-Miquelon", "vc"=>"Saint-Vincent-et-les-Grenadines", "sh"=>"Sainte-Hélène, Ascension et Tristan da Cunha", "lc"=>"Sainte-Lucie", "sb"=>"Salomon", "ws"=>"Samoa", "as"=>"Samoa américaines", "st"=>"Sao Tomé-et-Principe", "sn"=>"Sénégal", "rs"=>"Serbie", "sc"=>"Seychelles", "sl"=>"Sierra Leone", "sg"=>"Singapour", "sk"=>"Slovaquie", "si"=>"Slovénie", "so"=>"Somalie", "sd"=>"Soudan", "ss"=>"Soudan du Sud", "lk"=>"Sri Lanka", "se"=>"Suède", "ch"=>"Suisse", "sr"=>"Suriname", "sj"=>"Svalbard et île Jan Mayen", "sz"=>"Swaziland", "sy"=>"Syrie", "tj"=>"Tadjikistan", "tw"=>"Taïwan / (République de Chine (Taïwan))", "tz"=>"Tanzanie", "td"=>"Tchad", "cz"=>"République tchèque", "tf"=>"Terres australes et antarctiques françaises", "th"=>"Thaïlande", "tl"=>"Timor oriental", "tg"=>"Togo", "tk"=>"Tokelau", "to"=>"Tonga", "tt"=>"Trinité-et-Tobago", "tn"=>"Tunisie", "tm"=>"Turkménistan", "tc"=>"Îles Turques-et-Caïques", "tr"=>"Turquie", "tv"=>"Tuvalu", "ua"=>"Ukraine", "uy"=>"Uruguay", "vu"=>"Vanuatu", "ve"=>"Venezuela", "vn"=>"Viêt Nam", "wf"=>"Wallis-et-Futuna", "ye"=>"Yémen", "zm"=>"Zambie", "zw"=>"Zimbabwe"}

#Different changes from buddyweb
#Vatican city was not in the list
country_names_french['va'] = 'État de la Cité du Vatican'
#République démocratique du Congo had a double translation
country_names_french['cd'] = 'République démocratique du Congo'

#Map on all countries to change the name to French
allCountries_fr = allCountries.map do |country|
  #If we find the country in country_names_french, we may change it
  if(!country_names_french.include?(country[1]))
    puts "Could not find country #{country[0]} (#{country[1]}) in list"
  else
    #We get the new countr name from buddyweb (but we remove the ' (pays)' string
    newCountryName = country_names_french[country[1]].gsub(' (pays)', '')
    #Regexp to detect English country name + potential local country name
    countryMatch = /^(.*?)(?: \(([^\(]*)\))?$/.match(country[0])
    if(!countryMatch)
      puts "Regexp did not decode country #{country[0]} (#{country[1]})"
    else
      englishCountryName = countryMatch[1]
      localCountryName = countryMatch[2]

      #Fix República da Guiné-Bissau
      if(country[1] == 'gw')
        localCountryName ='República da Guiné-Bissau'
      end

      #If localCountryName is different than tha newCountrName we may copy it to keep it (it is not in English or French)
      if(localCountryName && (localCountryName != newCountryName))
        newCountryName << " (#{localCountryName})"
        #If there were no localCountryName, it normaly means the name was in English, we add it as a localCountryName in French if it is different than the French name
      elsif(!localCountryName && (englishCountryName != newCountryName))
        newCountryName << " (#{englishCountryName})"
      end
      #We assume that if the country did not have parenthese, the name is in English or the writting is the same in English and the local language. We may add the parentheses
#      puts "Changing #{country[0]} => #{newCountryName}"
      country[0] = newCountryName
    end
  end

  [country[1], newCountryName]
end

puts 'var countryData = $.fn.intlTelInput.getCountryData();'
puts 'var hashCountryDataTranslation = ' << Hash[allCountries_fr].to_json << ';'
puts '$.each(countryData, function(i, country) {
  country.name = hashCountryDataTranslation[country.iso2];
});';
