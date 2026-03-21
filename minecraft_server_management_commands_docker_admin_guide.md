# 🐳 Minecraft Server Management Guide (Docker + Admin Commands)

Guida rapida ai comandi più usati per gestire un server Minecraft avviato con Docker.
```
docker exec -it minecraft-server rcon-cli
```

---

# 👑 1. Come ottenere OP (Admin)

## Metodo 1 — In game

```
/op NomeGiocatore
```

## Metodo 2 — Automatico all’avvio

Nel comando Docker o docker-compose:

```
-e OPS=NomeGiocatore
```

---

# 🔐 2. Sicurezza (ONLINE_MODE=FALSE)

Con modalità offline:

* Chiunque può entrare con qualsiasi nickname
* È OBBLIGATORIO usare whitelist o plugin login

## Comandi whitelist

```
/whitelist on
/whitelist off
/whitelist add Nome
/whitelist remove Nome
/whitelist list
```

---

## 🔑 2.1 AuthMe (Reset password e sicurezza login)

Se usi il plugin **AuthMeReloaded**, puoi gestire le password degli utenti.

### 🔄 Resettare password utente
```
/authme changepassword NomeGiocatore nuova_password
```

👉 Permette di cambiare la password senza conoscere quella vecchia.

### 🆕 Forzare nuova registrazione
```
/authme unregister NomeGiocatore
```

### ➕ Registrare manualmente un utente
```
/authme register NomeGiocatore password
```

📌 Nota:
- Serve permesso admin (`authme.admin.*`)
- Utile soprattutto in modalità offline mode
- Consigliato combinare con whitelist

---

# ⚙️ 3. Comandi base server Minecraft

## 🔄 Server

```
stop
/restart
/save-all
/save-off
/save-on
```

## 👤 Giocatori

```
/kick Nome motivo
/ban Nome motivo
/pardon Nome
/ban-ip IP
/pardon-ip IP
```

## 🧭 Teleport

```
/tp Nome1 Nome2
/tp Nome X Y Z
```

## 🎮 Gameplay

```
/gamemode survival
/gamemode creative
/gamemode spectator
```

## ⏱️ Tempo e mondo

```
/time set day
/time set night
/weather clear
/weather rain
```

---

# 🐳 4. Comandi Docker utili

## 📜 Log server

```
docker logs -f minecraft-server
```

## 🧠 Entrare nel container

```
docker exec -it minecraft-server bash
```

## ⛔ Stop server

```
docker stop minecraft-server
```

## ▶️ Avvio server

```
docker start minecraft-server
```

## 🔄 Restart

```
docker restart minecraft-server
```

## 🗑️ Eliminare server

```
docker rm -f minecraft-server
```

---

## 🧑‍💻 4.1 Avviare CLI (RCON)

Per entrare nella console del server Minecraft:

```
docker exec -it minecraft-server rcon-cli
```

👉 Da qui puoi scrivere comandi come se fossi dentro il server:

```
op NomeGiocatore
deop NomeGiocatore
stop
save-all
```

---

# 💾 5. Backup mondo

I dati sono nella cartella montata:

```
/data
```

Backup semplice:

* copia la cartella `data`

---

# 🚀 6. Consigli importanti

* Usa sempre AuthMe se ONLINE_MODE=FALSE
* Usa whitelist per sicurezza extra
* Fai backup regolari del mondo
* Usa Paper per performance migliori

---

# 🎯 Fine guida

Server pronto con:
✔ Docker
✔ Admin commands
✔ Offline mode support
✔ Gestione base completa
