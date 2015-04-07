align_upstreams
===============

Align upstream sequences from two genomes (ideally K-12 against another strain); then analyse mutations in TFBSs and their relationship with available RNAseq data.

Dependencies
------------

* python
* BioPython
* OMA

Usage
-----

* Orthology:
    * Place a K-12 genbank file in the "genomes" directory (genomes/k12.gbk corresponds to RefSeq NC_000913.2)
    * Place the comparison genbank file in the same directory (called genomes/other.gbk)
    * Run `make orthology`

Todo
----

* Align upstream regions
    * Only those for which K-12 has a known TFBS from regulonDB
    * Use the approach described in 10.1073/pnas.1413272111
* Derive mutations from the known TFBSs
* Correlate mutations with RNAseq data

Notes
-----

* Scripts depending on the orthoxml library (omah2tsv) only work with python2 for the moment.

Copyright
---------

Copyright (C) <2015> EMBL-European Bioinformatics Institute

This program is free software: you can redistribute it and/or
modify it under the terms of the GNU General Public License as
published by the Free Software Foundation, either version 3 of
the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

Neither the institution name nor the name align_upstreams
can be used to endorse or promote products derived from
this software without prior written permission.
For written permission, please contact <marco@ebi.ac.uk>.

Products derived from this software may not be called align_upstreams
nor may align_upstreams appear in their names without prior written
permission of the developers. You should have received a copy
of the GNU General Public License along with this program.
If not, see <http://www.gnu.org/licenses/>.
