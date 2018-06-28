<tr class="order-item service-${service.id}">
    <td class="id"><span class="value">#service</span><input type="hidden" name="service.id" value="${service.id}"></td>
    <td class="name"><span class="value">${service.name}</span></td>
    <td class="quantity"><span class="value"><input name="service.quantity" type="number" required value="1" min="1"></span></td>
    <td class="rate"><span class="value"><input name="service.basePrice" type="number" required value="${service.basePrice}" min="0"></span></td>
    <td class="discount"><span class="value"><input name="service.discount" type="number" required value="${service.plainDiscount}" min="0"></span></td>
    <td class="price"><span class="value">0.0</span></td>
    <td class="action-navigator btn-group center">
        <span class="btn btn-xs btn-warning remove" title="Remove"><i class="glyphicon glyphicon-trash"></i></span>
    </td>
</tr>