import os
import sys
import re


rg_list = (
    (re.compile('\s+'), ' '),
    (re.compile('\(\s+'), '('), 
    (re.compile('\s+\)'), ')'),
    )

editions = {
    'Second': '2nd',
    'Third': '3rd',
    'Fourth': '4th',
    'Fifth': '5th',
    '2Nd': '2nd',
    '3Rd': '3rd',
    '4Th': '4th',
    '5Th': '5th',
    }


def refineBookName(fname):
    """ Returns the refined name for given file 
    """
    if fname.find(' ') == -1 and fname.find('-') != -1:
        name = fname.replace('-', ' ')
    else:
        name = fname
    name = name.lower().split('.')
    if len(name) > 1:
        ext = name[-1]
        del name[-1]
    else: 
        ext = ''
    name = ' '.join(name)
    name = name.replace('_', ' ')

    # regex stuff
    for rg in rg_list:
        name = re.sub(rg[0], rg[1], name)
    name = name.title()
    # editions
    for ed in editions:
        name = name.replace(ed, editions[ed])

    if ext:
        name = '%s.%s' % (name, ext)
    return name


if __name__ == "__main__":

    if len(sys.argv) > 1:
        target = sys.argv[1]
        try:
            os.rename(target, refineBookName(target))
        except:
            print 'Cannot rename %s' % target 
    else:
        file_list = [fi for fi in os.listdir('.') if os.path.isfile(fi)]
        for sfile in file_list:
            try:
                os.rename(sfile, refineBookName(sfile))
            except:
                print 'Cannot rename %s' % sfile
                raise

