Ejemplos para exponer servicios con Tanzu Service Mesh

En este caso estamos simulando dos versiones de una misma aplicacion, pero.... 
  la v1 de la aplicacion, es un NGINX
  la v2 de la aplicacion, es un Apache

para que se vea la diferencia, entre las dos versiones...


Pasos a seguir
  deploy.yaml
  gateway.yaml
  rule.yaml
  
  Si quiero mostrar round robin uso
    virtualservice.yaml
    
 Si quiero mostrar solo uno de los dos deployments
    virtual-v1.yaml
    
    
 Si quiero mostrar como distribuir la carga x% en la version 1 y y% en la version 2
     virtual-weight.yaml
