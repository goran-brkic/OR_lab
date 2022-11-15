var express = require('express');
var router = express.Router();
const pool = require("../db");

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Welcome' });
});

router.get('/database', async function(req, res, next) {
  let podaci = undefined;
  let csv_query = undefined;
  let json_query = undefined;
  if(req.query.polje){
    if(req.query.polje == "wildcard"){
      podaci = await pool.query(`SELECT * FROM hoteli NATURAL JOIN pogodnosti NATURAL JOIN lokacije 
      WHERE '${req.query.search_value}' IN (naziv, grad, zemlja, adresa, tel, email, url, besplatan_wifi, 
        bazen, pet_friendly)`);

      csv_query = await pool.query(`COPY( 
        SELECT hoteli.naziv, hoteli.grad, hoteli.zemlja, hoteli.adresa, hoteli.godina_osnutka, hoteli.tel, hoteli.email, hoteli.url, hoteli.br_soba, hoteli.br_zvjezdica,
      string_agg('besplatan-wifi ' || pogodnosti.besplatan_wifi || ';bazen ' || pogodnosti.bazen || ';pet-friendly ' || pogodnosti.pet_friendly, ';') as pogodnosti,
      string_agg('sirina ' || lokacije.sirina || ';duzina ' || lokacije.duzina, ';') as lokacija
    FROM hoteli JOIN pogodnosti ON hoteli.hotel_id = pogodnosti.hotel_id
    JOIN lokacije ON hoteli.hotel_id = lokacije.hotel_id
    WHERE '${req.query.search_value}' IN (naziv, grad, zemlja, adresa, tel, email, url, besplatan_wifi, bazen, pet_friendly)
      GROUP BY hoteli.naziv, hoteli.grad, hoteli.zemlja, hoteli.adresa, hoteli.godina_osnutka, hoteli.tel, hoteli.email, hoteli.url, hoteli.br_soba, hoteli.br_zvjezdica
    )
        TO 'D:/lab2/public/files/query.csv' with DELIMITER ',' CSV HEADER;`);
  
      json_query = await pool.query(`COPY(
        select array_to_json(array_agg(row_to_json(t))) from ( 
        SELECT hoteli.naziv, hoteli.grad, hoteli.zemlja, hoteli.adresa, hoteli.godina_osnutka, hoteli.tel, hoteli.email, hoteli.url, hoteli.br_soba, hoteli.br_zvjezdica,
          coalesce(json_agg(
                json_build_object( 
                    'besplatan_wifi', pogodnosti.besplatan_wifi, 
                    'unutarnji bazen', pogodnosti.bazen,
              'pet-friendly', pogodnosti.pet_friendly
                ))) as pogodnosti,
          coalesce(json_agg(
                json_build_object( 
                    'sirina', lokacije.sirina, 
                    'duzina', lokacije.duzina
                ))) as lokacija
        FROM hoteli JOIN pogodnosti ON hoteli.hotel_id = pogodnosti.hotel_id
        JOIN lokacije ON hoteli.hotel_id = lokacije.hotel_id
        WHERE '${req.query.search_value}' IN (naziv, grad, zemlja, adresa, tel, email, url, besplatan_wifi, bazen, pet_friendly)
          GROUP BY hoteli.naziv, hoteli.grad, hoteli.zemlja, hoteli.adresa, hoteli.godina_osnutka, hoteli.tel, hoteli.email, hoteli.url, hoteli.br_soba, hoteli.br_zvjezdica) t
        )
        TO 'D:/lab2/public/files/query.json';`);
    }else{
      podaci = await pool.query(`SELECT * FROM hoteli NATURAL JOIN pogodnosti NATURAL JOIN lokacije 
      WHERE ${req.query.polje}='${req.query.search_value}'`);

      csv_query = await pool.query(`COPY( 
        SELECT hoteli.naziv, hoteli.grad, hoteli.zemlja, hoteli.adresa, hoteli.godina_osnutka, hoteli.tel, hoteli.email, hoteli.url, hoteli.br_soba, hoteli.br_zvjezdica,
      string_agg('besplatan-wifi ' || pogodnosti.besplatan_wifi || ';bazen ' || pogodnosti.bazen || ';pet-friendly ' || pogodnosti.pet_friendly, ';') as pogodnosti,
      string_agg('sirina ' || lokacije.sirina || ';duzina ' || lokacije.duzina, ';') as lokacija
    FROM hoteli JOIN pogodnosti ON hoteli.hotel_id = pogodnosti.hotel_id
    JOIN lokacije ON hoteli.hotel_id = lokacije.hotel_id
    WHERE ${req.query.polje}='${req.query.search_value}'
      GROUP BY hoteli.naziv, hoteli.grad, hoteli.zemlja, hoteli.adresa, hoteli.godina_osnutka, hoteli.tel, hoteli.email, hoteli.url, hoteli.br_soba, hoteli.br_zvjezdica
    )
        TO 'D:/lab2/public/files/query.csv' with DELIMITER ',' CSV HEADER;`);
  
      json_query = await pool.query(`COPY(
        select array_to_json(array_agg(row_to_json(t))) from ( 
        SELECT hoteli.naziv, hoteli.grad, hoteli.zemlja, hoteli.adresa, hoteli.godina_osnutka, hoteli.tel, hoteli.email, hoteli.url, hoteli.br_soba, hoteli.br_zvjezdica,
          coalesce(json_agg(
                json_build_object( 
                    'besplatan_wifi', pogodnosti.besplatan_wifi, 
                    'unutarnji bazen', pogodnosti.bazen,
              'pet-friendly', pogodnosti.pet_friendly
                ))) as pogodnosti,
          coalesce(json_agg(
                json_build_object( 
                    'sirina', lokacije.sirina, 
                    'duzina', lokacije.duzina
                ))) as lokacija
        FROM hoteli JOIN pogodnosti ON hoteli.hotel_id = pogodnosti.hotel_id
        JOIN lokacije ON hoteli.hotel_id = lokacije.hotel_id
        WHERE ${req.query.polje}='${req.query.search_value}'
          GROUP BY hoteli.naziv, hoteli.grad, hoteli.zemlja, hoteli.adresa, hoteli.godina_osnutka, hoteli.tel, hoteli.email, hoteli.url, hoteli.br_soba, hoteli.br_zvjezdica) t
        )
        TO 'D:/lab2/public/files/query.json';`);
    }
    
  } else {
    podaci = await pool.query(`SELECT * FROM hoteli NATURAL JOIN pogodnosti NATURAL JOIN lokacije`);
  }
  res.render('database', { title: 'Database', podaci: podaci.rows, csv: csv_query ? true : false, json: json_query ? true : false });
});

module.exports = router;
