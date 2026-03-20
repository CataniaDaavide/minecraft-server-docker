# 🧠 Minecraft Server Disaster Recovery Guide (No Docker Image)

Questa guida spiega come ricreare completamente un server Minecraft anche se l’immagine Docker (es. itzg/minecraft-server) non fosse più disponibile in futuro.

L’obiettivo è poter far partire il server usando solo file ufficiali e Java.

---

# 🧱 1. Cosa useremo al posto di Docker image

Se l’immagine Docker non esiste più, possiamo costruire tutto manualmente usando:

- Java (OpenJDK)
- Server ufficiale Minecraft (Vanilla)
- PaperMC (consigliato)

---

# 📥 2. Scaricare il server ufficiale

## 🔹 Vanilla (ufficiale Mojang/Minecraft)

Scarica da:
- https://www.minecraft.net/en-us/download/server

Ottieni un file tipo:
```
minecraft_server.jar
```

---

## 🔹 Alternativa migliore (PaperMC)

Paper è più veloce e usato nei server moderni:

- https://papermc.io/downloads/paper

Scarica il file:
```
paper-xxxx.jar
```

Rinominalo in:
```
server.jar
```

---

# 📁 3. Struttura cartella server

Crea una cartella:

```
minecraft-server/
```

Dentro:

```
minecraft-server/
 ├── server.jar
 ├── start.sh (o start.bat)
 ├── eula.txt
 ├── server.properties
 ├── world/
 ├── plugins/ (solo Paper/Spigot)
```

---

# ⚙️ 4. Primo avvio manuale

## Linux / Mac

Crea file `start.sh`:

```bash
#!/bin/bash
java -Xms1G -Xmx2G -jar server.jar nogui
```

Poi:
```bash
chmod +x start.sh
./start.sh
```

---

## Windows

Crea `start.bat`:

```bat
java -Xms1G -Xmx2G -jar server.jar nogui
pause
```

---

# 📜 5. Accettare EULA

Al primo avvio si crea:
```
eula.txt
```

Modifica:

```
eula=true
```

---

# 🌐 6. Configurazione server

File:
```
server.properties
```

Impostazioni importanti:

```
online-mode=false   # (cracked mode)
server-port=25565
max-players=20
gamemode=survival
```

---

# 🔐 7. Sicurezza in modalità offline

Se `online-mode=false`:

⚠️ chiunque può entrare con qualsiasi nickname

Soluzioni:
- plugin AuthMe (Paper/Spigot)
- whitelist

Comandi:
```
/whitelist on
/whitelist add Nome
```

---

# 🧩 8. Plugin (solo Paper/Spigot)

Cartella:
```
plugins/
```

Metti file `.jar` dentro.

Esempi:
- AuthMeReloaded
- EssentialsX
- LuckPerms

---

# 🐳 9. Alternativa Docker senza immagini esterne

Se vuoi ancora Docker ma senza immagini precompilate:

```Dockerfile
FROM openjdk:21

WORKDIR /server

COPY server.jar ./server.jar
COPY start.sh ./start.sh

RUN chmod +x start.sh

EXPOSE 25565

CMD ["./start.sh"]
```

---

# ▶️ 10. docker-compose equivalente

```yaml
services:
  minecraft:
    build: .
    ports:
      - "25565:25565"
    volumes:
      - ./world:/server/world
      - ./plugins:/server/plugins
    restart: unless-stopped
```

---

# 💾 11. Backup dati

Sempre salvare:

```
world/
plugins/
server.properties
```

---

# 🚀 12. Avvio finale

```bash
java -Xms1G -Xmx2G -jar server.jar nogui
```

---

# 🧠 CONCLUSIONE

Anche senza Docker images:

✔ puoi ricreare tutto
✔ server identico
✔ compatibile con plugin
✔ funzionante su qualsiasi OS

---

# 🏁 Fine guida

