#### silentcast vnc service for docker, creates tty gif or browser gif

### Image Size

* [![Latest](https://badge.imagelayers.io/danielguerra/silentcast.svg)](https://imagelayers.io/?images=danielguerra/silentcast:latest 'latest') danielguerra/silentcast

### Summary
Creates animated gif from any xwindow with a wizzard.

Terminal example :
![anim](https://raw.githubusercontent.com/danielguerra69/silentcast/master/term.gif)

Firefox example :
![anim](https://raw.githubusercontent.com/danielguerra69/silentcast/master/anim.gif)

### Usage

Start silentcast vnc server

```bash
docker run --name silentcast -v $(pwd):/home/silencast/silentcast -d -p 5900:5900 danielguerra/silentcast
```
& check
```bash
docker logs silentcast
```
After this use a vnc client to connect (dockerhost:5900)
Everything should start automaticly.

Need sudo rights to install something or whatever, the password is silentcast
```bash
sudo -p silentcast su -
```

I'm having trouble with fullscreen capture...
But, interior of a window captures, go fine
