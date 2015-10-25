#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import jieba

seg_list = jieba.cut("中药袋泡四物汤袋泡茶", cut_all=True)
print 'Full Mode:', '/ '.join(seg_list).encode('utf-8')

seg_list = jieba.cut("醉花茗 中药袋泡四物汤袋泡茶 补血补气 调经 改善痛经 45包/袋", cut_all=True)
print 'Full Mode:', '/ '.join(seg_list).encode('utf-8')

seg_list = jieba.cut("醉花茗 中药袋泡四物汤袋泡茶 补血补气 调经 改善痛经 45包/袋", cut_all=False)
print 'Default Mode:', '/ '.join(seg_list).encode('utf-8')

seg_list = jieba.cut("醉花茗 中药袋泡四物汤袋泡茶 补血补气 调经 改善痛经 45包/袋")
print ', '.join(seg_list).encode('utf-8')

seg_list = jieba.cut_for_search("醉花茗 中药袋泡四物汤袋泡茶 补血补气 调经 改善痛经 45包/袋")
print ', '.join(seg_list).encode('utf-8')

import jieba.analyse

content = \
    """【12.12】醉花茗 中药袋泡四物汤袋泡茶 补血补气 调经 改善痛经 45包/袋
满额包邮 陈皮 理气开胃化痰 健胃养脾 消积食100克"""
tags = jieba.analyse.extract_tags(content)
print ','.join(tags).encode('utf-8')
