text = input(str('Input your message: \n'))
shift = 3
def caesar():
        alphabet = 'abcdefghijklmnopqrstuvwxyz'
        encrypted_text = ''

        for char in text.lower():
            if char == ' ':
                encrypted_text += char
            else:
                index = alphabet.find(char)
                new_index = (index + shift) % len(alphabet)
                encrypted_text += alphabet[new_index]
        print(encrypted_text)
            