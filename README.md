# Dota-HoN converter
Played HoN for years and now trying Dota for the first time? Or the other way around? No fear, the web conversion app is here!

## Features
* Converts Dota heroes to their HoN equivalents, and vice versa
* Converts Dota items to their HoN equivalents, and vice versa
* Hover over any item or hero and find out what their counterpart is
* Use the search tool to quickly look items or heroes up

## Setup
1. Copy the `credentials-example.php` file and rename it to `credentials.php`.
2. Enter your database credentials there.
3. Create a new database and import the `dhon.sql` file from the `data` directory.
4. Gather assets and put them in the corresponding `assets/img/` subfolders. More in the [paragraph below](#assets).
5. Done!

## <a name="assets"></a>Adding assets for heroes and items
I'd rather not face any legal repercusions for using assets I did not create. Hence they are not being included in this repo. All assets are expected to be jpgs. And their names are derived from the database. E.g. the assets for "Abaddon", a Dota hero, will be retrieved as `assets/img/dota/heroes/abaddon.jpg`. Names are converted to lowercase. Spaces are replaced with underscores (`_`).

## Changing or creating conversions
All hero conversions can be found in the hero_conversions table. Item conversions are found in the item_conversions table.
To change a conversion, or add a new one, use the `hon` column in either of the tables to refer to the item or hero in HoN, and the `dota` column for the Dota equivalent. The ids in these columns refer to either the `heroes` table or `items` table in the database, depending on which type of conversion is being made.

## Further notes
This code was written by me in December 2014 when I had little experience with programming. It is not particularly well-written. :)

Since it was written that long ago, any items or heroes that were released after that date are not included in the app.
