# Template for WordPress with Docker

## Usage
```
cd $pwd
git clone https://github.com/shipwebdotjp/docker-wordpress.git wp
cd wp
# Rename .env of postfix for sending mails and include SMTP server information
mv postfix/.env.sample postfix/.env
vi postfix/.env

SMTP_SERVER=smtp.gmail.com
SMTP_USERNAME=example@gmail.com
SMTP_PASSWORD=<Password Here>
SERVER_HOSTNAME=<Your Web Server Domain>

# Rename the mail sending MTA configuration file msmtprc and include the email address in the from field.
mv wordpress/msmtprc.sample wordpress/msmtprc
vi wordpress/msmtprc

from youremail@example.com

# Rewrite VIRTUAL_HOST and LETSENCRYPT_HOST to allow HTTPS access with the domain name
vi docker-compose.yml
      VIRTUAL_HOST: example.com
      LETSENCRYPT_HOST: example.com
      LETSENCRYPT_EMAIL: admin@example.com

# Build & create containers & run with docker compose
sudo docker compose up -d --build
```