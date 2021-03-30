System Monitor
===========

<p align="left">
    <a href="https://docs.docker.com/get-started/">
      <img src="https://img.shields.io/badge/-Docker-2496ed.svg?style=for-the-badge&logo=Docker&logoColor=white"/>
    </a>
    <a href="https://grafana.com/docs/">
      <img src="https://img.shields.io/badge/-Grafana-f46800.svg?style=for-the-badge&logo=Grafana&logoColor=white"/>
    </a>
    <a href="https://prometheus.io/docs/introduction/overview/">
      <img src="https://img.shields.io/badge/-Prometheus-e6522c.svg?style=for-the-badge&logo=Prometheus&logoColor=white"/>
    </a>
    <a href="https://prometheus.io/docs/guides/node-exporter/">
      <img src="https://img.shields.io/badge/-Node_exporter-e6522c.svg?style=for-the-badge&logo=Prometheus&logoColor=white"/>
    </a>
</p>

<a href="http://creativecommons.org/licenses/by-nc-sa/4.0/">
  <img src="https://img.shields.io/badge/-CC_BY--SA_4.0-000000.svg?style=for-the-badge&logo=creative-commons&logoColor=white"/>
</a>

  # Description
  POC (Prove Of Concept) of system monitor to test and study Grafana + Prometheus + node_exporter

  ## Dependencies
    - docker
    - docker-compose

  ## Use
  - Change the file `prometheus/prometheus.yml` and change the IP to your localhost IP

  To up the service:
  ```bash
  ./run.sh --build
  ```
  After this command, access in browser: [localhost:3000](http://localhost:3000)

  ### Tools
  1. The script `run.sh` facilitate the up and down service, with this options:
  ```
  Use: ./run.sh <PARAMS>

PARAMS
  --build                      builda o docker-compose
  --stop                       stop todos os containers
  --remove-containers          remove todos os containers
  --remove-images              remove todos as images
  --remove-volumes             remove todos od volumes
  --destroy                    remove tudo de uma vez (containers + images + volumes)

ex:
  sobe o serviço:
  ./run.sh --build
  ```
  2. The file `tools.sh` change Grafana admin password if necessary
  ```
  Use: ./tools.sh <PARAMS>

PARAMS
  --grafana-reset-password     reset Grafana admin password

ex:
  reseta a senha do admin do grafana:
  ./tools.sh ----grafana-reset-password
  ```

## Example
<img alt="Example" src="images/example.jpg?raw=true" align="center" hspace="1" vspace="1">


----

  ### License:

<p align="center">
  <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">
    <img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" />
  </a>
</p>
