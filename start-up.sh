source /vagrant/venv/bin/activate
python manage.py migrate
python manage.py createsuperuser
python manage.py runserver 0.0.0.0:8000
