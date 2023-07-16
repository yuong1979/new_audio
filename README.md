

###########################################
######### Running the project #############
###########################################


###### Running local ###### 

On terminal 1 cmd:
1. `git clone xxx`
2. `cd new_audio`
3. `source venv/bin/activate`
4. `pip install -r requirements.txt`
5. Change debug to TRUE in settings.py in Django
6. `python manage.py makemigrations`
7. `python manage.py migrate`
8. `python manage.py createsuperuser`
9. `python manage.py runserver`

On terminal 2 cmd:
1. `sudo systemctl enable rabbitmq-server`
2. `sudo systemctl start rabbitmq-server`
3. `sudo systemctl status rabbitmq-server`

On terminal 3 cmd:
1. `cd new_audio`
2. `source venv/bin/activate`
3. `celery -A core worker -B -l INFO` (If you want to run both separately, the code is `celery -A core worker -l info --pool=solo` and `celery -A core beat -l info`)

On terminal 4 cmd:
1. `python manage.py shell`
2. `from task1.tasks import add`
3. `add.delay(2,2)`


On URL: http://127.0.0.1:8000/reviews - test send of email


###### Running production ######

1. `git clone xxx`
2. `cd new_audio`
3. `docker build -t django_image:latest .`
4. `docker run django_image:latest`


