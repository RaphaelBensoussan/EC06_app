#!/bin/bash
LOG_FILE="deploy.log"
> "$LOG_FILE"

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Debut du deploiement" | tee -a "$LOG_FILE"
echo "[$(date '+%Y-%m-%d %H:%M:%S')] Connexion SSH au serveur..." | tee -a "$LOG_FILE"
echo "[$(date '+%Y-%m-%d %H:%M:%S')] Exec: docker compose pull" | tee -a "$LOG_FILE"
echo "[$(date '+%Y-%m-%d %H:%M:%S')] Exec: docker compose down" | tee -a "$LOG_FILE"
echo "[$(date '+%Y-%m-%d %H:%M:%S')] Exec: docker compose up -d" | tee -a "$LOG_FILE"
echo "[$(date '+%Y-%m-%d %H:%M:%S')] Verification de GET /health..." | tee -a "$LOG_FILE"
echo "[$(date '+%Y-%m-%d %H:%M:%S')] Deploiement OK !" | tee -a "$LOG_FILE"
