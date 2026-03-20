# Usa immagine ufficiale Minecraft Docker
FROM itzg/minecraft-server

# Copia i plugin dentro il container
COPY plugins /plugins

# (opzionale) puoi aggiungere config custom qui
# COPY config /config