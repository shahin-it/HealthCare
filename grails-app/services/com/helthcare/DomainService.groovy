package com.helthcare

import grails.gorm.transactions.Transactional

@Transactional
class DomainService {

    private Closure getCriteriaClosure(Map params) {
        return {
            if (params.searchText) {
                ilike("name", "%${params.searchText.trim().encodeAsLikeText()}%")
            }
            if(params.ids) {
                inList("id", params.list("ids").collect {it.toLong()})
            }
//            eq("isInTrash", false)
        }
    }

    Map dataTableElement(def domain, Map params) {
        Map data = [:]
        int max = params.max ?: 100
        int offset = params.offset ?: 0;
        String dir = params.dir ?: "asc"
        String sort = params.sort ?: "name"
        Map listMap = [max: max, offset: offset]

        data.count = domain.createCriteria().count {
            and getCriteriaClosure(params)
        }
        data.items = domain.createCriteria().list(listMap) {
            and getCriteriaClosure(params)
            order(sort, dir)
        }

        return data
    }
}
