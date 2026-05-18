from faker import Faker
import pandas as pd
import random

fake = Faker(['es_PE', 'es_MX', 'es_CO'])

# 500 clientes sintéticos
customers = []
industries = ['clinica', 'inmobiliaria', 'ecommerce', 'banca', 'educacion']
for i in range(500):
    industry = random.choice(industries)
    customers.append({
        "id": i+1,
        "nombre": fake.name(),
        "email": fake.email(),
        "telefono": fake.phone_number(),
        "empresa": fake.company(),
        "ciudad": random.choice(['Lima', 'Bogotá', 'Ciudad de México', 'Santiago', 'Buenos Aires']),
        "industria": industry,
        "plan": random.choice(['free', 'free', 'free', 'paid']),
        "mensajes_por_dia": random.randint(5, 500),
        "docs_subidos": random.randint(1, 20),
        "pregunta_top": fake.sentence(nb_words=10),
        "containment_rate": round(random.uniform(0.45, 0.95), 2)
    })

df = pd.DataFrame(customers)
df.to_csv('/home/ubuntu/klipso-chat/data/synthetic_customers_500.csv', index=False)

# Generar conversaciones sintéticas (200 conversaciones)
conversations = []
questions_bank = [
    "¿Cuáles son sus horarios de atención?",
    "¿Cómo puedo cancelar mi cuenta?",
    "¿Aceptan pagos en cuotas?",
    "¿Tienen sucursal en Miraflores?",
    "¿Cuánto tarda el envío?",
    "¿Cuál es la política de devoluciones?",
    "Necesito hablar con un humano",
    "El pago no me procesó",
    "¿Cómo restablezco mi contraseña?"
]
for i in range(200):
    conversations.append({
        "conv_id": i+1,
        "user_question": random.choice(questions_bank),
        "bot_responded": random.choice([True, True, True, False]),
        "escalated_to_human": random.choice([False, False, False, True]),
        "resolution": random.choice(['resolved', 'resolved', 'escalated', 'abandoned']),
        "response_time_ms": random.randint(200, 3000)
    })

pd.DataFrame(conversations).to_csv(
    '/home/ubuntu/klipso-chat/data/synthetic_conversations_200.csv', index=False)

print(f"Generated 500 synthetic customers and 200 synthetic conversations.")
