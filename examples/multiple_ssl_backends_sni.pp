
# frontend env_ssl_frontend
#   bind *:443
#   mode tcp
#   option tcplog
#   tcp-request inspect-delay 10s
#   tcp-request content accept if { req_ssl_hello_type 1 }
#   use_backend bk_app1 if { req.ssl_sni -m end app1.domain.com }
#   use_backend bk_app2 if { req.ssl_sni -m end app2.domain.com }
#   use_backend bk_app3 if { req.ssl_sni -m end app3.domain.com }
#
# backend bk_app1
#   balance source
#   mode tcp
#   option ssl-hello-chk
#   server main 127.0.0.1:3000
# backend bk_app2
#   balance source
#   mode tcp
#   option ssl-hello-chk
#   server main 127.0.0.1:3001
# backend bk_app3
#   balance source
#   mode tcp
#   option ssl-hello-chk
#   server main 127.0.0.1:3002
