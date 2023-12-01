# HugChat Project

This project utilizes the `hugchat` library to interact with the Meta LLaMA chatbot.

![image](https://github.com/byronnDev/HuggingChatCLI/assets/38868773/e02d1973-aaad-4921-8f63-42f9e1b0ab85)

## Configuration

The project requires a `.env` file in the root directory with the following environment variables:

```
EMAIL="your_email"
PASS="your_password"
```

These credentials are used to log in to the chatbot through your [Hugging Face](https://huggingface.co/) account.

You can test it from the [Hugging Chat](https://huggingface.co/chat/) website or run it locally through this repository.

## Usage

The main script is `hugchat.py`. It defines a `generate_response` function that takes an input message and returns a chatbot response.

The `generate_response` function logs into the chatbot, creates a new conversation, and sends the input message to the chatbot. It then retrieves and returns the chatbot's response.

Parameters:
- `prompt`: input message
- `email`: Hugging Face account email
- `password`: Hugging Face account password
- `stream`: if `True`, returns the chatbot's response as a progressive text stream. If `False`, returns the chatbot's response as a string.

## Execution

To run the script on Windows, you can execute the `run.bat` file.

If you're using Linux, you can execute the `run.sh` file:

```bash
chmod +x run.sh
./run.sh
```
