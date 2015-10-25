import os
import commands
import time
import re
from datetime import datetime

grep_filter = 'etl_apriori.py'
expired_hours = 2.5
# time.sleep(10)
now = datetime.now()
while 1:
    command = "ps aux|grep %s|grep -v grep|awk \
        '{print$2}{print$9}{print$10}'" % grep_filter
    # stream = os.popen(command)
    # result = stream.read().strip('\n')
    result = commands.getstatusoutput(command)[1].strip('\n')
    result = result.split('\n')
    if len(result) != 3:
        print 'no process named %s' % grep_filter
        break
    result = {
        'pid': result[0],
        'start': datetime.strptime(
            '%s%s %s' % (
                datetime.now().year,
                ''.join(re.findall(r'\d+', result[1])),
                result[2]
            ),
            '%Y%m%d %H:%M'
        )
    }
    run_hours = (now - result['start']).total_seconds() / 60 / 60
    if run_hours > expired_hours:
        print '%s has run %.1f hours, kill it' % (grep_filter, run_hours)
        print commands.getstatusoutput('kill %s' % result['pid'])
    else:
        time.sleep(60 * 5)
