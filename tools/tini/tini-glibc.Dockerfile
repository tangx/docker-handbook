FROM nginx
ADD tini-amd64 /sbin/tini
RUN chmod +x /sbin/tini

# /sbin/tini -- /usr/sbin/nginx  -g 'daemon off';

## no.1 ok 
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

## no.2 ok
# ENTRYPOINT ["/sbin/tini", "--", "/usr/sbin/nginx", "-g", "daemon off;"]

