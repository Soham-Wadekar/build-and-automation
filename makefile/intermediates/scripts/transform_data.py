import os
import json
import subprocess
from datetime import datetime as dt

output = subprocess.run(["bash", "scripts/fetch_data.sh"], 
                        capture_output=True, 
                        text=True).stdout.strip()

processed_output = json.loads(output)["results"][0]

name = processed_output["name"]
location = processed_output["location"]
login = processed_output["login"]
picture = processed_output["picture"]

personal_info = {
    "Name": " ".join([v for v in name.values()]),
    "Location": ", ".join([location["city"], location["state"], location["country"]]),
    "Email": processed_output["email"],
    "Date of Birth": dt.fromisoformat(processed_output["dob"]['date'].replace("Z", "+00:00")).strftime("%Y-%m-%d"),
    "Username": login["username"],
    "Password": login["salt"],  # Encoded password
    "Ph. No.": processed_output["phone"],
    "Profile Picture": picture["large"]
}

with open(f"outputs/{os.getenv('ENV')}/{personal_info['Name']}.txt", "w") as file:
    for k, v in personal_info.items():
        file.write(f"{k}: {v}\n")