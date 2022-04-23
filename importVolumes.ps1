#Recreate drupal volumes
docker volume create drupal_modules 
docker volume create drupal_profiles 
docker volume create drupal_themes 
docker volume create drupal_sites 

#Recreate mysql volumes
docker volume create mysql_data 

#Import drupal data
docker run --rm -v drupal_modules:/var/www/html/modules -v drupal_profiles:/var/www/html/profiles -v drupal_themes:/var/www/html/themes -v drupal_sites:/var/www/html/sites -v ${pwd}/backup:/backup ubuntu bash -c "cd / && tar xvf /backup/drupalBackup.tar"

#Import msqyl data
docker run --rm -v mysql_data:/var/lib/mysql -v ${pwd}/backup:/backup ubuntu bash -c "cd / && tar xvf /backup/mysqlBackup.tar"

