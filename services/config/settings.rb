
USE_DOCKER_COMPOSE = ENV.key?('USE_DOCKER_COMPOSE')
puts ENV.key?('USE_DOCKER_COMPOSE')

JAEGER_HOST = USE_DOCKER_COMPOSE ? 'jaeger-all-in-one' : 'localhost'

FRONTEND_PORT = USE_DOCKER_COMPOSE ? 80 : 8080
FRONTEND_HOST = USE_DOCKER_COMPOSE ? 'frontend' : 'localhost:8080'

# RouteWorkerPoolSize is the size of the worker pool used to query `route` service.
# Can be overwritten from command line.
# RouteWorkerPoolSize = 3
route_worker_pool_size = 3

# 'customer' service

CUSTOMER_PORT = USE_DOCKER_COMPOSE ? 80 : 8081
CUSTOMER_HOST = USE_DOCKER_COMPOSE ? 'customer' : 'localhost:8081'



DRIVER_PORT = USE_DOCKER_COMPOSE ? 80 : 8082
DRIVER_HOST = USE_DOCKER_COMPOSE ? 'driver' : 'localhost:8082'

ROUTE_PORT = USE_DOCKER_COMPOSE ? 80 : 8083
ROUTE_HOST = USE_DOCKER_COMPOSE ? 'route' : 'localhost:8083'
