
function grid -d "Print information about all the LZ machines"
	echo "For more info, wiki page: "
	echo "https://crmwiki.wiki.zoho.com/Email-LocalZoho-Machines-1.html"
	echo ""
	echo "+----------------+-------------------+"
	echo "|     Machine    |     IP Address    |"
	echo "|----------------+-------------------|"
	echo "|     crmlab     |   172.20.87.115   |"
	echo "|----------------+-------------------|"
	echo "|     crmmail    |    172.20.38.37   |"
	echo "|----------------+-------------------|"
	echo "|   crm_silab2   |    172.20.27.49   |"
	echo "|----------------+-------------------|"
	echo "|  CRM Mail Test |   172.20.90.191   |"
	echo "|------------------------------------|"
	echo "|  SG DB Server  |   172.20.24.243   |"
	echo "|------------------------------------+----------------------+"
	echo "|              SUB GRIDS             |     Deploy Script    |"
	echo "|----------------+-------------------+----------------------|"
	echo "|      crmed     |    172.20.26.65   |       deploy.sh      |"
	echo "|----------------+-------------------+----------------------|"
	echo "|    crmmail1    |   172.20.45.160   |    deploy-mail1.sh   |"
	echo "+-----------------------------------------------------------+"
	echo ""
	echo "::      Password: xCfmzYArGDBuF     ::"
end

function catlog -d "Print the entire application log" -a project_name
	bat ~/dev/deployment/$project_name/AdventNet/Sas/logs/zoho-crm-application0.txt
end

function logs -d "Tail the application log" -a project_name
	tail -f ~/dev/deployment/$project_name/AdventNet/Sas/logs/zoho-crm-application0.txt | bat --paging=never -l log
end

function vilog -d "Open the application log in lvim" -a project_name
	lvim ~/dev/deployment/$project_name/AdventNet/Sas/logs/zoho-crm-application0.txt
end

function deployment -d "cd to the deployment folder of the project" -a project_name
	cd ~/dev/deployment/$project_name/AdventNet/Sas/
end

function goroot -d "cd to the root directory of the project" -a project_name
	cd ~/dev/deployment/$project_name/AdventNet/Sas/tomcat/webapps/$project_name/
end

function biff -d "View the diff between two files using bat"
	diff $argv | bat -l diff
end
