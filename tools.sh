#!/bin/bash

# Variables
################################################################################

# parameter
parameter="$1"

# Functions
################################################################################

# ============================================
# Exibe o help
# ============================================
function _show_help(){
  echo "Use: ./$(basename $0) <PARAMS>"
  echo
  echo "PARAMS"
  echo "  --grafana-reset-password     reset Grafana admin password"
  echo
  echo "ex:"
  echo "  reseta a senha do admin do grafana:"
  echo "  ./$(basename $0) ----grafana-reset-password"
}

# ============================================
# reseta a senha do grafana
# ============================================
function grafana_reset_password(){
  local grafana_container_id=$(docker ps | grep grafana/grafana | awk '{print $1}')
  docker exec -ti $grafana_container_id grafana-cli admin reset-admin-password grafana
}


# MAIN
################################################################################
case "$parameter" in

  -h | --help)
    _show_help
  ;;

  # mensagem de help
  --grafana-reset-password)
    grafana_reset_password
  ;;

  *)
    _show_help
  ;;

esac