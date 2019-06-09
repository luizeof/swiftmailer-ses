FROM mautic/mautic:latest

COPY sescron /etc/cron.d/

RUN chmod +x /etc/cron.d/sescron