#//////////////////////////////////////////////////////////////
#//   ____                                                   //
#//  | __ )  ___ _ __  ___ _   _ _ __   ___ _ __ _ __   ___  //
#//  |  _ \ / _ \ '_ \/ __| | | | '_ \ / _ \ '__| '_ \ / __| //
#//  | |_) |  __/ | | \__ \ |_| | |_) |  __/ |  | |_) | (__  //
#//  |____/ \___|_| |_|___/\__,_| .__/ \___|_|  | .__/ \___| //
#//                             |_|             |_|          //
#//////////////////////////////////////////////////////////////
#//                                                          //
#//  Script, 2022                                            //
#//  Created: 14, April, 2022                                //
#//  Modified: 03, August, 2024                              //
#//  file: -                                                 //
#//  -                                                       //
#//  Source:                                                 //
#//  OS: ALL                                                 //
#//  CPU: ALL                                                //
#//                                                          //
#//////////////////////////////////////////////////////////////

DOCKER := docker

PROFILE := 7dtd-server
PROFILE_CMD := $(addprefix --profile ,$(PROFILE))

# mc-web

COMPOSE_FILE := docker-compose.yml

AUTHOR := vinanrra

IMAGE_NAME := 7dtd-server

IMAGE_AUTHOR := $(addprefix itzg/, $(IMAGE_NAME))

IMAGE_FULL_NAME := $(addsuffix :latest, $(IMAGE_AUTHOR))

SERVER_PATH := 7daystodie-server

.PHONY: build all
all: start

.PHONY: start
start:
	docker-compose -f $(SERVER_PATH)/$(COMPOSE_FILE) $(PROFILE_CMD) up -d

start-at:
	docker-compose -f $(SERVER_PATH)/$(COMPOSE_FILE) $(PROFILE_CMD) up

.PHONY: stop
stop: down

.PHONY: down
down:
	docker-compose -f $(SERVER_PATH)/$(COMPOSE_FILE) $(PROFILE_CMD) down

.PHONY: restart
restart: stop start

.PHONY: logs
logs:
	docker-compose -f $(SERVER_PATH)/$(COMPOSE_FILE) logs

.PHONY: state
state:
	docker-compose -f $(SERVER_PATH)/$(COMPOSE_FILE) ps
	docker-compose -f $(SERVER_PATH)/$(COMPOSE_FILE) top

.PHONY: update
update:
	echo $(IMAGE_FULL_NAME) | xargs -n1 docker pull
	#git pull --recurse-submodules --all --progress

.PHONY: clean
clean: $(SUBDIRS)
	$(DOCKER) images --filter=reference='bensuperpc/*' --format='{{.Repository}}:{{.Tag}}' | xargs -r $(DOCKER) rmi -f
