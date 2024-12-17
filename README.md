#Installing OSDF Pelican based Origin/Cache 
This documents a simple docker-compose recipe to run an OSDF Origin and cache 


#Bringup 
- `./run-origin.sh
```
]$ docker-compose -f docker-compose-origin.yml up
[+] Running 1/0
Attaching to fdp-origin
fdp-origin  | Starting Pelican...
fdp-origin  | Running pelican with arguments: origin serve -f https://osdf-director.osg-htc.org -v /mnt/origin:/fdp-hpe
fdp-origin  | Pelican admin interface is not initialized
fdp-origin  |  To initialize, login at https://b8edf418a0b7:8444/view/initialization/code/ with the following code:
fdp-origin  | 373937
```

-`./run-cache.sh`
```
]$ docker-compose up
[+] Running 1/0
 ✔ Container fdp-cache  Recreated                                                            0.1s
Attaching to fdp-cache
fdp-cache  | Starting Pelican...
fdp-cache  | Running pelican with arguments: cache serve -f https://osdf-director.osg-htc.org
fdp-cache  | Pelican admin interface is not initialized
fdp-cache  |  To initialize, login at https://62d6a76d58af:8444/view/initialization/code/ with the following code:
fdp-cache  | 134177

```
