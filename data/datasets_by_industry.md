# Datasets Abiertos para Chatbots RAG por Industria 🚀

Este documento consolida la investigación de bases de conocimiento (knowledge bases) reales y datasets abiertos que se pueden utilizar para demostrar el potencial de **klipso-chat** en múltiples sectores e industrias más allá del ámbito puramente bancario/financiero.

---

## 🏥 BÚSQUEDA 1 — Salud / Clínicas

### 1. MedQuAD (Medical Question Answering Dataset)
*   **Nombre:** MedQuAD (Medical Question Answering Dataset)
*   **URL:** [Hugging Face - keivalya/MedQuad-MedicalQnADataset](https://huggingface.co/datasets/keivalya/MedQuad-MedicalQnADataset)
*   **Cantidad de filas/ejemplos:** 47,455 pares de preguntas y respuestas médicas.
*   **Licencia:** Libre para uso de investigación y educativo (los datos originales proceden de portales del NIH oficial estadounidense como MedlinePlus, NIH, Cancer.gov).
*   **¿Sirve como knowledge base PDF o necesita conversión?:**
    *   **Formato de origen:** Tabular (CSV/JSON/Hugging Face).
    *   **Uso en RAG:** Requiere conversión simple. Lo ideal para un chatbot RAG de clínica es filtrar preguntas sobre síntomas, servicios y citas y exportarlas en formato de texto plano (`.txt` o `.pdf`) simulando el "Manual de Atención al Paciente" de una clínica.

### 2. AI Medical Chatbot (ruslanmv)
*   **Nombre:** AI Medical Chatbot
*   **URL:** [Hugging Face - ruslanmv/ai-medical-chatbot](https://huggingface.co/datasets/ruslanmv/ai-medical-chatbot)
*   **Cantidad de filas/ejemplos:** +250,000 diálogos paciente-médico estructurados.
*   **Licencia:** CC-BY-NC-SA 4.0 (Libre para investigación, requiere atribución, no comercial).
*   **¿Sirve como knowledge base PDF o necesita conversión?:**
    *   **Formato de origen:** JSON con diálogos.
    *   **Uso en RAG:** Requiere conversión. Está estructurado como historial de chat. Para RAG se puede convertir en un documento descriptivo de casos frecuentes.

---

## 🛍️ BÚSQUEDA 2 — E-commerce / Retail

### 1. E-commerce Customer Support Conversations
*   **Nombre:** ecommerce-customer-support-conversations
*   **URL:** [Hugging Face - Venkatrajan247/ecommerce-customer-support-conversations](https://huggingface.co/datasets/Venkatrajan247/ecommerce-customer-support-conversations)
*   **Cantidad de filas/ejemplos:** ~15,000 diálogos de clientes con agentes de soporte de e-commerce.
*   **Licencia:** Libre / Open Source (Comunidad Hugging Face).
*   **¿Sirve como knowledge base PDF o necesita conversión?:**
    *   **Formato de origen:** JSONL con roles de usuario y asistente.
    *   **Uso en RAG:** Para RAG en AnythingLLM, se puede convertir a formato de texto plano reuniendo las políticas más recurrentes explicadas por el asistente (envíos, devoluciones, reembolsos) y guardándolo como `politicas_soporte_retail.pdf` o `.txt`.

### 2. Customer Support Tickets Dataset
*   **Nombre:** Customer Support Tickets Dataset (200K+ Records)
*   **URL:** [Kaggle - sankha1998/customer-support-tickets-dataset](https://www.kaggle.com/datasets/sankha1998/customer-support-tickets-dataset)
*   **Cantidad de filas/ejemplos:** +200,000 tickets de soporte estructurados con problemas y soluciones de retail.
*   **Licencia:** CC0: Public Domain (Totalmente libre, comercializable).
*   **¿Sirve como knowledge base PDF o necesita conversión?:**
    *   **Formato de origen:** CSV tabular.
    *   **Uso en RAG:** Se puede usar directamente indexando filas del CSV para un RAG que busque soluciones pasadas, o se puede extraer una FAQ general agrupando las soluciones por categorías principales para crear un manual de soporte limpio.

---

## 🏢 BÚSQUEDA 3 — Inmobiliaria / Real Estate

### 1. Real Estate v1 (Zillow)
*   **Nombre:** real_estate_v1
*   **URL:** [Hugging Face - zillow/real_estate_v1](https://huggingface.co/datasets/zillow/real_estate_v1)
*   **Cantidad de filas/ejemplos:** Varios miles de diálogos reales sobre el ecosistema inmobiliario.
*   **Licencia:** Libre bajo la iniciativa de código abierto de Zillow (Zillow Open Source).
*   **¿Sirve como knowledge base PDF o necesita conversión?:**
    *   **Formato de origen:** JSON estructurado por temas (tasas de impuestos, procesos de alquiler, etc.).
    *   **Uso en RAG:** Se puede convertir a texto descriptivo muy fácilmente, agrupando la información en secciones tales como "Guía de Reubicación Internacional" y "Proceso para Propietarios de Alquiler", ideal para cargar en AnythingLLM.

### 2. Real Estate Assistant RAG (VictorOntiveros)
*   **Nombre:** real-estate-assistant
*   **URL:** [Hugging Face - VictorOntiveros/real-estate-assistant](https://huggingface.co/datasets/VictorOntiveros/real-estate-assistant)
*   **Cantidad de filas/ejemplos:** +500 pares de Q&A altamente especializados acompañados de su respectivo **context passage**.
*   **Licencia:** Apache 2.0 (Comercialmente libre y totalmente abierta).
*   **¿Sirve como knowledge base PDF o necesita conversión?:**
    *   **Formato de origen:** Dataset tabular que incluye los fragmentos de contexto reales usados para responder.
    *   **Uso en RAG:** **¡SIRVE DIRECTAMENTE!** Puedes extraer la columna `context` del dataset, guardarla directamente en un archivo `guia_inmobiliaria.txt` o `guia_inmobiliaria.pdf` y cargarla a AnythingLLM. El bot tendrá toda la base de conocimientos necesaria para responder con precisión y sin inventar.

---

## 💼 BÚSQUEDA 4 — RRHH / Legal (Empresas Internas)

### 1. HR Policies Q&A Dataset (strova-ai)
*   **Nombre:** hr-policies-qa-dataset
*   **URL:** [Hugging Face - strova-ai/hr-policies-qa-dataset](https://huggingface.co/datasets/strova-ai/hr-policies-qa-dataset)
*   **Cantidad de filas/ejemplos:** ~2,500 diálogos multi-turno de políticas de recursos humanos.
*   **Licencia:** Apache 2.0 (Comercialmente libre).
*   **¿Sirve como knowledge base PDF o necesita conversión?:**
    *   **Formato de origen:** JSON con estructura de sistema/usuario/asistente.
    *   **Uso en RAG:** Requiere conversión básica. Los diálogos tratan de ausencias, vacaciones y reglas de cumplimiento de la empresa. Al exportar las respuestas correctas del asistente, puedes generar un "Manual del Empleado" estructurado para alimentar un RAG interno.

### 2. HR & People Operations (monodox)
*   **Nombre:** hr-and-people-operations
*   **URL:** [Hugging Face - monodox/hr-and-people-operations](https://huggingface.co/datasets/monodox/hr-and-people-operations)
*   **Cantidad de filas/ejemplos:** Cientos de documentos que cubren perfiles de puestos, guías de onboarding, manuales de políticas y transcripciones.
*   **Licencia:** Libre / Open Source (Apache 2.0).
*   **¿Sirve como knowledge base PDF o necesita conversión?:**
    *   **Formato de origen:** Colección de documentos en texto plano.
    *   **Uso en RAG:** **¡SIRVE DIRECTAMENTE!** Al estar ya redactado en lenguaje de documento corporativo real (guías de onboarding, políticas de empresa, etc.), se puede descargar, compilar en un solo PDF llamado `manual_recursos_humanos.pdf` y subirlo directamente al workspace de AnythingLLM sin hacer ninguna conversión de datos adicional.

---

## 💡 Recomendaciones para la Demostración en Klipso-Chat

Para realizar demostraciones impactantes ante potenciales clientes o inversores en diferentes sectores, se recomienda estructurar la knowledge base en **AnythingLLM** de la siguiente forma:

1.  **Demo Médica:** Usar los pasajes estructurados de **MedQuAD** (ej. preguntas frecuentes sobre enfermedades comunes) compilados en un documento "Preguntas Frecuentes Clínica de Salud v1.pdf".
2.  **Demo Retail/E-commerce:** Usar las conversaciones de **Venkatrajan247** y convertirlas en un documento formal llamado "Políticas de Devoluciones y Envíos - Retail Demo.txt".
3.  **Demo Inmobiliaria:** Utilizar directamente la base de contextos de **real-estate-assistant** de VictorOntiveros, guardándola como "Base de Conocimiento Inmobiliaria - Compradores e Inquilinos.txt".
4.  **Demo RRHH/Corporativo:** Usar los textos planos de onboarding y políticas de **hr-and-people-operations** de monodox, subiendo el archivo "Manual de Bienvenida y Onboarding de Empleados.pdf".
