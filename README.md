# docker-7daystodie-server

## Description

Easy to use 7 days to die server with Docker.

## Usage

### Start the server

```bash
make start
```

### Start the server (Attach to the console)

```bash
make start-at
```

### Stop the server

```bash
make stop
```

### Down the server

```bash
make down
```

### Clean server images

```bash
make clean
```

### Purge server images and volumes (Remove all SAVE !)

```bash
make purge
```


### SSH into the server

```bash
ssh -p 2222 admin@127.0.0.1
```

For the sudo password, use: **e7rIZrOW7NypN1w10dmig88gK55MIGOv** or *USER_PASSWORD* variable in [openssh.env](7daystodie-server/openssh/env/openssh.env).
