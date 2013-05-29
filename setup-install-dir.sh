RAILS_APP_DIR=install-dir/ClientManagementServer

rm -r $RAILS_APP_DIR
mkdir $RAILS_APP_DIR

cp -r app/ $RAILS_APP_DIR/
cp client_management_service.py $RAILS_APP_DIR/
cp -r config $RAILS_APP_DIR/
cp config.ru $RAILS_APP_DIR/
cp -r db $RAILS_APP_DIR/
cp Gemfile.windows $RAILS_APP_DIR/Gemfile
cp -r lib $RAILS_APP_DIR/
cp -r public $RAILS_APP_DIR/
cp -r script $RAILS_APP_DIR/