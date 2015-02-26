#!/bin/bash
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
