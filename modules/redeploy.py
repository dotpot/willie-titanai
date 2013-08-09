__author__ = 'justinas'

import willie

@willie.module.commands('redeploy')
def helloworld(bot, trigger):
    bot.say('Hello, world! Redeploy!')
