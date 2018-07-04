<%@ page import="com.healthcare.util.AppUtil" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Customer Receipt #${order.patient.id}</title>
    <asset:stylesheet src="invoice/invoice.css" media="all"/>
</head>
<body>
<header class="clearfix">
    <div id="logo">
        <img src="${app.systemResourceBaseUrl() + global.logo}">
    </div>
    <div id="company">
        <h2 class="name">${global.name}</h2>
        <div>${global.address1}</div>
        <g:if test="${global.address2}">
            <div>${global.address2}</div>
        </g:if>
        <div>☎ ${global.contact}</div>
        <div><a href="mailto:${global.email}">${global.email}</a></div>
    </div>
</div>
</header>
<main>
    <div id="details" class="clearfix">
        <div id="client">
            <div class="to">INVOICE TO:</div>
            <h2 class="name">${order.patient.name}</h2>
            <div class="address">${order.patient.flatAddress}</div>
            <div class="email"><a href="tel:${order.patient.mobile}">&#9742; ${order.patient.mobile}</a></div>
        </div>
        <div id="invoice">
            <h1>INVOICE #${order.id}</h1>
            <div class="date">Date of Invoice: ${order.created.toAdminFormat()}</div>
            <div class="date">Delivery Date: ${order.delivery.toAdminFormat()}</div>
        </div>
    </div>
    <table border="0" cellspacing="0" cellpadding="0">
        <thead>
        <tr>
            <th class="no">#</th>
            <th class="desc">DESCRIPTION</th>
            <th class="unit">UNIT PRICE</th>
            <th class="qty">QUANTITY</th>
            <th class="disc">DISCOUNT(-)</th>
            <th class="total">TOTAL</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${order.items}" var="item" status="i">
            <tr>
                <td class="no">${i + 1}</td>
                <td class="desc"><h3>${item.name}</h3>${item.instruction}</td>
                <td class="unit">৳${item.basePrice.toPrice()}</td>
                <td class="qty">${item.quantity}</td>
                <td class="disc">৳${item.discount.toPrice()}</td>
                <td class="total">৳${item.grandTotal.toPrice()}</td>
            </tr>
        </g:each>
        </tbody>
        <tfoot>
        <tr>
            <td colspan="3"></td>
            <td colspan="2">SUBTOTAL</td>
            <td>৳${order.total.toPrice()}</td>
        </tr>
        <tr>
            <td colspan="3"></td>
            <td colspan="2">DISCOUNT(-)</td>
            <td>৳${order.discount.toPrice()}</td>
        </tr>
        <tr>
            <td colspan="3"></td>
            <td colspan="2">GRAND TOTAL</td>
            <td>৳${order.grandTotal.toPrice()}</td>
        </tr>
        <tr>
            <td colspan="3"></td>
            <td colspan="2">PAID TOTAL</td>
            <td>৳${order.paid.toPrice()}</td>
        </tr>
        <tr>
            <td colspan="3"></td>
            <td colspan="2">DUE TOTAL</td>
            <td>৳${order.due.toPrice()}</td>
        </tr>
        </tfoot>
    </table>
    <div id="thanks">Thank you!</div>
    <div id="notices">
        <div>PREPARED BY#${order.createdBy.id}: ${order.createdBy.name}</div>
        <div>PRINTED BY#${AppUtil.loggedUser}: ${AppUtil.currentUser.name}</div>
        <div>Referred By#${order.consultant.id}: Dr. ${order.consultant.name}</div>
        <div class="notice">NOTICE: A finance charge of 1.5% will be made on unpaid balances after 30 days.</div>
    </div>
</main>
<footer>
    Invoice was created on a computer and is valid without the signature and seal.
</footer>
</body>
</html>