require 'telegram/bot'

TOKEN = ' А вот тутачки должен быть токен, но я вам его не покажу!!! >:^P '

ANSWERS = [
    "Ye",
    "0%",
    "Nah",
    "100%",
    "Maybe",
    "50/50"
]

Telegram::Bot::Client.run(TOKEN) do |bot|
    bot.listen do |message|
        case message.text
        when '/start', '/start start'
            bot.api.send_message(
                chat_id: message.chat.id,
                text: "Hi, #{message.from.first_name}")
        else 
            bot.api.send_message(
            chat_id: message.chat.id,
            text: ANSWERS.sample)
        end
    end
end
