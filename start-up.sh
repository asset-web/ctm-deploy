source /vagrant/venv/bin/activate
cd /vagrant/src/check_the_map
python manage.py migrate
python manage.py createsuperuser
