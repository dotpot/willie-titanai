__author__ = 'dovydas'

import willie

@willie.module.commands('trout')
def trout(bot, trigger):
    bot.action('slaps %s with a large trout' % trigger.group(2))
