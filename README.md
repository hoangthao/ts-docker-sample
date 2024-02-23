# React + TypeScript + Vite

This template provides a minimal setup to get React working in Vite with HMR and some ESLint rules.

Currently, two official plugins are available:

- [@vitejs/plugin-react](https://github.com/vitejs/vite-plugin-react/blob/main/packages/plugin-react/README.md) uses [Babel](https://babeljs.io/) for Fast Refresh
- [@vitejs/plugin-react-swc](https://github.com/vitejs/vite-plugin-react-swc) uses [SWC](https://swc.rs/) for Fast Refresh

## Expanding the ESLint configuration

If you are developing a production application, we recommend updating the configuration to enable type aware lint rules:

- Configure the top-level `parserOptions` property like this:

```js
export default {
  // other rules...
  parserOptions: {
    ecmaVersion: 'latest',
    sourceType: 'module',
    project: ['./tsconfig.json', './tsconfig.node.json'],
    tsconfigRootDir: __dirname,
  },
}
```

- Replace `plugin:@typescript-eslint/recommended` to `plugin:@typescript-eslint/recommended-type-checked` or `plugin:@typescript-eslint/strict-type-checked`
- Optionally add `plugin:@typescript-eslint/stylistic-type-checked`
- Install [eslint-plugin-react](https://github.com/jsx-eslint/eslint-plugin-react) and add `plugin:react/recommended` & `plugin:react/jsx-runtime` to the `extends` list


### Note

```sh
yarn add --dev @types/node
docker build -t ts-docker-sample:1.0.0 .
docker build -t ts-docker-sample --build-arg abc_env="Camry21 24" .
docker run -d -p 8088:9090 --name ts-docker-sample-app ts-docker-sample
# similar env variable in fargate
docker run -d -p 8088:9090 --name ts-docker-sample-app -e SECRETS="pass-docker-run" -e VITE_SECRETS=override ts-docker-sample
#!/usr/bin/env bash
#!/bin/sh

docker run  -p 8088:9090 --name ts-docker-sample-app -e SECRETS="pass-docker-run" -e VITE_SECRETS=override -e OPS_PASSWORD="Hoang Thao" -e OPS_API_URL=http://localhost:8080 ts-docker-sample
```




https://developers.redhat.com/blog/2021/03/04/making-environment-variables-accessible-in-front-end-containers#inject_the_environment_variables
https://github.com/spa-configuration/react-envsubst/blob/main/src/configuration.js