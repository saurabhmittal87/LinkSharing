package linksharing

class CommonService {

    def List getSubList(List list, Integer offset, Integer max)
    {
        Integer itemCount = list.size()
        if(offset == null)
            return list
        else
            return list.subList(offset, (offset+max) < itemCount ? (offset + max) : itemCount)

    }
}
