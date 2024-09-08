# cyberbus-js-client

A javascript / typescript http client and type system for cyberbus. Forked from lemmy.

## Installation

`pnpm install cyberbus-js-client`

## Usage

### HTTP Client


```ts
import { CyberbusHttp, Login } from "cyberbus-js-client";

// Build the client
const baseUrl = "https://cyberbus.net";
const client: CyberbusHttp = new CyberbusHttp(baseUrl);

// Build the login form
const loginForm: Login = {
  username_or_email: "my_name",
  password: "my_pass",
};

// Login and set the client headers with your jwt
const { jwt } = await client.login(loginForm);
client.setHeaders({ Authorization: `Bearer ${jwt}` });

// Fetch top posts for the day
const getPostsForm: GetPosts = {
  sort: "TopDay",
  type_: "Local",
};
const posts = await client.getPosts(getPostsForm);
```

## Development

Use `pnpm add` to develop and test changes locally:

```
pnpm add path/to/cyberbus-js-client
```
