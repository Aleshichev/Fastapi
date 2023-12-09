from fastapi_cache import FastAPICache
from fastapi import FastAPI
from fastapi_cache.backends.redis import RedisBackend
from redis import asyncio as aioredis


redis = aioredis.from_url("redis://localhost", encoding="utf8", decode_responses=True)


async def init_redis() -> None:
    FastAPICache.init(RedisBackend(redis), prefix="fastapi-cache")


async def lifespan(app: FastAPI):
    await init_redis()
    yield