require 'telegram/bot'

TOKEN = 'Я всё ещё не собираюсь показывать вам токен!!'

ANSWERS = [
    "Да, кончно",
    "100%",
    "Да",
    "100000000%",
    "Несомненно",
    #-=-=-=-=-
    "Мб",
    "50/50",
    "Кто знает. Может я? Переспроси",
    "Скорее да, чем нет",
    "Скорее нет, чем да",
    #-=-=-=-=-
    "Нет, пфф",
    "Да неет",
    "Точно нет",
    "0%",
    "Нет",
]

Telegram::Bot::Client.run(TOKEN) do |bot|
    bot.listen do |message|
        case message.text
        when '/start', '/start start'
            bot.api.send_message(
                chat_id: message.chat.id,
                text: "Привет, #{message.from.first_name}")
        when 'Даня умный?'
            bot.api.send_message(
                chat_id: message.chat.id,
                text: "Конечно!!! 10000000%")
        else 
            bot.api.send_message(
            chat_id: message.chat.id,
            text: ANSWERS.sample)
        end
    end
end