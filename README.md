# 📊 Prometheus + Grafana + Node Exporter + cAdvisor

Este projeto oferece um sistema de monitoramento completo utilizando ferramentas populares do ecossistema Prometheus.

## 🔧 Componentes do Sistema

- **Prometheus** — Coleta e armazena métricas.
- **Grafana** — Visualiza dados em dashboards.
- **Node Exporter** — Monitora métricas do sistema operacional.
- **cAdvisor** — Monitora métricas de containers Docker.

---

## 🧩 Explicação dos Componentes

### 🐳 cAdvisor

Coleta métricas diretamente dos containers:

- Uso de **CPU**, **memória**, **rede** e **disco** por container.
- Acessa a API do Docker para capturar estatísticas em tempo real.

### 🖥️ Node Exporter

- Exporta métricas de **hardware** e **sistema operacional** (Linux/Unix).
- Expõe as métricas na porta `9100`, no endpoint `/metrics`.

### 📥 Prometheus

- Arquivo de configuração `prometheus.yml` define os **targets** de scraping:
  
```yaml
scrape_configs:
  - job_name: 'node'
    static_configs:
      - targets: ['node-exporter:9100']
