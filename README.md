# 🐳 Minecraft Server (Docker) + Auth Plugin Setup

Guida completa per creare un server Minecraft con Docker, modalità offline (cracked) e plugin di autenticazione.

---

# 📦 1. Struttura progetto

Crea questa struttura:

```
minecraft-server/
│── docker-compose.yml
│── Dockerfile
│── plugins/
│    └── (plugin .jar qui)
│── data/
```

---

# 🔐 2. Plugin Auth (AuthMe)

Scarica il plugin:
👉 https://www.spigotmc.org/resources/authmereloaded.6269/

Metti il file `.jar` dentro:

```
plugins/
```

---

# 🐳 3. Dockerfile

Questo Dockerfile estende l'immagine base e copia automaticamente i plugin.

```Dockerfile
# Usa immagine ufficiale Minecraft Docker
FROM itzg/minecraft-server

# Copia i plugin dentro il container
COPY plugins /plugins

# (opzionale) puoi aggiungere config custom qui
# COPY config /config
```

---

# ⚙️ 4. docker-compose.yml (consigliato)

```yaml
version: "3.8"

services:
  minecraft:
    build: .
    container_name: minecraft-server
    ports:
      - "25565:25565"

    environment:
      EULA: "TRUE"
      ONLINE_MODE: "FALSE"
      VERSION: "LATEST"
      TYPE: "PAPER"

    volumes:
      - ./data:/data

    restart: unless-stopped
```

---

# 🚀 5. Avvio server

Nel terminale:

```
docker compose up -d --build
```

---

# 📊 6. Controllo log

```
docker logs -f minecraft-server
```

Devi vedere:

```
Done (...)! For help, type "help"
```

---

# 🎮 7. Accesso al server

Apri Minecraft → Multiplayer → Aggiungi server

IP:

```
localhost
```

---

# 🔐 8. Come funziona AuthMe

Al primo accesso:

```
/register password password
```

Accessi successivi:

```
/login password
```

---

# ⚠️ Sicurezza

Con ONLINE_MODE=FALSE:

- Chiunque può entrare
- Possono impersonare altri utenti

👉 AuthMe è OBBLIGATORIO

---

# 💡 Comandi utili

Stop:

```
docker compose down
```

Restart:

```
docker compose restart
```

---

# 📁 Backup mondo

I dati sono salvati in:

```
./data
```

Fai backup copiando quella cartella.

---

# 🚀 Miglioramenti futuri

- Port forwarding per amici
- Plugin extra (/home, /spawn)
- Backup automatici

---

# ✅ Fine

Server pronto con:

✔ Docker
✔ Ultima versione Minecraft
✔ Modalità cracked
✔ Sistema login sicuro

