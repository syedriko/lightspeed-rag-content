"""Utility script for querying RAG database."""

import argparse
import os
import psycopg2

from sqlalchemy import make_url

from llama_index.core import Settings, VectorStoreIndex
from llama_index.core.llms.utils import resolve_llm
from llama_index.core.storage.storage_context import StorageContext
from llama_index.embeddings.huggingface import HuggingFaceEmbedding
from llama_index.vector_stores.postgres import PGVectorStore

if __name__ == "__main__":

    parser = argparse.ArgumentParser(
        description="Utility script for querying RAG database"
    )
    parser.add_argument(
        "-m", "--model-path", required=True, help="path to the embedding model"
    )
    parser.add_argument("-q", "--query", help="query to run")
    parser.add_argument("-k", "--top-k", type=int, help="similarity_top_k")
    parser.add_argument("-n", "--node", help="retrieve node")
    args = parser.parse_args()

    os.environ["TRANSFORMERS_CACHE"] = args.model_path
    os.environ["TRANSFORMERS_OFFLINE"] = "1"

    Settings.llm = resolve_llm(None)
    Settings.embed_model = HuggingFaceEmbedding(model_name=args.model_path)


    connection_string = "postgresql://127.0.0.1:5432?gssencmode=disable"
    db_name = "vector_db"
    conn = psycopg2.connect(connection_string)
    conn.autocommit = True

    url = make_url(connection_string)
    vector_store = PGVectorStore.from_params(
        database=db_name,
        host=url.host,
        password=url.password,
        port=url.port,
        user=url.username,
        table_name="ols_rag",
        embed_dim=768,
    )

    vector_index = VectorStoreIndex.from_vector_store(vector_store=vector_store)

    if args.node is not None:
        print(storage_context.docstore.get_node(args.node).__repr__())
    else:
        retriever = vector_index.as_retriever(similarity_top_k=args.top_k)
        for n in retriever.retrieve(args.query):
            print(n.__repr__())
