import clipboard

def linkGen(header, quiet=True):
    temp = '#' + header.replace(' ', '-')
    clipboard.copy(temp)
    print(temp, "is copied to clipboard!")
    
    if quiet:
        return None
    else:
        return temp