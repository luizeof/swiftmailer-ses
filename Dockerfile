FROM mautic/mautic:latest

RUN apt-get update ; apt-get install -u htop

COPY sescron /etc/cron.d/

RUN chmod +x /etc/cron.d/sescron

COPY mautic-emails-send /usr/bin/

RUN chmod +x /usr/bin/mautic-emails-send

# Apply necessary permissions
RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["/entrypoint.sh"]

CMD ["apache2-foreground"]
