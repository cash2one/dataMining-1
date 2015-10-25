#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

'''
@auth: Cooper
@Created At: 2012.8.28
'''

import re
import json
import time

from dfhspider.lib import getDBConn, escapeSQLCommand

ADVS = [[
    '很',
    '非常',
    '这么',
    '相当',
    '太',
    '真',
    '过',
    '超',
    ], ['不']]


def queryRateDict():
    db = getDBConn('ibbd2')
    rateDict = {}
    db.query('SELECT theme,keyword,appraisal,score FROM ibbd2.lib_rate_library')
    r = db.store_result()
    for i in range(r.num_rows()):
        row = r.fetch_row()[0]
        if rateDict.has_key(row[0]):
            rateDict[row[0]].append([row[1].encode('utf-8'), row[2].encode('utf-8'), row[3]])
        else:
            rateDict[row[0]] = [[row[1].encode('utf-8'), row[2].encode('utf-8'), row[3]]]
    db.close()
    return rateDict


def evaluateRateLevel(content, rateDict, encoding='utf-8'):
    """对一条评论内容做出评价
    rateDict:{'theme':[[keyword,appraisal,score],]}
    """

    adv = [[
        '很',
        '非常',
        '这么',
        '相当',
        '太',
        '真',
        '过',
        ], ['不']]
    content = content.decode(encoding)
    result = {}
    for theme in rateDict.keys():
        for baseRate in rateDict[theme]:
            for rateSec in baseRate[0].split('&'):
                regx = rateSec.decode(encoding) + r'(\S{0,4})' + baseRate[1].decode(encoding)
                rs = re.findall(regx, content)
                for rs0 in rs:
                    score = baseRate[2]
                    for adv1 in adv[0]:
                        if adv1.decode('utf-8') in rs0:
                            score = score * 2
                            break
                    for adv2 in adv[1]:
                        if adv2.decode('utf-8') in rs0:
                            score = -1 * score
                    if result.has_key(theme):
                        result[theme] = max(result[theme], score)
                    else:
                        result[theme] = score
    return rs


def evaluateRates(
    contents,
    rateDict,
    advs,
    encoding='utf-8',
    ):

    results = {}
    for contentArr in contents:
        contentId = contentArr[0]
        content = contentArr[1].decode(encoding)
        result = {}
        for theme in rateDict.keys():
            result[theme] = {}
            for baseRate in rateDict[theme]:
                for rateSec in baseRate[0].split('&'):
                    regx = re.compile(rateSec.decode(encoding) + r'(\S{0,4})' + baseRate[1].decode(encoding))
                    rs = regx.findall(content)
                    for rs0 in rs:
                        score = baseRate[2]
                        for adv1 in advs[0]:
                            if adv1.decode('utf-8') in rs0:
                                score = score * 2
                                break
                        for adv2 in advs[1]:
                            if adv2.decode('utf-8') in rs0:
                                score = -1 * score
                        result[theme][baseRate[1]] = score
        if len(result) > 0:
            results[contentId] = result
    return results


def evaluateRatesByItemId(item_id):
    rateDict = queryRateDict()
    db = getDBConn('ibbd2')
    db2 = getDBConn('ibbd2')
    c = db.cursor()
    c2 = db2.cursor()
    c.execute("""SELECT rate_id, content, `date`
        FROM topspider.top_item_rate
        WHERE auc_num_id='%s'
        GROUP BY rate_id"""
              % item_id)
    while 1:
        rows = c.fetchmany(300)
        rows = dict((t[0], [t[1].encode('utf-8'), t[2]]) for t in rows)
        if len(rows) == 0:
            break
        metadata = evaluateRates([[k, v[0]] for (k, v) in rows.items()], rateDict, ADVS)
        for k in metadata.keys():
            for (key, val) in metadata[k].items():
                if len(val) < 1:
                    continue
                cmdStr = \
                    "INSERT INTO ibbd2.quota_rate_evaluate \
                    VALUES(NULL,NULL,'{0}','{1}','{2}','{3}','{4}','{5}',{6},NOW())".format(
                    item_id,
                    k,
                    rows[k][1],
                    escapeSQLCommand(rows[k][0]),
                    key.encode('utf-8'),
                    val.keys()[0],
                    val.values()[0],
                    )
                try:
                    c2.execute(cmdStr)
                except Exception, e:
                    print e
    db2.commit()
    c.close()
    db.close()


def run():
    db = getDBConn('ibbd2')
    db.query("""SELECT T2.item_id,T2.user_num_id
      FROM ibbd2.user_config T1
      LEFT JOIN ibbd2.top_itemsearchresult T2
      ON T1.config_value=T2.keyword
      AND DATE(T2.population_tsmp)=CURDATE()
      WHERE T1.config_key='keyword'
      AND T1.status='1'
      GROUP BY T2.item_id""")
    r = db.store_result()
    rs = [r.fetch_row()[0][0] for i in range(r.num_rows())]
    db.close()
    for iid in rs:
        print time.asctime(), iid
        evaluateRatesByItemId(iid)
    pass


def main():

    # evaluateRatesByItemId('13343206931')
    # test()

    run()


if __name__ == '__main__':
    main()
