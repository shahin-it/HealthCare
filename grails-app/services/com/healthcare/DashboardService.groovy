package com.healthcare

import com.healthcare.pathology.Order
import grails.gorm.transactions.Transactional

@Transactional
class DashboardService {

    DomainService domainService

    List getSellByMonth(Map params = [:]) {
        return Order.createCriteria().list {
            between("year", 2017, 2018)
            projections {
                groupProperty("month")
                sum("paid")
            }
        }
    }

    List getTestChart() {
        return Order.createCriteria().list {
            projections {
                items {
                    groupProperty("name")
                    sum("quantity")
                }
            }
        }
    }

    List getOrderStatus() {
        return Order.createCriteria().list {
            projections {
                groupProperty("paymentStatus")
                count("id")
            }
        } + Order.createCriteria().list {
            projections {
                groupProperty("deliveryStatus")
                count("id")
            }
        }
    }

    Map getOverAllStatus() {

    }

    List<Order> getLatestOrder() {
        return domainService.dataTableElement(Order, [max: 5, sort: "created", dir: "desc"]).items
    }
}
