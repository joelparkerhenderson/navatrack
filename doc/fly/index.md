# Fly

https://fly.io/docs/flyctl/install/

flyctl is a command-line utility that lets you work with Fly.io using fly commands, from creating your account to deploying your applications. It runs on your local device so you’ll want to install the version that’s appropriate for your operating system.

## Install via macOS brew

Run:

```sh
brew install flyctl
brew list flyctl | head -1 | xargs sudo xattr -c
```

Caution: other tools by other vendors are also named "fly", so be sure you have the correct one, with the correct version.

## Login

Run:

```sh
fly auth login
```

Output:

```out
Opening https://fly.io/app/auth/cli/…
Waiting for session... Done
successfully logged in as example@exmaple.com
```
