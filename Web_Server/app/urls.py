

from django.urls import path
from .views import *

urlpatterns = [
    path('post-info/', post_info , name='receive_file'),
    path('get-script/', get_bash_file,name='getBashFromWebServer'),
    # Add other URL patterns as needed
]