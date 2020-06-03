# Build RADIUS container with MySQL, Kerberos, LDAP, and NTLM/AD support

FROM alpine:latest

RUN addgroup -S -g 95 radius && \
    adduser -h /var/log/radius -s /sbin/nologin -g radius -G radius -u 95 -D -S -H radius

RUN apk add --no-cache \
  freeradius-eap freeradius-krb5 freeradius-mysql freeradius-ldap freeradius-radclient \
  wpa_supplicant krb5 samba-winbind-clients samba-common-tools ca-certificates

RUN cp /dev/null /etc/keytab && chown root:radius /etc/keytab && chmod 640 /etc/keytab

RUN rm -rf /etc/raddb /etc/samba && \
    mkdir -p /etc/raddb /etc/samba && \
    chown root:radius /etc/raddb /etc/samba && \
    chmod 755 /etc/raddb /etc/samba

EXPOSE 1812 1813 1812/udp 1813/udp

USER radius

VOLUME /etc/raddb
VOLUME /etc/samba
VOLUME /var/log/radius
VOLUME /var/lib/samba/winbindd_privileged

# for debugging, use
CMD [ "/usr/sbin/radiusd", "-X" ]
# and look at the journald log

#CMD [ "/usr/sbin/radiusd", "-f" ]
