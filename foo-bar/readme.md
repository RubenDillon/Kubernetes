Set de despliegues para mostrar a traves de Contour, como se puede realizar Canary Deployment.

La idea original es desplegar la aplicacion foo-bar... que permite a traves del despliegue del Deployment, el Servicio y del Ingress... 
apuntar al ingress (envoy) y si ponemos foo.bar.com/foo... nos lleva a un servicio (S1) y si ponemos foo.bar.com/s2... nos lleva al otro

Modificado el ingress por el HTTPProxy... la idea es tener v1 y v2 del aplicativo

Se debe borrar el Ingress... desplegar el despliegue y servicio para la version 2 del aplicativo

Desplegar el HTTPPRoxy


Usando el siguiente comando
while true; do curl -s foo.bar.com ; done


Podemos ver mas facil, como rota la version de la aplicacion que va respondiendo...

