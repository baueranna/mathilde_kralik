// Array of link data with resource
const links = [
  {
    url: "https://oe1.orf.at/programm/20210826/648983/Mathilde-Kralik",
    heading: "Mathilde Kralik",
    description: "Sie übersprang den ersten Jahrgang der Kompositionsklasse, sie gewann Auszeichnungen vor ihren berühmten Klassenkollegen Gustav Mahler und Hans Rott. Mathilde Kralik gelang es sogar ihre Werke nicht nur im Club der Wiener Musikerinnen aufführen zu lassen, sondern auch im Großen Musikvereinssaal.",
    resource: "OE1",
  },
  {
    url: "https://www.geschichtewiki.wien.gv.at/Mathilde_von_Kralik",
    heading: "Mathilde von Kralik",
    description: "Mathilde Kralik, * 3. Dezember 1857 Linz, † 8. März 1944 Wien, Komponistin.",
    resource: "Wien GeschichteWiki",
  },
  {
    url: "https://www.swr.de/swrkultur/musik-klassik/portraet-mathilde-kralik-100.html",
    heading: "Komponierte über 250 Werke: Die Bruckner-Schülerin Mathilde Kralik",
    description: "Mathilde Kralik Ritterin von Meyrswalden: So heißt die österreichische Komponistin mit vollem Namen. Über 250 Werke hat sie geschrieben. Vor 80 Jahren ist die Bruckner-Schülerin in Wien gestorben – am 3. Dezember wäre ihr Geburtstag gewesen.",
    resource: "SWR Kultur",
  },
  {
    url: "https://de.wikipedia.org/wiki/Mathilde_Kralik",
    heading: "Mathilde Kralik",
    description: "Mathilde Kralik (bis 1919 Mathilde Aloisia Kralik von Meyrswalden; * 3. Dezember 1857 in Linz; † 8. März 1944 in Wien) war eine österreichische Komponistin aus der Familie Kralik von Meyrswalden.",
    resource: "Wikipedia",
  },
  {
    url: "https://www.br-klassik.de/themen/klassik-entdecken/was-heute-geschah-gustav-mahler-kompositionswettbewerb-mathilde-kralik-100.html",
    heading: "Wer gewinnt den Kompositionswettbewerb?",
    description: "Wien, 2. Juli 1878. Die Sommersonne brennt vom Himmel. Über den Hof des Wiener Konservatoriums eilt ein junger Mann mit auffällig wippendem Gang. Unter dem Arm klemmt ein Packen Noten, sein Gesichtsausdruck ist angespannt. Kein Wunder: Der Concurs der Ausbildungsschule für Komposition steht unmittelbar bevor, die große Abschlussprüfung, und er, Gustav Mahler, 17 Jahre alt, will der Jury beweisen, dass er einen Ersten Preis verdient hat.",
    resource: "BR Klassik",
  },
  {
    url: "https://kralikklassik.de/mathilde-kralik-von-meyrswalden/",
    heading: "Mathilde Kralik von Meyrswalden",
    description: "Mathilde Kralik von Meyrswalden (1857-1944) war eine österreichische Komponistin  der Spätromantik.",
    resource: "Kralik Klassik",
  },
  {
    url: "hhttps://austria-forum.org/af/AustriaWiki/Mathilde_Kralik",
    heading: "Mathilde Kralik",
    description: "Mathilde Kralik (bis 1919 Mathilde Aloisia Kralik von Meyrswalden; * 3. Dezember 1857 in Linz; † 8. März 1944 in Wien) war eine österreichische Komponistin aus der Familie Kralik von Meyrswalden.",
    resource: "Austria-Forum",
  },
  {
    url: "https://www.fembio.org/biographie.php/frau/biographie/mathilde-kralik-von-meyerswalden/",
    heading: "Mathilde Kralik von Meyrswalden",
    description: "Mathilde Kraliks Eltern, vermögende Glasindustrielle, waren sehr musikliebend und sorgten für eine hervorragende musikalische Ausbildung ihrer Tochter, unter anderem studierte sie bei Epstein Klavier, bei Bruckner Kontrapunkt und bei Krenn Komposition.",
    resource: "Fem Bio",
  },
  {
    url: "https://mugi.hfmt-hamburg.de/receive/mugi_person_00000448#Forschungsbedarf",
    heading: "Mathilde Kralik von Meyrswalden",
    description: "Mathilde Kralik von Meyrswalden war eine Komponistin der Spätromantik. Einen Großteil ihrer Kompositionen haben religiöse Themen als Grundlage, sie war streng gläubige Katholikin. Ihr Weltbild wurde von Kaisertreue zum Staate Österreich geprägt. Obwohl als unabhängige Künstlerin in einer Liebesbeziehung mit einer Frau lebend, vertrat sie nach außen hin konservative Werte.",
    resource: "Musik und Gender im Internet",
  },
  {
	url: "https://www1.wdr.de/mediathek/audio/wdr3/komponistinnen/audio-mathilde-kralik-bruckner-schuelerin-und-freigeist-100.html",
	heading: "Mathilde Kralik: Bruckner-Schülerin und Freigeist",
	description: "Mathilde Kralik von Mayerswalden war eine Schülerin von Anton Bruckner und lernte in Wien gemeinsam mit Gustav Mahler. Wer war diese Frau, die es wagte, Opern und Sinfonien zu schreiben und die heute ganz vergessen ist?",
	resource: "wdr",
  },
  
];

// Function to create grid items
function createGridItem(link) {
  const gridItem = document.createElement("div");
  gridItem.className = "grid-item";

  // Heading
  const heading = document.createElement("h3");
  heading.textContent = link.heading;

  // Resource
  const resource = document.createElement("p");
  resource.className = "resource";
  resource.textContent = `${link.resource}`;

  // Description
  const description = document.createElement("p");
  description.textContent = link.description;

  // Link
  const linkElement = document.createElement("a");
  linkElement.href = link.url;
  linkElement.textContent = "Weiterlesen";
  linkElement.target = "_blank";

  // Append all elements to the grid item
  gridItem.appendChild(heading);
  gridItem.appendChild(resource); 
  gridItem.appendChild(description);
  gridItem.appendChild(linkElement);

  return gridItem;
}

// Populate the grid container
const gridContainer = document.getElementById("grid-container");
links.forEach(link => {
  const gridItem = createGridItem(link);
  gridContainer.appendChild(gridItem);
});