FROM node
WORKDIR /app
# ./ hace referencia al WORKDIR
COPY primerApp ./ 
# RUN corre al crear la imagen (en el "docker build")
RUN npm install
EXPOSE 3000
# CMD corre al iniciar el contenedor (en el "docker run")
CMD ["node", "app.js"]


# docker build -t primerapp:latest ./ -f "primerApp.Dockerfile"
# docker image ls
# docker run -p 3001:3000 primerapp:latest
# docker container ls