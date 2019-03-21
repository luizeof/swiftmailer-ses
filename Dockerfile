FROM mautic/mautic:latest

COPY sescron /etc/cron.d/

RUN chmod +x /etc/cron.d/sescron

# Apply necessary permissions
RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["/entrypoint.sh"]

CMD ["apache2-foreground"]
