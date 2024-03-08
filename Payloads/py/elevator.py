import os
import subprocess

def open_ntsystem_terminal():
    # Copy 'RunAsDate.exe' to the temporary directory
    temp_dir = os.path.join(os.environ["TEMP"], "runasdate")
    os.makedirs(temp_dir, exist_ok=True)
    runasdate_exe = os.path.join(temp_dir, "RunAsDate.exe")
    with open("RunAsDate.zip", "rb") as f:
        with open(runasdate_exe, "wb") as o:
            o.write(f.read())

    # Run 'RunAsDate' with 'cmd' command and elevated privilege
    cmd_path = os.path.join(os.environ["SYSTEMROOT"], "system32", "cmd.exe")
    subprocess.run([runasdate_exe, "/high", cmd_path], shell=True)

if __name__ == "__main__":
    open_ntsystem_terminal()