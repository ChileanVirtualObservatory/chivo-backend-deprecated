dachs
=====

#Resources

* Simple resource - lmcextinct
* Simple Cone Search - lmcext2
* Simple Image Access - siapobsexample
* ObsCore - siapobsexample

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
# SIAP

# ObsCore
