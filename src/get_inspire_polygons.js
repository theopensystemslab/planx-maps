const axios = require("axios");
const cheerio = require("cheerio");
const fs = require("fs").promises;

async function go() {
  const { data } = await axios.get(
    "https://www.gov.uk/government/collections/download-inspire-index-polygons"
  );
  const $ = cheerio.load(data);

  const places = {};

  $("li.gem-c-document-list__item > a").each((_i, el) => {
    const name = $(el).text().split(" INSPIRE")[0];
    places[name] = `http://data.inspire.landregistry.gov.uk/${name.replace(
      / /g,
      "_"
    )}.zip`;
  });

  await fs.writeFile("urls.csv", Object.values(places).join("\n"));
}

go();
