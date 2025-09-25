resource "yandex_vpc_network" "netology" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "public" {
  name           = var.vpc_subnet_public
  zone           = var.default_zone
  network_id     = yandex_vpc_network.netology.id
  v4_cidr_blocks = var.vpc_subnet_public_cidr
}

#resource "yandex_vpc_subnet" "private" {
#  name           = var.vpc_subnet_private
#  zone           = var.default_zone
#  network_id     = yandex_vpc_network.netology.id
#  v4_cidr_blocks = var.vpc_subnet_private_cidr
#  route_table_id = yandex_vpc_route_table.nat-instance-route.id
#}

#resource "yandex_vpc_route_table" "nat-instance-route" {
#  name       = "nat-instance-route"
#  network_id = yandex_vpc_network.netology.id
#  static_route {
#    destination_prefix = "0.0.0.0/0"
#    next_hop_address   = yandex_compute_instance.nat_instance.network_interface.0.ip_address
#  }
#}