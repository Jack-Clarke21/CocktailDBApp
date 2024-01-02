from fastapi import FastAPI
import psycopg2
from psycopg2.extras import RealDictCursor
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()

conn = psycopg2.connect(
    dbname="cocktaildb",
    user="Jack",
    host="127.0.0.1",
    port="5432"
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/drinks/random")
async def get_random_drink():
    with conn.cursor(cursor_factory=RealDictCursor) as cur:
        cur.execute("SELECT * FROM drinks ORDER BY RANDOM() LIMIT 1")
        random_drink = cur.fetchone()
        return {"drinks": [random_drink]}
