function install_docker() {
	echo -e "${BLUE}### DOCKER ###${NC}"
	dpkg-query -l docker > /dev/null 2>&1
  	if [ $? != 0 ]; then
		echo " * Installing Docker"
		if [[ $(echo $SYSTEM | grep "Ubuntu") ]]; then
			apt-get install -y docker-engine --allow-unauthenticated > /dev/null 2>&1
		else
			apt-get install -y docker-engine > /dev/null 2>&1
		fi
		if [[ "$?" == "0" ]]; then
			echo -e "	${GREEN}* Docker successfully installed${NC}"
		else
			echo -e "	${RED}* Failed installing Docker !${NC}"
		fi
		service docker start > /dev/null 2>&1
		echo " * Installing Docker-compose"
		curl -L https://github.com/docker/compose/releases/download/1.15.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
		chmod +x /usr/local/bin/docker-compose
		if [[ "$?" == "0" ]]; then
			echo -e "	${GREEN}* Docker-Compose successfully installed${NC}"
		else
			echo -e "	${RED}* Failed installing Docker-Compose !${NC}"
		fi
		echo ""
	else
		echo -e " ${YELLOW}* Docker is already installed !${NC}"
		echo ""
	fi
}
