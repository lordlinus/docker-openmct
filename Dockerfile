FROM node:wheezy
RUN useradd -ms /bin/bash node
RUN git clone https://github.com/nasa/openmct.git \
&& cd openmct \
&& npm install \
&& npm install canvas nomnoml \
&& npm run docs
RUN chown -R node /openmct
ENV HOME /openmct
USER node
RUN cd openmct \
&& npm run prepublish
EXPOSE 8080
WORKDIR /openmct
CMD ["npm","start"]
