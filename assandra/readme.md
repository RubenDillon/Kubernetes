En esta carpeta se pueden encontrar los dos yaml para desplegar Cassandra

Una vez desplegado, para saber si esta funcionando

    kubectl exec -it cassandra-0 -n cassandra -- nodetool status

para obtener la password y usuario

    kubectl get secret --namespace "default" cass01-cassandra -o jsonpath="{.data.cassandra-password}" | base64 -d


para acceder a la linea de comando

    kubectl exec -it cass01-cassandra -- cqlsh -u cassandra

para crear una base de datos y generar registros


    CREATE KEYSPACE demodb WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 3 };
    use demodb;
    CREATE TABLE emp(emp_id int PRIMARY KEY, emp_name text, emp_city text, emp_sal varint,emp_phone varint);
I    NSERT INTO emp (emp_id, emp_name, emp_city, emp_phone, emp_sal) VALUES (100, 'Tom', 'Cork', 999, 1000000);
    INSERT INTO emp (emp_id, emp_name, emp_city, emp_phone, emp_sal) VALUES (101, 'Andrew', 'NY', 1000, 1000000);
    INSERT INTO emp (emp_id, emp_name, emp_city, emp_phone, emp_sal) VALUES (102, 'Lara', 'Paris', 1001, 1000000);
    select * from emp;



Revisar ejemplo en 
- https://docs.vmware.com/en/VMware-Tanzu-Kubernetes-Grid-Integrated-Edition/1.17/tkgi/GUID-velero-statefulset-ns.html#deploy-cassandra-database-app-3
- https://docs.bitnami.com/kubernetes/infrastructure/cassandra/get-started/install/
