import os
from dotenv import load_dotenv, dotenv_values
from hugchat import hugchat
from hugchat.login import Login

# Load environment variables
load_dotenv()
secrets = dotenv_values(".env")

email = secrets["EMAIL"]
password = secrets["PASS"]

# Function to generate response


def generate_response(prompt, email, password, stream=False, web=False):
    # Sign
    sign = Login(email, password)
    cookies = sign.login()

    # Create chatbot
    chatbot = hugchat.ChatBot(cookies=cookies.get_dict())

    # Create a new conversation
    id = chatbot.new_conversation()
    chatbot.change_conversation(id)

    if stream:
        response = ""
        print("Assistant:", end="")
        for resp in chatbot.query(prompt, web_search=web, stream=True, conversation=id):
            if resp is not None and 'token' in resp:
                response += resp['token']
                print(resp['token'], end="", flush=True)

        print("\n")  # Newline
    else:
        response = chatbot.query(
            text=prompt, conversation=id, web_search=web)
        print(f"Assistant: {response}")

# Function to clear the screen


def clear_screen():
    os.system('cls' if os.name == 'nt' else 'clear')


# Initial prompt
clear_screen()
print("=============================================================")
print("""
 **       ** ******** **         ******    *******   ****     **** ********
/**      /**/**///// /**        **////**  **/////** /**/**   **/**/**/////
/**   *  /**/**      /**       **    //  **     //**/**//** ** /**/**
/**  *** /**/******* /**      /**       /**      /**/** //***  /**/*******
/** **/**/**/**////  /**      /**       /**      /**/**  //*   /**/**////
/**** //****/**      /**      //**    **//**     ** /**   /    /**/**
/**/   ///**/********/******** //******  //*******  /**        /**/********
//       // //////// ////////   //////    ///////   //         // ////////

""")
print("Type 'exit' to exit and 'clear' to clear the screen.")
print("=============================================================\n")
print(f'Assistant: Hello! Welcome to Hugging Chat!')

while True:
    prompt = input("You: ")
    if prompt == "exit":
        exit()
    elif prompt == "clear":
        clear_screen()
        continue
    elif prompt != "":
        generate_response(prompt, email, password, web=True, stream=True)
