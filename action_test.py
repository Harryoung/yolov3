import argparse
parser = argparse.ArgumentParser()
parser.add_argument('--t', help=' ', action='store_false')#, default=False)
# parser.add_argument('--t', help=' ', action='store_true')#, default=False)
config = parser.parse_args()

print(config.t)

# 也就是说，当store_true的时候，如果命令行没有输入该选项，则存为false，否则存为true
# 当store_false的时候，如果命令行没有输入该选项，则存为true，否则存为false
# 即，这是一个命令行有无指定该参数的开关，store_{}指定的是当指定时要赋的值