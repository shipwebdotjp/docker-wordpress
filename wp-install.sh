#!/bin/bash

# .envファイルを読み込む
source ./.env

# WP_URL変数を作成
if [ "${WP_PORT}" = "80" ]; then
  WP_URL="${WP_HOST}"
else
  WP_URL="${WP_HOST}:${WP_PORT}"
fi

# WordPressセットアップ admin_user,admin_passwordは管理画面のログインID,PW
docker compose run --rm cli bash -c "wp core install \
--url='http://${WP_URL}' \
--title='WP Test' \
--admin_user='${WP_USER}' \
--admin_password='${WP_PASSWORD}' \
--admin_email='${WP_ADMINMAIL}' \
--allow-root \
&& wp language core install ja --activate --allow-root \
&& wp option update timezone_string 'Asia/Tokyo' --allow-root \
&& wp option update date_format 'Y-m-d' --allow-root \
&& wp option update time_format 'H:i' --allow-root \
&& wp plugin delete hello.php --allow-root \
&& wp plugin delete akismet --allow-root \
&& wp plugin install all-in-one-wp-migration --activate --allow-root"

# プラグインのインストール (必要に応じてコメントアウトを外す)
# wp plugin install wp-multibyte-patch --activate --allow-root
# wp plugin install backwpup --activate --allow-root
# wp plugin install siteguard --activate --allow-root
# wp plugin install contact-form-7 --activate --allow-root
# wp plugin install wp-mail-smtp --activate --allow-root
# wp plugin install all-in-one-seo-pack --activate --allow-root
# wp plugin install broken-link-checker --activate --allow-root
# wp plugin install addquicktag --activate --allow-root

# テーマの削除
#wp theme delete twentysixteen --allow-root
#wp theme delete twentyseventeen --allow-root
#wp theme delete twentynineteen --allow-root
# wp theme delete twentytwenty --allow-root

# パーマリンク更新
#wp option update permalink_structure /%postname%/ --allow-root