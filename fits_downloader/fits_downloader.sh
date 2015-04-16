#!/bin/bash
#This file is part of ChiVO, the Chilean Virtual Observatory
#A project sponsored by FONDEF (D11I1060)
#Copyright (C) 2015 Universidad Tecnica Federico Santa Maria
#                   Universidad de Chile
#                   Pontificia Universidad Catolica
#                   Universidad de Concepcion
#                   Universidad de Santiago

#This program is free software; you can redistribute it and/or
#modify it under the terms of the GNU General Public License
#as published by the Free Software Foundation; either version 2
#of the License, or (at your option) any later version.

#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.

#You should have received a copy of the GNU General Public License
#along with this program; if not, write to the Free Software
#Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.


# change the paths............
# ignore the  bad practices this is a ultra fast and hard-coded version 

# as you can see you must change this directory
mkdir /home/gonzalo/Documents/fits/pasos/projectos

# list of projects
cat archive.do | grep \<\/A\> | cut -d ">" -f2 | cut -d "<" -f1 | grep '\<.*\.S\>' > project_list
echo "you get the projects of ALMA"
echo "the first project doesn't has projects, ignore the first wget error"

# create a directory for every project
cat /home/gonzalo/Documents/fits/pasos/project_list | while read projecti
do
	mkdir /home/gonzalo/Documents/fits/pasos/projectos/$projecti
	wget "http://jvo.nao.ac.jp/portal/alma/archive.do?action=project.info&projectCode=$projecti" -P /home/gonzalo/Documents/fits/pasos/projectos/$projecti
	
	# getting fits of project i
	cat /home/gonzalo/Documents/fits/pasos/projectos/$projecti/archive.do\?action\=project.info\&projectCode\=$projecti | grep id=\"dataset_ | cut -d ">" -f3 | cut -d "<" -f1 > /home/gonzalo/Documents/fits/pasos/projectos/$projecti/fits_$projecti
	echo "you found all fits of project $projecti "
	
	cat /home/gonzalo/Documents/fits/pasos/projectos/$projecti/fits_$projecti | while read fiti
	do
		mkdir cat /home/gonzalo/Documents/fits/pasos/projectos/$projecti/$fiti
		wget "http://jvo.nao.ac.jp/portal/alma/archive.do?action=dataset.info&datasetId=$fiti" -P /home/gonzalo/Documents/fits/pasos/projectos/$projecti/$fiti
		# getting the id of every fit  
		fitid=$(cat /home/gonzalo/Documents/fits/pasos/projectos/$projecti/$fiti/archive.do\?action\=dataset.info\&datasetId\=$fiti | grep dataId | head -n 1 | cut -d "&" -f3 | cut -d "=" -f2)
		wget "http://jvo.nao.ac.jp/portal/alma/archive.do?action=download.fits&dataId=$fitid" -P /home/gonzalo/Documents/fits/pasos/projectos/$projecti
		echo "congratz, fit $fiti of $projecti is downloaded"
	done
	
done
