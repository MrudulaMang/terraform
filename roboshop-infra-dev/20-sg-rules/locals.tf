locals {
   my_ip =  "${chomp(data.http.my_public_ip_v4.response_body)}/32" 
   bastian_sg_id = data.aws_ssm_parameter.bastian_sg_id.id
   mongodb_sg_id = data.aws_ssm_parameter.mongodb_sg_id.id
   catalogue_sg_id = data.aws_ssm_parameter.catalogue_sg_id.id
   user_sg_id = data.aws_ssm_parameter.user_sg_id.id
   shipping_sg_id = data.aws_ssm_parameter.shipping_sg_id.id
   payment_sg_id = data.aws_ssm_parameter.payment_sg_id.id

   redis_sg_id = data.aws_ssm_parameter.redis_sg_id.id
   mysql_sg_id = data.aws_ssm_parameter.mysql_sg_id.id
   rabbitmq_sg_id = data.aws_ssm_parameter.rabbitmq_sg_id.id
   
}