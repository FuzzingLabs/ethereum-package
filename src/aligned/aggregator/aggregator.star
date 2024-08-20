IMAGE_NAME = "aggregator:latest"
SERVICE_NAME = "aligned-aggregator"

ENTRYPOINT_ARGS = ["/bin/aggregator"]

# The min/max CPU/memory that aligned-aggregator can use
MIN_CPU = 100
MAX_CPU = 1000
MIN_MEMORY = 256
MAX_MEMORY = 512


def launch_aggregator(
    plan,
    prefunded_addresses,
    el_uri,
    global_node_selectors,
):
    plan.print("Launching aligned-aggregator")
    config = get_config(
        prefunded_addresses,
        el_uri,
        global_node_selectors,
    )
    plan.add_service(SERVICE_NAME, config)


# TODO: add -config $(AGG_CONFIG_FILE)
def get_config(
    prefunded_addresses,
    el_uri,
    node_selectors,
):
    return ServiceConfig(
        image=IMAGE_NAME,
        entrypoint=ENTRYPOINT_ARGS,
        cmd=[
            "",
        ],
        min_cpu=MIN_CPU,
        max_cpu=MAX_CPU,
        min_memory=MIN_MEMORY,
        max_memory=MAX_MEMORY,
        node_selectors=node_selectors,
    )
