package com.healthcare

import com.healthcare.pathology.Order
import grails.gorm.transactions.Transactional

@Transactional
class DomainService {

    private Closure getCriteriaClosure(Map params) {
        return {
            if (params.searchText) {
                ilike("name", "%${params.searchText}%")
            }
            if(params.ids) {
                inList("id", params.list("ids").collect {it.toLong()})
            }
//            eq("isInTrash", false)
        }
    }

    Map dataTableElement(def domainClass, Map _params) {
        Map params = _params.clone()
        params.remove("controller")
        params.remove("action")
        Map data = [:]
        int max = params.max ? params.max.toInteger() : 100
        int offset = params.offset ? params.offset.toInteger() : 0
        String sort = params.sort ?: null
        String dir = params.dir ?: "asc"
        Map listMap = [max: max, offset: offset]

        data.count = domainClass.createCriteria().count {
            and getCriteriaClosure(params)
        }
        data.items = domainClass.createCriteria().list(listMap) {
            and getCriteriaClosure(params)
            if(sort) {
                order(sort, dir)
            }
        }

        return data
    }

    Boolean save(def domainObj, Map _params = [:]) {
        Map params = _params.clone()
        params.remove("controller")
        params.remove("action")
        domainObj.save()
        return !domainObj.hasErrors()
    }

    def delete(def domain, Map params = [:]) {
        return domain.delete()
    }

    Map getKeyValue(def domainclass, String valProp, Closure closure = {}) {
        List items = domainclass.createCriteria().list {
            projections {
                property("id")
                property(valProp)
            }
            and closure
        }
        return items.collectEntries {[(it[0]): it[1]]}
    }

    List getKeyValueProp(def domainClass, Closure closure = {}) {
        return domainClass.createCriteria().list {
            and closure
        }
    }
}
