import os, json
from firecrawl import FirecrawlApp

app = FirecrawlApp(api_key=os.environ['FIRECRAWL_API_KEY'])

searches = [
    ('rag_chatbot_widget', 'open source RAG chatbot plug-and-play web widget embed JS snippet BYOK'),
    ('pm_cases_chatbot', 'product manager built RAG chatbot platform case study architecture decisions'),
    ('synthetic_dataset_banking', 'synthetic dataset banking fintech chatbot FAQ open source CSV JSON'),
    ('anythingllm_embed_tutorial', 'AnythingLLM embed widget production setup tutorial'),
]

os.makedirs('/home/ubuntu/klipso-chat/research/firecrawl', exist_ok=True)

for key, query in searches:
    print(f'Searching: {query}')
    result = app.search(query, limit=5)
    out_path = f'/home/ubuntu/klipso-chat/research/firecrawl/{key}.json'
    with open(out_path, 'w') as f:
        json.dump({'query': query, 'results': result}, f, indent=2, default=str)
    print(f'Saved: {out_path}')

print('FIRECRAWL_DONE')
