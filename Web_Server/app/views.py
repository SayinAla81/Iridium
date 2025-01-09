from django.shortcuts import render
import json
from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
from .models import *
# from django.views.decorators.http import require_GET

# @require_GET
@csrf_exempt
def get_bash_file(request):

    with open("statics/script.sh") as my_file:
        file_content = my_file.read()

    response = HttpResponse(file_content, content_type='text/plain')
    return response

@csrf_exempt
def post_info(request):
    if request.method == "POST":
        print("******************************************************")
        data = json.loads(request.body)
        print(data["data"])
        textModel.objects.create(text = data["data"])
    return HttpResponse(data["data"], content_type='application/json')