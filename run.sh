#!/bin/bash

# Variables
################################################################################

# parameter
parameter="$1"

# return values
ERROR=1
SUCCESS=0

all_containers=("grafana" "prometheus" "node_exporter")
all_images=("grafana/grafana" "prom/prometheus" "quay.io/prometheus/node-exporter")
all_volumes=("grafana_data")

# Functions
################################################################################

# ============================================
# Exibe o help
# ============================================
function _show_help(){
  echo "Use: ./$(basename $0) <PARAMS>"
  echo
  echo "PARAMS"
  echo "  --build                      builda o docker-compose"
  echo "  --stop                       stop todos os containers"
  echo "  --remove-containers          remove todos os containers"
  echo "  --remove-images              remove todos as images"
  echo "  --remove-volumes             remove todos od volumes"
  echo "  --destroy                    remove tudo de uma vez (containers + images + volumes)"
  echo
  echo "ex:"
  echo "  sobe o serviço:"
  echo "  ./$(basename $0) --build"
}

# ============================================
# builda o docker-compose
# ============================================
function build(){
  docker-compose up -d
}

# ============================================
# stop os conatiners
# ============================================
function stop_containers(){
  for container in "${all_containers[@]}"; do
    container_id=$(docker ps -q --filter "name=${container}")
    if [ -n "$container_id" ];then
      docker stop "$container"
    fi
  done
}

# ============================================
# remove os containers
# ============================================
function remove_containers(){
  for container in "${all_containers[@]}"; do
    container_id=$(docker container ls -q -a --filter "name=${container}")
    if [ -n "$container_id" ];then
      docker rm "$container"
    fi
  done
}

# ============================================
# remove as imagens
# ============================================
function remove_images(){
  for image in "${all_images[@]}"; do
    image_id=$(docker images -q grafana/grafana)
    if [ -n "$image_id" ];then
      docker rmi "$image"
    fi
  done
}

# ============================================
# remove volumes
# ============================================
function remove_volumes(){
  for volume in "${all_volumes[@]}"; do
    volume_name=$(docker volume ls | grep "$volume" | awk '{print $2}')
    if [ -n "$volume_name" ];then
      docker volume rm "$volume_name"
    fi
  done
}

# MAIN
################################################################################
case "$parameter" in

  -h | --help)
    _show_help
  ;;

  # mensagem de help
  --build)
    build
  ;;

  --stop)
    stop_containers
  ;;

  --remove-containers)
    remove_containers
  ;;

  --remove-images)
    remove_images
  ;;

  --remove-volumes)
    remove_volumes
  ;;

  --destroy)
    stop_containers
    remove_containers
    remove_images
    remove_volumes
  ;;

  *)
    _show_help
  ;;

esac