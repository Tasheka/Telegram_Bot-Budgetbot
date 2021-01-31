# frozen_string_literal: true

require 'telegram/bot'

token = "1653502090:AAGO6xcVIeie687kqg89hF3gBXa83te3t10"

Telegram::Bot::Client.run(token) do  |bot|
    bot.listen do |message|
        bot.api.send_message(chat_id: message.chat.id, text: "Hello I'm Shekabot")
    end
end