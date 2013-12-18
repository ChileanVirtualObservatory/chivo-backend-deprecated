dachs
=====

#Resources

* Simple resource - lmcextinct.exts
* Simple Cone Search - lmcext2.ext2
* Simple Image Access - siapobsexample.spe
* ObsCore - siapobsexample.spe - ivoa.ObsCore

# TAP

## Sync
 * Web: http://dachs.lirae.cl:8080/__system__/tap/run/tap/sync
   * GET y POST

## Async
 * Web: http://dachs.lirae.cl:8080/__system__/tap/run/tap/async
   * GET y POST

## Parameters
 * REQUEST: `doQuery, getCapabilities`
  * `getCapabilities`: only in Async   
 * LANG: `ADQL, PQL`
 * QUERY: Query e.i `SELECT * FROM resource.table`
 * FORMAT: text/xml, fits, text/html, tsv, votable/td, text/tab-separated-values, text/csv, html, votable, application/fits, votable/b2, text/csv
  * `votable/td`: VOTable human-readable
  * `votable`: VOTable with base64
 * MAXREC: requested number of rows
  * `MAXREC = 0`: return Metadata of the table
 * RUNID: run async jobs

# SCS
 * Web: http://200.1.19.130:8080/lmcext2/q/cone/scs.xml?
 * Method: GET
 * Attributes
  * RA: Position `Decimal Degree`
  * DEC: Position `Decimal Degree`
  * SR: Search Radius `Decimal Degree`
 
# SIAP
 * Web: http://200.1.19.130:8080/siapobsexample/q/sia/siap.xml?
 * Method: GET
 * Attributes
  * POS = RA,DEC `Decimal degree`
  * SIZE `Degree`
  * *Optional*:
	 * INTERSECT `COVERS , ENCLOSED , CENTER , OVERLAPS`
	 * NAXIS = <width>,<height> `pixels`
	 * CFRAME `ICRS, FK5, FK4, ECL, GAL , SGAL`
	 * EQUINOX `?`
	 * CRPIX `?`
	 * CRVAL `?`
	 * CDELT `?`
	 * ROTANG `degree`
	 * PROJ `TAN , SIN , ARC`
	 * FORMAT `image/fits, ALL, GRAPHIC, METADATA`
	 * VERB `1 , 2 , 3`

