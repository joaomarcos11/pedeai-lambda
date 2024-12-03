resource "aws_api_gateway_rest_api" "fiap44" {
    name = "fiap44-apigw"

    endpoint_configuration {
        types = ["REGIONAL"]
    }
}

#####
## pedidos
#####

resource "aws_api_gateway_resource" "pedidos" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  parent_id = aws_api_gateway_rest_api.fiap44.root_resource_id
  path_part = "pedidos"
}

resource "aws_api_gateway_method" "pedidos_post" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.pedidos.id
  http_method = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "pedidos_get" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.pedidos.id
  http_method = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "pedidos_put" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.pedidos.id
  http_method = "PUT"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "pedidos_post" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.pedidos.id
  http_method = aws_api_gateway_method.pedidos_post.http_method
  integration_http_method = "POST"
  type = "HTTP"
  connection_type = "VPC_LINK"
  connection_id = aws_api_gateway_vpc_link.fiap44-vpc-link.id
  uri = "http://${data.aws_lb.fiap44-alb.dns_name}/pedidos"
}

resource "aws_api_gateway_integration" "pedidos_get" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.pedidos.id
  http_method = aws_api_gateway_method.pedidos_get.http_method
  integration_http_method = "GET"
  type = "HTTP"
  connection_type = "VPC_LINK"
  connection_id = aws_api_gateway_vpc_link.fiap44-vpc-link.id
  uri = "http://${data.aws_lb.fiap44-alb.dns_name}/pedidos"
}

resource "aws_api_gateway_integration" "pedidos_put" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.pedidos.id
  http_method = aws_api_gateway_method.pedidos_put.http_method
  integration_http_method = "PUT"
  type = "HTTP"
  connection_type = "VPC_LINK"
  connection_id = aws_api_gateway_vpc_link.fiap44-vpc-link.id
  uri = "http://${data.aws_lb.fiap44-alb.dns_name}/pedidos"
}

resource "aws_api_gateway_method_response" "pedidos_post" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.pedidos.id
  http_method = aws_api_gateway_method.pedidos_post.http_method
  status_code = "201"
}

resource "aws_api_gateway_method_response" "pedidos_get" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.pedidos.id
  http_method = aws_api_gateway_method.pedidos_get.http_method
  status_code = "200"
}

resource "aws_api_gateway_method_response" "pedidos_put" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.pedidos.id
  http_method = aws_api_gateway_method.pedidos_put.http_method
  status_code = "204"
}

resource "aws_api_gateway_integration_response" "pedidos_post" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.pedidos.id
  http_method = aws_api_gateway_method.pedidos_post.http_method
  status_code = aws_api_gateway_method_response.pedidos_post.status_code

  depends_on = [
    aws_api_gateway_method.pedidos_post,
    aws_api_gateway_integration.pedidos_post,
  ]
}

resource "aws_api_gateway_integration_response" "pedidos_get" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.pedidos.id
  http_method = aws_api_gateway_method.pedidos_get.http_method
  status_code = aws_api_gateway_method_response.pedidos_get.status_code

  depends_on = [
    aws_api_gateway_method.pedidos_get,
    aws_api_gateway_integration.pedidos_get,
  ]
}

resource "aws_api_gateway_integration_response" "pedidos_put" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.pedidos.id
  http_method = aws_api_gateway_method.pedidos_put.http_method
  status_code = aws_api_gateway_method_response.pedidos_put.status_code

  depends_on = [
    aws_api_gateway_method.pedidos_put,
    aws_api_gateway_integration.pedidos_put,
  ]
}

#####
## clientes
#####

resource "aws_api_gateway_resource" "clientes" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  parent_id = aws_api_gateway_rest_api.fiap44.root_resource_id
  path_part = "clientes"
}

resource "aws_api_gateway_method" "clientes_post" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.clientes.id
  http_method = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "clientes_get" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.clientes.id
  http_method = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "clientes_put" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.clientes.id
  http_method = "PUT"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "clientes_delete" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.clientes.id
  http_method = "DELETE"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "clientes_post" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.clientes.id
  http_method = aws_api_gateway_method.clientes_post.http_method
  integration_http_method = "POST"
  type = "HTTP"
  connection_type = "VPC_LINK"
  connection_id = aws_api_gateway_vpc_link.fiap44-vpc-link.id
  uri = "http://${data.aws_lb.fiap44-alb.dns_name}/v1/clientes"
}

resource "aws_api_gateway_integration" "clientes_get" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.clientes.id
  http_method = aws_api_gateway_method.clientes_get.http_method
  integration_http_method = "GET"
  type = "HTTP"
  connection_type = "VPC_LINK"
  connection_id = aws_api_gateway_vpc_link.fiap44-vpc-link.id
  uri = "http://${data.aws_lb.fiap44-alb.dns_name}/v1/clientes"
}

resource "aws_api_gateway_integration" "clientes_put" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.clientes.id
  http_method = aws_api_gateway_method.clientes_put.http_method
  integration_http_method = "PUT"
  type = "HTTP"
  connection_type = "VPC_LINK"
  connection_id = aws_api_gateway_vpc_link.fiap44-vpc-link.id
  uri = "http://${data.aws_lb.fiap44-alb.dns_name}/v1/clientes"
}

resource "aws_api_gateway_integration" "clientes_delete" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.clientes.id
  http_method = aws_api_gateway_method.clientes_delete.http_method
  integration_http_method = "DELETE"
  type = "HTTP"
  connection_type = "VPC_LINK"
  connection_id = aws_api_gateway_vpc_link.fiap44-vpc-link.id
  uri = "http://${data.aws_lb.fiap44-alb.dns_name}/v1/clientes"
}

resource "aws_api_gateway_method_response" "clientes_post" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.clientes.id
  http_method = aws_api_gateway_method.clientes_post.http_method
  status_code = "201"
}

resource "aws_api_gateway_method_response" "clientes_get" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.clientes.id
  http_method = aws_api_gateway_method.clientes_get.http_method
  status_code = "200"
}

resource "aws_api_gateway_method_response" "clientes_put" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.clientes.id
  http_method = aws_api_gateway_method.clientes_put.http_method
  status_code = "204"
}

resource "aws_api_gateway_method_response" "clientes_delete" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.clientes.id
  http_method = aws_api_gateway_method.clientes_delete.http_method
  status_code = "200"
}

resource "aws_api_gateway_integration_response" "clientes_post" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.clientes.id
  http_method = aws_api_gateway_method.clientes_post.http_method
  status_code = aws_api_gateway_method_response.clientes_post.status_code

  depends_on = [
    aws_api_gateway_method.clientes_post,
    aws_api_gateway_integration.clientes_post,
  ]
}

resource "aws_api_gateway_integration_response" "clientes_get" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.clientes.id
  http_method = aws_api_gateway_method.clientes_get.http_method
  status_code = aws_api_gateway_method_response.clientes_get.status_code

  depends_on = [
    aws_api_gateway_method.clientes_get,
    aws_api_gateway_integration.clientes_get,
  ]
}

resource "aws_api_gateway_integration_response" "clientes_put" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.clientes.id
  http_method = aws_api_gateway_method.clientes_put.http_method
  status_code = aws_api_gateway_method_response.clientes_put.status_code

  depends_on = [
    aws_api_gateway_method.clientes_put,
    aws_api_gateway_integration.clientes_put,
  ]
}

resource "aws_api_gateway_integration_response" "clientes_delete" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.clientes.id
  http_method = aws_api_gateway_method.clientes_delete.http_method
  status_code = aws_api_gateway_method_response.clientes_delete.status_code

  depends_on = [
    aws_api_gateway_method.clientes_delete,
    aws_api_gateway_integration.clientes_delete,
  ]
}

# #####
# ## itens
# #####

resource "aws_api_gateway_resource" "itens" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  parent_id = aws_api_gateway_rest_api.fiap44.root_resource_id
  path_part = "itens"
}

resource "aws_api_gateway_method" "itens_get" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.itens.id
  http_method = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "itens_post" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.itens.id
  http_method = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "itens_put" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.itens.id
  http_method = "PUT"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "itens_delete" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.itens.id
  http_method = "DELETE"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "itens_get" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.itens.id
  http_method = aws_api_gateway_method.itens_get.http_method
  integration_http_method = "GET"
  type = "HTTP"
  connection_type = "VPC_LINK"
  connection_id = aws_api_gateway_vpc_link.fiap44-vpc-link.id
  uri = "http://${data.aws_lb.fiap44-alb.dns_name}/itens"
}

resource "aws_api_gateway_integration" "itens_post" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.itens.id
  http_method = aws_api_gateway_method.itens_post.http_method
  integration_http_method = "POST"
  type = "HTTP"
  connection_type = "VPC_LINK"
  connection_id = aws_api_gateway_vpc_link.fiap44-vpc-link.id
  uri = "http://${data.aws_lb.fiap44-alb.dns_name}/itens"
}

resource "aws_api_gateway_integration" "itens_put" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.itens.id
  http_method = aws_api_gateway_method.itens_put.http_method
  integration_http_method = "PUT"
  type = "HTTP"
  connection_type = "VPC_LINK"
  connection_id = aws_api_gateway_vpc_link.fiap44-vpc-link.id
  uri = "http://${data.aws_lb.fiap44-alb.dns_name}/itens"
}

resource "aws_api_gateway_integration" "itens_delete" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.itens.id
  http_method = aws_api_gateway_method.itens_delete.http_method
  integration_http_method = "DELETE"
  type = "HTTP"
  connection_type = "VPC_LINK"
  connection_id = aws_api_gateway_vpc_link.fiap44-vpc-link.id
  uri = "http://${data.aws_lb.fiap44-alb.dns_name}/itens"
}

resource "aws_api_gateway_method_response" "itens_get" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.itens.id
  http_method = aws_api_gateway_method.itens_get.http_method
  status_code = "200"
}

resource "aws_api_gateway_method_response" "itens_post" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.itens.id
  http_method = aws_api_gateway_method.itens_post.http_method
  status_code = "201"
}

resource "aws_api_gateway_method_response" "itens_put" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.itens.id
  http_method = aws_api_gateway_method.itens_put.http_method
  status_code = "204"
}

resource "aws_api_gateway_method_response" "itens_delete" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.itens.id
  http_method = aws_api_gateway_method.itens_delete.http_method
  status_code = "200"
}

resource "aws_api_gateway_integration_response" "itens_get" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.itens.id
  http_method = aws_api_gateway_method.itens_get.http_method
  status_code = aws_api_gateway_method_response.itens_get.status_code

  depends_on = [
    aws_api_gateway_method.itens_get,
    aws_api_gateway_integration.itens_get,
  ]
}

resource "aws_api_gateway_integration_response" "itens_post" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.itens.id
  http_method = aws_api_gateway_method.itens_post.http_method
  status_code = aws_api_gateway_method_response.itens_post.status_code

  depends_on = [
    aws_api_gateway_method.itens_post,
    aws_api_gateway_integration.itens_post,
  ]
}

resource "aws_api_gateway_integration_response" "itens_put" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.itens.id
  http_method = aws_api_gateway_method.itens_put.http_method
  status_code = aws_api_gateway_method_response.itens_put.status_code

  depends_on = [
    aws_api_gateway_method.itens_put,
    aws_api_gateway_integration.itens_put,
  ]
}

resource "aws_api_gateway_integration_response" "itens_delete" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.itens.id
  http_method = aws_api_gateway_method.itens_delete.http_method
  status_code = aws_api_gateway_method_response.itens_delete.status_code

  depends_on = [
    aws_api_gateway_method.itens_delete,
    aws_api_gateway_integration.itens_delete,
  ]
}

# #####
# ## pagamento
# #####

resource "aws_api_gateway_resource" "pagamento" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  parent_id = aws_api_gateway_rest_api.fiap44.root_resource_id
  path_part = "pagamento"
}

resource "aws_api_gateway_method" "pagamento" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.pagamento.id
  http_method = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "pagamento" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.pagamento.id
  http_method = aws_api_gateway_method.pagamento.http_method
  integration_http_method = "POST"
  type = "HTTP"
  connection_type = "VPC_LINK"
  connection_id = aws_api_gateway_vpc_link.fiap44-vpc-link.id
  uri = "http://${data.aws_lb.fiap44-alb.dns_name}/api/pagamento"
}

resource "aws_api_gateway_method_response" "pagamento" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.pagamento.id
  http_method = aws_api_gateway_method.pagamento.http_method
  status_code = "201"
}

resource "aws_api_gateway_integration_response" "pagamento" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.pagamento.id
  http_method = aws_api_gateway_method.pagamento.http_method
  status_code = aws_api_gateway_method_response.pagamento.status_code

  depends_on = [
    aws_api_gateway_method.pagamento,
    aws_api_gateway_integration.pagamento,
  ]
}

#####
## login (lambda)
#####

resource "aws_api_gateway_resource" "login" {
    rest_api_id = aws_api_gateway_rest_api.fiap44.id
    parent_id = aws_api_gateway_rest_api.fiap44.root_resource_id
    path_part = "login"
}

resource "aws_api_gateway_method" "login" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.login.id
  http_method = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "login" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.login.id
  http_method = aws_api_gateway_method.login.http_method
  integration_http_method = "POST"
  type = "AWS_PROXY"
  uri = aws_lambda_function.auth_lambda_func.invoke_arn
}

resource "aws_api_gateway_method_response" "login" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.login.id
  http_method = aws_api_gateway_method.login.http_method
  status_code = "200"
}

resource "aws_api_gateway_integration_response" "login" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.login.id
  http_method = aws_api_gateway_method.login.http_method
  status_code = aws_api_gateway_method_response.login.status_code

  depends_on = [
    aws_api_gateway_method.login,
    aws_api_gateway_integration.login,
  ]
}

#####
## api gw deploy
#####

resource "aws_api_gateway_deployment" "deployment" {
  depends_on = [
    aws_api_gateway_integration.pedidos_get,
    aws_api_gateway_integration.pedidos_post,
    aws_api_gateway_integration.pedidos_put,
    aws_api_gateway_integration.clientes_get,
    aws_api_gateway_integration.clientes_post,
    aws_api_gateway_integration.clientes_put,
    aws_api_gateway_integration.clientes_delete,
    aws_api_gateway_integration.itens_get,
    aws_api_gateway_integration.itens_post,
    aws_api_gateway_integration.itens_put,
    aws_api_gateway_integration.itens_delete,
    aws_api_gateway_integration.pagamento,
    aws_api_gateway_integration.login,
    # aws_api_gateway_integration.options_integration, # Add this line
  ]

  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  stage_name = "prd"
}

resource "aws_lambda_permission" "lambda_permission" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.auth_lambda_func.function_name
  principal     = "apigateway.amazonaws.com"

  # The /* part allows invocation from any stage, method and resource path
  # within API Gateway.
  source_arn = "${aws_api_gateway_rest_api.fiap44.execution_arn}/*"
}

data "aws_lb" "fiap44-alb" {
  tags = {
    "kubernetes.io/service-name" = "default/ingress-nginx-controller"
  }
}

resource "aws_api_gateway_vpc_link" "fiap44-vpc-link" {
  name        = "fiap44-vpc-link"
  target_arns = [ "${data.aws_lb.fiap44-alb.arn}" ]
}

