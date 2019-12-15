/// @desc
client = network_create_socket(network_socket_tcp)
network_connect_raw(client, SERVER_IP, 5050)