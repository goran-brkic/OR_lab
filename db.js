const Pool = require('pg').Pool;

/**
const pool = new Pool({
    user: 'sahliga_user',
    password: 'JuqlHmBfB3tyRHkQbBpBvA4i9YLuUUrL',
    host: 'dpg-cdfg5lda4992md4hl9jg-a.frankfurt-postgres.render.com',
    port: 5432,
    database: 'sahliga',
    ssl: true
});
*/

const pool = new Pool({
    user: 'postgres',
    password: 'bazepodataka',
    host: 'localhost',
    port: 5432,
    database: 'Hoteli',
    ssl: false
});


module.exports = pool;