=== rag-as-a-service README ==
## 🖇️ RAG-as-a-Service with Claude 3.5 Sonnet

Build and deploy a production-ready Retrieval-Augmented Generation (RAG) service using Claude 3.5 Sonnet and Ragie.ai. This implementation allows you to create a document querying system with a user-friendly Streamlit interface in less than 50 lines of Python code.

### Features
- Production-ready RAG pipeline
- Integration with Claude 3.5 Sonnet for response generation
- Document upload from URLs
- Real-time document querying
- Support for both fast and accurate document processing modes

### How to get Started?

1. Clone the GitHub repository
```bash
git clone https://github.com/Shubhamsaboo/awesome-llm-apps.git
cd awesome-llm-apps/rag_tutorials/rag-as-a-service
```

2. Install the required dependencies:

```bash
pip install -r requirements.txt
```

3. Get your Anthropic API and Ragie API Key

- Sign up for an [Anthropic account](https://console.anthropic.com/) and get your API key
- Sign up for an [Ragie account](https://www.ragie.ai/) and get your API key

4. Run the Streamlit app
```bash
streamlit run rag_app.py
```
=== rag-as-a-service files ==
total 24
drwxrwxr-x  2 ubuntu ubuntu 4096 May 18 02:54 .
drwxrwxr-x 25 ubuntu ubuntu 4096 May 18 02:54 ..
-rw-rw-r--  1 ubuntu ubuntu 1088 May 18 02:54 README.md
-rw-rw-r--  1 ubuntu ubuntu 7826 May 18 02:54 rag_app.py
-rw-rw-r--  1 ubuntu ubuntu   31 May 18 02:54 requirements.txt

=== thinkpath_chatbot README ==
# ThinkPath Chatbot  🧠
*Strategic Thinking Assistant with Local LLM Integration*
*Guided Responses Chatbot*

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Node.js](https://img.shields.io/badge/Node.js-18+-green.svg)](https://nodejs.org/)
[![Electron](https://img.shields.io/badge/Electron-27+-blue.svg)](https://electronjs.org/)
[![Ollama](https://img.shields.io/badge/Ollama-Compatible-orange.svg)](https://ollama.ai/)

> **Stop over-generating. Start thinking strategically.**

ThinkPath AI revolutionizes how you interact with language models by introducing **guided thinking paths** - letting you control exactly how deep the AI goes into any topic, step by step.

![ThinkPath AI Demo](demo.gif)
<video width="100%" controls>
  <source src="https://github.com/Ahmed-G-ElTaher/ThinkPath-Chatbot/blob/main/github%20thinkpath%20video.mp4" type="video/mp4">
  Your browser does not support the video tag.
</video>


## 🎯 **The Problem We Solve**

### Before ThinkPath AI:
- ❌ **Token Waste**: AI generates full responses when you only need part of the analysis
- ❌ **Over-Information**: Getting overwhelmed with details you didn't ask for  
- ❌ **No Control**: Can't pause AI mid-thought to explore different directions
- ❌ **Linear Thinking**: Stuck with one approach, can't easily switch perspectives
- ❌ **High Costs**: Paying for tokens you don't need or want

### With ThinkPath AI:
- ✅ **Precision Control**: Get exactly the depth of analysis you need
- ✅ **Cost Efficiency**: Pay only for the thinking steps you choose
- ✅ **Strategic Flexibility**: Switch between different approaches dynamically  
- ✅ **Incremental Discovery**: Build understanding step-by-step
- ✅ **Complete Privacy**: Everything runs locally on your machine

## 🚀 **Key Features**

### 🧭 **Guided Thinking Paths**
- **Dynamic Path Generation**: AI creates 4 different thinking approaches for each question
- **Step-by-Step Execution**: Click any step to execute that approach up to that point
- **Cumulative Logic**: Step 3 = Steps 1 + 2 + 3 executed together
- **Visual Progress**: See exactly which steps have been completed

### 🔄 **Adaptive Conversation**
- **Auto-Path Updates**: New thinking approaches generated after each response
- **Context Awareness**: Paths build on conversation history
- **Continuation Focus**: Next steps always relevant to current progress

### 🎨 **Professional Interface** 
- **Modern Design**: Clean, intuitive interface inspired by professional tools
- **Window Controls**: Native minimize, maximize, close buttons
- **Structured Responses**: Bold text, bullet points, professional formatting
- **Keyboard Shortcuts**: Fast navigation and control

### 🔒 **Complete Privacy**
- **Local Processing**: All AI runs on your machine via Ollama
- **No Data Sharing**: Conversations never leave your computer
- **Offline Capable**: Works without internet connection
- **Model Choice**: Use any Ollama-compatible model (Llama, Gemma, etc.)

## 📊 **Cost Comparison**

| Scenario | Traditional Chat | ThinkPath AI | Savings |
|----------|-----------------|--------------|---------|
| Quick clarification | 500 tokens | 150 tokens | **70%** |
| Partial analysis | 1200 tokens | 400 tokens | **67%** |
| Exploring options | 2000 tokens | 600 tokens | **70%** |
| Complex strategy | 3500 tokens | 1000 tokens | **71%** |

*Based on typical usage patterns where users only need partial analysis*

## 🛠 **Installation**

### Prerequisites
- [Node.js](https://nodejs.org/) (v18 or higher)
- [Ollama](https://ollama.ai/) installed and running
- At least one language model downloaded

### Quick Start

1. **Clone the repository**
   ```bash
   git clone https://github.com/Ahmed-G-ElTaher/ThinkPath-Chatbot.git
   cd thinkpath-ai
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Setup Ollama and download a model**
   ```bash
   # Install Ollama (if not already installed)
   # Visit https://ollama.ai/download
   
   # Download a fast model
   ollama pull gemma3:1b
   
   # Or a more capable model
   ollama pull llama3.1:8b
   ```

4. **Configure the model** (if needed)
   ```bash
   # Edit main.js line 45 to match your model
   model: 'gemma3:1b'  # Change to your preferred model
   ```

5. **Run the application**
   ```bash
   npm start
   ```

## 💡 **How It Works**

### 1. **Ask Any Question**
Type your question and ThinkPath AI generates 4 different thinking approaches:
- Analytical, Creative, Practical, Comprehensive
- Or context-specific paths like "Technical Deep Dive", "Business Impact", etc.

### 2. **Choose Your Path & Step**
Each approach has 3 steps. Click any step to execute that path up to that point:
- Step 1: Execute just the first step
- Step 2: Execute steps 1 and 2  
- Step 3: Execute all three steps

### 3. **Get Structured Responses**
AI provides detailed analysis with:
- Clear step-by-step breakdown
- Bold key terms and concepts
- Bullet points for clarity
- Progress summary

### 4. **Continue Exploring**
After each response, new thinking paths automatically appear, building on your conversation context.

## 🎯 **Use Cases**

### 💻 **Software Development & Debugging**
- Model debugging with controllable depth of analysis
- Architecture planning with multiple technical approaches
- Code review with focused, step-by-step examination
- Performance optimization with systematic investigation

### 🤖 **Machine Learning & AI**
- Training issue diagnosis without information overflow
- Hyperparameter tuning with guided experimentation
- Model architecture exploration step by step
- Data pipeline debugging with structured approaches

### 📊 **Data Science**
- Exploratory data analysis with multiple perspectives
- Feature engineering with incremental discovery
- Statistical analysis with controlled complexity
- Visualization planning with step-by-step breakdown

### 💼 **Technical Leadership**
- System architecture decisions with guided analysis
- Technology stack evaluation with structured comparison
- Technical debt assessment with focused investigation
- Team problem-solving with methodical approaches

## ⚙️ **Configuration**

### Model Selection
Edit `main.js` to use different models:
```javascript
// Line 45: Change the model name
model: 'llama3.1:8b'  // or 'gemma3:1b', 'mistral:7b', etc.
```

### UI Customization
Modify `index.html` CSS for:
- Color schemes
- Typography
- Layout preferences
- Window styling

### Keyboard Shortcuts
- `Ctrl/Cmd + W` - Close window
- `Ctrl/Cmd + M` - Minimize window  
- `F11` - Toggle maximize
- `Ctrl/Cmd + R` - Refresh thinking paths

## 🔮 **Future Development**

### 🎯 **Planned Features**
- [ ] **Multi-Model Support**: Run multiple models simultaneously for different perspectives
- [ ] **Custom Thinking Templates**: Create and save your own thinking approaches
- [ ] **Conversation Export**: Save thinking sessions as structured documents
- [ ] **Voice Integration**: Speech-to-text for natural interaction
- [ ] **Team Collaboration**: Share thinking sessions with team members
- [ ] **Analytics Dashboard**: Track thinking patterns and productivity
- [ ] **Plugin System**: Extend functionality with custom tools
- [ ] **Mobile App**: iOS/Android versions with cloud sync

### 🏗 **Potential Applications**

#### 🎓 **Education Sector**
- **Socratic Learning Platform**: Guide students through step-by-step problem solving
- **Research Assistant**: Help students explore topics with structured thinking
- **Thesis Planning**: Break down complex research into manageable steps

#### 🏥 **Healthcare**
- **Diagnostic Support**: Multi-approach medical analysis (symptoms → differential → testing)
- **Treatment Planning**: Step-by-step care plan development
- **Medical Education**: Case-based learning with guided analysis

#### ⚖️ **Legal**
- **Case Analysis**: Multiple legal approaches to complex cases
- **Contract Review**: Systematic document analysis
- **Legal Research**: Structured exploration of legal precedents

#### 🏭 **Enterprise**
- **Decision Support**: Strategic planning with guided thinking
- **Risk Assessment**: Multi-perspective risk analysis
- **Training Programs**: Skill development with structured learning

#### 🔬 **Research & Development**
- **Scientific Method**: Hypothesis → Experiment → Analysis workflows
- **Innovation Labs**: Systematic ideation and validation
- **Patent Analysis**: Multi-angle IP research

## 🤝 **Contributing**

We welcome contributions! Here's how you can help:

1. **Fork the repository**
2. **Create a feature branch**: `git checkout -b feature/amazing-feature`
3. **Commit changes**: `git commit -m 'Add amazing feature'`
4. **Push to branch**: `git push origin feature/amazing-feature`
5. **Open a Pull Request**

### Development Areas
- **UI/UX Improvements**: Better visual design and user experience
- **Model Integration**: Support for new LLM providers
- **Performance**: Optimization for faster response times
- **Features**: New thinking methodologies and tools
- **Documentation**: Tutorials, guides, and examples

## 🙏 **Acknowledgments**

- **Ollama**: For making local LLM deployment accessible
- **Electron**: For cross-platform desktop app framework
- **AI Community**: For advancing open-source language models
- **Strategic Thinking**: Inspired by consulting methodologies and structured problem-solving


---

**Built with ❤️ for strategic thinkers who value precision, privacy, and control.**

*Stop over-generating. Start thinking strategically with ThinkPath AI.*

**Developed in collaboration with Claude AI** - demonstrating that the future of software development lies in thoughtful human-AI partnership, where AI amplifies human creativity and strategic thinking rather than replacing it. 🤖🤝👨‍💻

=== NeMo banking full dataset ==
[
  ["card_arrival", "inform card not arrived"],
  ["card_linking", "request link card to app"],
  ["card_linking", "request reactivate card in app"],
  ["exchange_rate", "ask bank exchange rate"],
  ["card_payment_wrong_exchange_rate", "inform wrong exchange rate for payment"],
  ["extra_charge_on_statement", "ask reason for extra charge on payment statement"],
  ["pending_cash_withdrawal", "inform pending cash withdrawal"],
  ["fiat_currency_support", "ask bank available fiat currency"],
  ["card_delivery_estimate", "ask card delivery date estimate"],
  ["automatic_top_up", "request automatic top-up account"],
  ["card_not_working", "inform card not working"],
  ["exchange_via_app", "ask currency exchange via app"],
  ["lost_or_stolen_card", "inform lost stolen card"],
  ["age_limit", "ask bank services age limit"],
  ["pin_blocked", "ask pin blocked"],
  ["contactless_not_working", "inform contactless payment not working"],
  ["top_up_by_bank_transfer_charge", "ask transfer top-up charges and conditions"],
  ["pending_top_up", "inform pending top-up"],
  ["pending_top_up", "inform top-up problems"],
  ["cancel_transfer", "request cancel transfer"],
  ["top_up_limits", "ask top-up limit"],
  ["wrong_amount_of_cash_received", "inform received wrong amount of cash at ATM withdrawal"],
  ["card_payment_fee_charged", "ask card payment fee for transactions"],
  ["card_payment_fee_charged", "ask reason for card payment fee"],
  ["transfer_not_received_by_recipient", "inform bank transfer not received by recipient"],
  ["supported_cards_and_currencies", "ask supported cards currencies"],
  ["getting_virtual_card", "request virtual card"],
  ["card_acceptance", "ask card payment acceptance and restrictions"],
  ["top_up_reverted", "inform top-up reverted"],
  ["balance_not_updated_after_cheque_or_cash_deposit", "inform account balance not updated after deposit"],
  ["card_payment_not_recognised", "inform not recognised card payment"],
  ["card_payment_not_recognised", "inform unfamiliar card payment charge"],
  ["edit_personal_details", "request change personal details"],
  ["why_verify_identity", "ask reason identify verification needed"],
  ["unable_to_verify_identity", "inform problem verifying identify"],
  ["get_physical_card", "request help with physical card pin"],
  ["visa_or_mastercard", "ask card brand visa mastercard"],
  ["topping_up_by_card", "ask top-up by card friends"],
  ["disposable_card_limits", "ask disposable card transaction limits"],
  ["compromised_card", "inform compromised card"],
  ["compromised_card", "request card freeze"],
  ["atm_support", "ask atm locations"],
  ["direct_debit_payment_not_recognised", "inform not recognised direct debit payment"],
  ["passcode_forgotten", "inform forgot password login code"],
  ["declined_cash_withdrawal", "inform declined atm cash withdrawal"],
  ["pending_card_payment", "inform pending card payment"],
  ["lost_or_stolen_phone", "inform lost stolen phone"],
  ["request_refund", "request purchase refund"],
  ["declined_transfer", "ask reason transfer declined"],
  ["Refund_not_showing_up", "inform refund not received"],
  ["declined_card_payment", "inform declined card payment"],
  ["pending_transfer", "inform pending transfer"],
  ["terminate_account", "request terminate account"],
  ["card_swallowed", "inform card swallowed by atm"],
  ["transaction_charged_twice", "inform duplicate card transaction"],
  ["verify_source_of_funds", "request source of money from account"],
  ["transfer_timing", "ask bank transfer duration"],
  ["reverted_card_payment?", "inform returned card payment"],
  ["change_pin", "request change pin"],
  ["beneficiary_not_allowed", "inform transfer beneficiary not allowed"],
  ["transfer_fee_charged", "ask transfer fee for transactions"],
  ["transfer_fee_charged", "ask reason for transfer fee"],
  ["receiving_money", "ask receive money conditions"],
  ["failed_transfer", "ask reason transfer failed"],
  ["transfer_into_account", "ask transfer money into between accounts"],
  ["verify_top_up", "ask about top-up verification"],
  ["getting_spare_card", "request spare card"],
  ["top_up_by_cash_or_cheque", "ask about cash check top-up"],
  ["order_physical_card", "request physical card"],
  ["virtual_card_not_working", "inform virtual card not working"],
  ["wrong_exchange_rate_for_cash_withdrawal", "inform wrong exchange rate for cash withdrawal"],
  ["get_disposable_virtual_card", "request disposable virtual card"],
  ["top_up_failed", "ask reason top-up failed"],
  ["balance_not_updated_after_bank_transfer", "inform account balance not updated after transfer"],
  ["cash_withdrawal_not_recognised", "inform not recognised cash withdrawal"],
  ["exchange_charge", "ask about currency exchange fee"],
  ["top_up_by_card_charge", "ask card top-up charges and conditions"],
  ["activate_my_card", "request activate card"],
  ["cash_withdrawal_charge", "ask about cash withdrawal fee"],
  ["card_about_to_expire", "inform card expires"],
  ["apple_pay_or_google_pay", "inform top-up not working apple google pay"],
  ["verify_my_identity", "ask how to verify identify"],
  ["country_support", "ask bank operating countries"]
]

=== NeMo RAG pinecone example ==
README.md
__init__.py
custom_rag_output_rails
fact_checking
pinecone
data-00000-of-00001.arrow
dataset_info.json
nvidia.pdf
state.json
