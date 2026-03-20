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
FROM itzg/minecraft-server

COPY plugins /plugins
```

---

# ⚙️ 4. docker-compose.yml

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

```bash
docker compose up -d --build
```

---

# 📊 6. Log server

```bash
docker logs -f minecraft-server
```

---

# 🎮 7. Accesso

IP:
localhost

---

# 🔥 8. Firewall Windows

## IN INGRESSO (Inbound)
- TCP 25565 → Consenti
- UDP 25565 → Consenti

## IN USCITA (Outbound)
- TCP 25565 → Consenti (Consenti connessioni)
- UDP 25565 → Consenti (Consenti connessioni)

---

# 🔐 9. AuthMe

/`register password password`
/`login password`

---

# ⚠️ Sicurezza

ONLINE_MODE=FALSE permette accesso libero.

---

# 💡 Comandi utili

docker compose down
docker compose restart

---

# 📁 Backup

Cartella:
./data
