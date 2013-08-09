__author__ = 'justinas'

import willie
from subprocess import Popen

@willie.module.commands('redeploy')
def helloworld(bot, trigger):
    bot.say('Redeploy!')
    command = ['/home/justinas/redeploy_willie']
    Popen(command)
