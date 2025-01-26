
grid() {
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
}

catlog() {
	bat ~/dev/deployment/$1/AdventNet/Sas/logs/zoho-crm-application0.txt
}

logs() {
	tail -f ~/dev/deployment/$1/AdventNet/Sas/logs/zoho-crm-application0.txt | bat --paging=never -l log
}

vilog() {
	vi ~/dev/deployment/$1/AdventNet/Sas/logs/zoho-crm-application0.txt
}

deployment() {
	cd ~/dev/deployment/$1/AdventNet/Sas/
}

goroot() {
	cd ~/dev/deployment/$1/AdventNet/Sas/tomcat/webapps/$1/
}

biff() {
	diff $@ | bat -l diff
}
