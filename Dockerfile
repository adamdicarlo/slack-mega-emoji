FROM node:7.5.0

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install yarn and easily get it into PATH with a symlink
RUN curl -o- -L https://yarnpkg.com/install.sh | bash -s -- --version 0.20.3
RUN ln -s $HOME/.yarn/bin/yarn /usr/local/bin/yarn

ARG NODE_ENV
ENV NODE_ENV $NODE_ENV
COPY package.json yarn.lock /usr/src/app/
RUN yarn install --frozen-lockfile && yarn cache clean
COPY . /usr/src/app

CMD [ "npm", "start" ]
