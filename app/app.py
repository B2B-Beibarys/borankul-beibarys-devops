import os
import time

name = os.getenv("STUDENT_NAME", "Beibarys")
surname = os.getenv("STUDENT_SURNAME", "Borankul")
group = os.getenv("STUDENT_GROUP", "IT2-2306")
student_id = os.getenv("STUDENT_ID", "XXXXXX")

print("================================")
print("DevOps Student Application")
print("================================")
print()
print(f"Name: {name}")
print(f"Surname: {surname}")
print(f"Group: {group}")
print(f"Student ID: {student_id}")
print()
print("Application is running successfully!", flush=True)

while True:
    time.sleep(10)
    print("Heartbeat: application is alive", flush=True)
