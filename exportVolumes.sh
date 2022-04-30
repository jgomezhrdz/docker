dir="${pwd}/backup"

if [[ ! -d $dir ]]; then
    mkdir -p $dir
fi

#Export drupal volumes
docker run --rm --volumes-from drupal -v ${dir}:/backup ubuntu bash -c "tar cvf /backup/drupalBackup.tar /var/www/html/modules /var/www/html/profiles /var/www/html/themes /var/www/html/sites"

#Export mysql volumes
docker run --rm --volumes-from drupal_database -v ${dir}:/backup ubuntu bash -c "tar cvf /backup/mysqlBackup.tar /var/lib/mysql"