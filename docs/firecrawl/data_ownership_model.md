# BÚSQUEDA 3: Modelos de datos del cliente en chatbot SaaS (BYOK + ownership) 📂🔒

Este documento analiza cómo se gestiona la propiedad de los documentos y datos del cliente en soluciones de Chatbot SaaS y arquitecturas auto-hospedadas (Self-Hosted), con enfoque en el modelo BYOK (Bring Your Own Key).

---

## 1. Gestión de Datos y Propiedad en Chatbots SaaS

En el modelo SaaS tradicional, el proveedor del servicio almacena los archivos y registros de chat del cliente en sus servidores cloud. Sin embargo, para ganarse la confianza de clientes empresariales, el modelo de soberanía de datos ha evolucionado hacia dos prácticas clave:

### Bring Your Own Key (BYOK) o Customer Managed Keys (CMK)
* **¿Qué es?:** El cliente proporciona su propia clave de cifrado (por ejemplo, desde AWS KMS, Google Cloud KMS o Azure Key Vault) para proteger sus datos en reposo dentro de la infraestructura del proveedor de SaaS.
* **Control de Acceso:** El proveedor de SaaS no puede leer ni acceder a los documentos cargados a la base de datos vectorial del chatbot sin el consentimiento activo del cliente. El cliente puede revocar la clave en cualquier momento, bloqueando el acceso al bot inmediatamente de manera remota e irrevocable.
* **Trazabilidad:** Cualquier llamada de cifrado/descifrado queda registrada en los logs de auditoría del cliente, dando control total sobre la gobernanza de datos.

---

## 2. Caso de Estudio: AnythingLLM (Self-Hosted vs Cloud)

AnythingLLM ofrece un modelo de gobernanza híbrido ideal para startups y corporativos:

### A. Versión Desktop (Local-First):
* **Propiedad:** 100% del cliente. Todos los chats, historiales, embeddings y documentos se guardan de forma local en la máquina del usuario.
* **Privacidad:** No se transmite ningún dato a servidores externos por defecto, a menos que se configure un proveedor de LLM en la nube (como OpenAI API) en cuyo caso solo viajan los fragmentos vectoriales (chunks) correspondientes a la consulta actual.

### B. Versión Auto-Hospedada (Self-Hosted - Docker):
* **Propiedad:** 100% del cliente. El backend corre en tu propia nube privada (AWS EC2, GCP, servidores físicos).
* **Control:** Permite aislar completamente el flujo de red. Si se integra con un modelo local (e.g. Ollama en EC2), los datos del cliente jamás tocan internet. Los workspaces funcionan como contenedores lógicos aislados a nivel de base de datos.

### C. AnythingLLM Cloud:
* **Gobernanza:** Gestionado en la nube del proveedor (usando AWS). Sus políticas garantizan que no comparten, venden ni entrenan sus modelos con tus documentos corporativos. Sin embargo, para industrias altamente reguladas, el self-hosting es el estándar obligado.

---

## 3. Términos y Condiciones Estándar para BYOK/SaaS de IA

Los contratos corporativos de software (Enterprise SLAs) para chatbots de IA con BYOK suelen incluir estas cláusulas estándar:

* **Soberanía del Dato (Data Sovereignty):** "El Cliente retiene todos los derechos, títulos e intereses de propiedad sobre todos los documentos cargados, datos y outputs generados por el chatbot."
* **No Entrenamiento (No-Training Clause):** "El Proveedor se compromete a no utilizar los datos de entrada (Prompts) ni de salida (Completions), ni los archivos indexados del Cliente, para entrenar o mejorar modelos de lenguaje fundacionales propios o de terceros."
* **Revocabilidad del Cifrado (BYOK Key Revocation):** "El Cliente tendrá el derecho de revocar de forma inmediata el acceso a sus llaves de cifrado en su propio servicio de gestión de llaves (KMS), lo cual deshabilitará de forma permanente y segura toda lectura de los datos por parte de la plataforma sin penalización contractual."

---

## 🔗 Fuentes y Enlaces de Referencia:
* [AnythingLLM Desktop & Self-Hosted Privacy](https://github.com/Mintplex-Labs/anything-llm)
* [AWS Key Management Service (KMS) BYOK Patterns](https://aws.amazon.com/kms/)
* [LiteLLM - Data Encryption & Middleware Security](https://litellm.ai)
