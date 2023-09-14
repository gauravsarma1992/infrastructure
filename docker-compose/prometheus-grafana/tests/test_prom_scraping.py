from prometheus_client import start_http_server, Counter, Summary, Gauge, CollectorRegistry, push_to_gateway
import random
import time

# Create a metric to track time spent and requests made.
REQUEST_TIME = Summary('request_processing_seconds', 'Time spent processing request')

# Decorate function with metric.
@REQUEST_TIME.time()
def process_request(t):
    """A dummy function that takes some time."""
    time.sleep(t)

if __name__ == '__main__':
    # Start up the server to expose the metrics.
    #start_http_server(8060)

    # Generate some requests.
    registry = CollectorRegistry()
    c = Counter('my_requests_total', 'HTTP Failures', ['method', 'endpoint'], registry=registry)
    g = Gauge('job_last_success_unixtime', 'Last time a batch job successfully finished', registry=registry)

    while True:
        c.labels('get', '/').inc()
        c.labels('post', '/submit').inc()
        process_request(random.random())

        g.set_to_current_time()
        push_to_gateway('pushgateway:9091', job='batchA', registry=registry)