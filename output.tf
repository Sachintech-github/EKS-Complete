output "cluster_id" {
  value = aws_eks_cluster.sachin.id
}

output "node_group_id" {
  value = aws_eks_node_group.sachin.id
}

output "vpc_id" {
  value = aws_vpc.sachin_vpc.id
}

output "subnet_ids" {
  value = aws_subnet.sachin_subnet[*].id
}
