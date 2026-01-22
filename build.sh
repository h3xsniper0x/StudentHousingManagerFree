#!/usr/bin/env bash
# Exit on error
set -o errexit

# Install dependencies
pip install -r requirements.txt

# Convert static files
python manage.py collectstatic --noinput

# Apply database migrations
python manage.py migrate
# إنشاء Superuser تلقائياً إذا لم يكن موجوداً
python manage.py shell <<EOF
from django.contrib.auth import get_user_model
User = get_user_model()
if not User.objects.filter(username='admin').exists():
    User.objects.create_superuser('admin', 'admin@example.com', '782007038~!@')
    print('Superuser created successfully')
else:
    print('Superuser already exists')
EOF
