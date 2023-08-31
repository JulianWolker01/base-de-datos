import subprocess
import os

repo = [

        "https://github.com/JulianWolker01/base-de-datos.git"

]

github_token = "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"


for repo_url in repo:
    # Extraer el nombre del repositorio de la URL
    repo_name = repo_url.split("/")[-1].replace(".git", "")

    # Verificar si el repositorio ya existe en el directorio
    if os.path.exists(repo_name):
        print(f"El repositorio {repo_name} ya existe en el directorio.")
        continue  

       # Comando para clonar el repositorio con autenticación usando el token
    command = ["git", "clone", repo_url]
    
    try:
        # Establecer la variable de entorno para la autenticación con el token
        env = dict(os.environ, GIT_TERMINAL_PROMPT="0", GIT_ASKPASS="/bin/true")
        env["GIT_ASKPASS"] = "echo"

        # Agregar el token como cabecera de autorización para la clonación
        headers = f"Authorization: token {github_token}"
        env["GIT_HTTP_HEADER"] = headers
        
        # Ejecutar el comando de clonación con la configuración de la variable de entorno
        subprocess.run(command, check=True, env=env)
        print(f"Repositorio {repo_name} clonado exitosamente.")
    except subprocess.CalledProcessError as e:
        print(f"Error al clonar el repositorio {repo_name}: {e}")


