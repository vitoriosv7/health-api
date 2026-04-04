from fastapi import FastAPI
import psutil

app = FastAPI()

@app.get("/")
def root():
    return {"message": "API rodando 🚀"}

@app.get("/health")
def health():
    return {
        "cpu": psutil.cpu_percent(interval=1),
        "ram": psutil.virtual_memory().percent,
        "disk": psutil.disk_usage('/').percent
    }
