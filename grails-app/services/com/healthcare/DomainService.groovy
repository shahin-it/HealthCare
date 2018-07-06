package com.healthcare

import grails.gorm.transactions.Transactional

@Transactional
class DomainService {

    private Closure getCriteriaClosure(def domainClass, Map params) {
        return {
            if (params.searchText) {
                or {
                    if(params.searchText.isNumber()) {
                        eq("id", params.searchText as long)
                    } else {
                        if(domainClass.hasDeclaration("name")) {
                            ilike("name", "%${params.searchText}%")
                        }
                        if(params.searchcriteria) {
                            searchCriteria
                        }
                    }
                }
            }
            if(params.createdFrom) {
                Date date = params.createdFrom.dayStart.toGMT()
                ge("created", date)
            }
            if(params.createdTo) {
                Date date = params.createdTo.dayEnd.toGMT()
                le("created", date);
            }
            if(params.ids) {
                inList("id", params.list("ids").collect {it.toLong()})
            }
//            eq("isInTrash", false)
        }
    }

    Map dataTableElement(def domainClass, Map _params, Closure criteria = {}) {
        Map params = _params.clone()
        params.remove("controller")
        params.remove("action")
        Map data = [:]
        int max = params.max ? params.max.toInteger() : DomainConstant.MAX_RESULT
        int offset = params.offset ? params.offset.toInteger() : 0
        String sort = params.sort ?: null
        String dir = params.dir ?: "asc"
        Map listMap = [max: max, offset: offset]

        data.count = domainClass.createCriteria().count() {
            and getCriteriaClosure(domainClass, params)
            and criteria
        }
        data.items = domainClass.createCriteria().list(listMap) {
            and getCriteriaClosure(domainClass, params)
            and criteria
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
