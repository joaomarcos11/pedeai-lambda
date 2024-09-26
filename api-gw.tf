resource "aws_api_gateway_rest_api" "fiap44" {
    name = "fiap44-apigw"

    endpoint_configuration {
        types = ["REGIONAL"]
    }
}

resource "aws_api_gateway_resource" "root" {
    rest_api_id = aws_api_gateway_rest_api.fiap44.id
    parent_id = aws_api_gateway_rest_api.fiap44.root_resource_id
    path_part = "login"
}

resource "aws_api_gateway_method" "proxy" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.root.id
  http_method = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "lambda_integration" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.root.id
  http_method = aws_api_gateway_method.proxy.http_method
  integration_http_method = "POST"
  type = "AWS"
  uri = aws_lambda_function.auth_lambda_func.invoke_arn
}

resource "aws_api_gateway_method_response" "proxy" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.root.id
  http_method = aws_api_gateway_method.proxy.http_method
  status_code = "200"
}

resource "aws_api_gateway_integration_response" "proxy" {
  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  resource_id = aws_api_gateway_resource.root.id
  http_method = aws_api_gateway_method.proxy.http_method
  status_code = aws_api_gateway_method_response.proxy.status_code

  depends_on = [
    aws_api_gateway_method.proxy,
    aws_api_gateway_integration.lambda_integration
  ]
}

resource "aws_api_gateway_deployment" "deployment" {
  depends_on = [
    aws_api_gateway_integration.lambda_integration,
    # aws_api_gateway_integration.options_integration, # Add this line
  ]

  rest_api_id = aws_api_gateway_rest_api.fiap44.id
  stage_name = "prd"
}

# resource "aws_iam_role_policy_attachment" "lambda_basic" {
#   policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
#   role = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/LabRole"
# }

# resource "aws_lambda_permission" "apigw_lambda" {
#   statement_id = "AllowExecutionFromAPIGateway"
#   action = "lambda:InvokeFunction"
#   function_name = aws_lambda_function.auth_lambda_func.function_name
#   principal = "apigateway.amazonaws.com"

#   source_arn = "${aws_api_gateway_rest_api.my_api.execution_arn}/*/*/*"
# }
