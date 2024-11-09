# My Workflow

1. Create a new Helm library with the command:
   ```sh
   helm create helm-hw
   ```
2. Clear out the [values.yaml](helm-hw/values.yaml) file and `templates` directory.
3. Add all the necessary parameters for creating the deployment and service to [values.yaml](helm-hw/values.yaml).
4. Create [\_helpers.tpl](helm-hw/templates/_helpers.tpl) in the `templates` directory, and add the following two helpers:
   1. **labels** - This helper includes all four relevant labels as specified in the exercises:
      1. generator
      2. app-name
      3. date
      4. version
   2. **serviceType** - This helper contains the logic to set the type of service.
5. Create [deployment.yaml](helm-hw/templates/deployment.yaml) and [service.yaml](helm-hw/templates/service.yaml) in the `templates` directory and configure all settings for the deployment and service.
6. Verify everything is correct and preview the templates with this command:

   ```sh
   helm install helm-hw ./helm-hw --debug --dry-run
   ```

   command output:

   ```sh
   install.go:224: 2024-11-09 18:15:29.076558396 +0200 IST m=+0.092183433 [debug] Original chart version: ""
   install.go:241: 2024-11-09 18:15:29.076866633 +0200 IST m=+0.092491657 [debug] CHART PATH: /home/ubuntu/helm_hw

   NAME: hw
   LAST DEPLOYED: Sat Nov  9 18:15:29 2024
   NAMESPACE: default
   STATUS: pending-install
   REVISION: 1
   TEST SUITE: None
   USER-SUPPLIED VALUES:
   {}

   COMPUTED VALUES:
   ENV: prod
   deployment:
   exposed_port: 8080
   image: yanivomc/spring-music:latest
   replicas: 2
   service:
   externalPort: 80
   internalPort: 8080

   HOOKS:
   MANIFEST:
   ---
   # Source: helm-hw/templates/service.yaml
   apiVersion: v1
   kind: Service
   metadata:
   name: service-hw-helm-hw-0.1.0
   labels:

       generator: helm
       app-name: helm-hw
       date: 2024-11-09
       version: 0.1.0
   spec:

   type: LoadBalancer
   ports:
   - port: 80
       targetPort: 8080
       protocol: TCP

   selector:

       generator: helm
       app-name: helm-hw
       date: 2024-11-09
       version: 0.1.0
   ---
   # Source: helm-hw/templates/deployment.yaml
   apiVersion: apps/v1
   kind: Deployment
   metadata:
   name: "hw-helm-hw-0.1.0"
   labels:
   spec:
   selector:
       matchLabels:

       generator: helm
       app-name: helm-hw
       date: 2024-11-09
       version: 0.1.0
   replicas: 2
   template:
       metadata:
       labels:

           generator: helm
           app-name: helm-hw
           date: 2024-11-09
           version: 0.1.0
       spec:
       containers:
       - name: helm-hw
           image: yanivomc/spring-music:latest
           ports:
           - containerPort: 8080

   ```

7. Install and run the Helm package with the following command:
   ```sh
   helm install helm-hw ./helm-hw
   ```
8. Verify the deployment and service were created successfully with:

   ```sh
   kubectl get svc && kubectl get deploy
   ```

   commands response:

   ```
   NAME                      TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
    kubernetes                ClusterIP      --.--.--.--      <none>       443/TCP        24d
    service-helm-hw-helm-hw   LoadBalancer   --.--.--.--   --.--.--.--     80:31320/TCP   58m

    NAME                    READY   UP-TO-DATE   AVAILABLE   AGE
    helm-hw-helm-hw-0.1.0   2/2     2            2           58m
   ```

9. Send a curl request to verify everything is working as expected:

   ```sh
   curl --.--.--.--
   # response:
   <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml" class="en" ng-app="SpringMusic">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="description" content="Spring Music">
        <meta name="title" content="Spring Music">
        <link rel="shortcut icon" href="favicon.ico">
        <title>Spring Music</title>

        <link rel="stylesheet" type="text/css" href="webjars/bootstrap/3.1.1/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/app.css">
        <link rel="stylesheet" type="text/css" href="css/multi-columns-row.css">
    </head>

    <body>
        <div class="container">
            <div class="row">
                <div ng-include="'templates/header.html'"></div>
            </div>

            <div id="body" class="row">
                <ng-view></ng-view>
            </div>

            <div class="row">
                <div ng-include="'templates/footer.html'"></div>
            </div>
        </div>

        <script type="text/javascript" src="webjars/jquery/2.1.0/jquery.min.js"></script>

        <script type="text/javascript" src="webjars/angularjs/1.2.16/angular.js"></script>
        <script type="text/javascript" src="webjars/angularjs/1.2.16/angular-resource.js"></script>
        <script type="text/javascript" src="webjars/angularjs/1.2.16/angular-route.js"></script>
        <script type="text/javascript" src="webjars/angular-ui/0.4.0/angular-ui.js"></script>
        <script type="text/javascript" src="webjars/angular-ui-bootstrap/0.10.0/ui-bootstrap.js"></script>
        <script type="text/javascript" src="webjars/angular-ui-bootstrap/0.10.0/ui-bootstrap-tpls.js"></script>

        <script type="text/javascript" src="webjars/bootstrap/3.1.1/js/bootstrap.js"></script>

        <script type="text/javascript" src="js/app.js"></script>
        <script type="text/javascript" src="js/albums.js"></script>
        <script type="text/javascript" src="js/errors.js"></script>
        <script type="text/javascript" src="js/info.js"></script>
        <script type="text/javascript" src="js/status.js"></script>
    </body>
    </html>
   ```
