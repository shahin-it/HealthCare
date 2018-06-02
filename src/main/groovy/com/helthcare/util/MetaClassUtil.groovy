package com.helthcare.util

import groovy.time.BaseDuration
import groovy.time.TimeCategory
import org.codehaus.groovy.runtime.NullObject
import java.lang.reflect.Field
import java.nio.file.Files
import java.nio.file.attribute.BasicFileAttributes
import java.nio.file.attribute.FileTime
import java.text.SimpleDateFormat

static init() {

    if(hasProperty("toDate")) {
        return;
    } //To Prevent Double Initialization

    Date.metaClass.with {
        toGMT = { timeZone = null ->
            long time = delegate.getTime() - (timeZone ?: TimeZone.default).getOffset(delegate)
            return new Date(time)
        }

        toAdminFormat = { showTime, showZone, timeZone ->
            long time = delegate.getTime() + timeZone.getOffset(delegate);
            String dateFormat = "dd-mm-yyyy"
            String timeFormat = "hh:mm:ss"
            return new Date(time).toFormattedString(dateFormat, showTime, timeFormat, showZone, timeZone);
        }

        /**
         * It assumes that calling date is of GMT+0
         */
        toDatePickerFormat = { showTime, timeZone ->
            long time = delegate.getTime() + timeZone.getOffset(delegate);
            String dateFormat = "yyyy-MM-dd"
            return new Date(time).toFormattedString(dateFormat, showTime, "HH:mm:ss", false, timeZone);
        }



        /**
         * It assumes that calling date is of GMT+0
         */
        toFormattedString = { datePattern, showTime, timePattern, showZone, timeZone ->
            String zoneString = "";
            if(showZone) {
                String symbol;
                int offset = timeZone.getOffset(delegate)
                if(offset < 0) {
                    symbol = "-";
                    offset *= -1;
                } else {
                    symbol = "+";
                }
                double hour = offset / 1000 / 60 / 60;
                int hourOffset = Math.floor(hour);
                int minOffset = Math.floor((hour - hourOffset) * 60);
                zoneString = " (GMT" + symbol + hourOffset.toNDigit(2) + ":" + minOffset.toNDigit(2) + ")";
            }
            SimpleDateFormat formatted = new SimpleDateFormat(datePattern + (showTime ? " " + timePattern : ""));
            return formatted.format(delegate) + zoneString;
        }

        getDayStart = {
            return delegate.clearTime();
        }

        getMonthStart = {
            Calendar cal = Calendar.getInstance()
            cal.setTime(delegate)
            cal.set(Calendar.DAY_OF_MONTH, 1)
            cal.set(Calendar.HOUR_OF_DAY, 0)
            cal.clear(Calendar.MINUTE)
            cal.clear(Calendar.SECOND)
            cal.clear(Calendar.MILLISECOND)
            return cal.getTime();
        }

        getDayEnd = {
            delegate.clearTime() + 1.days - 1.seconds;
        }

        plus = { BaseDuration duration ->
            TimeCategory.plus(delegate, duration)
        }

        minus = { Date duration -> //duration can be date or duration
            TimeCategory.minus(delegate, duration)
        }

        minus = { BaseDuration duration -> //duration can be date or duration
            TimeCategory.minus(delegate, duration)
        }
    }

    File.metaClass.with {
        created = {
            BasicFileAttributes attributes = Files.readAttributes(delegate.toPath(), BasicFileAttributes.class);
            FileTime creationTime = attributes.creationTime();
            return creationTime.toMillis();
        }
    }

    Integer.metaClass.with {
        toNDigit = { n ->
            return String.format("%0" + n + "d", delegate);
        }

        getMonths = {
            TimeCategory.getMonths(delegate)
        }

        getYears = {
            TimeCategory.getYears(delegate)
        }

        getWeeks = {
            TimeCategory.getWeeks(delegate)
        }

        getDays = {
            TimeCategory.getDays(delegate)
        }

        getHours = {
            TimeCategory.getHours(delegate)
        }

        getMinutes = {
            TimeCategory.getMinutes(delegate)
        }

        getSeconds = {
            TimeCategory.getSeconds(delegate)
        }

        getMilliseconds = {
            TimeCategory.getMilliseconds(delegate)
        }
    }

    Map.metaClass.with {
        merge = { Map _map ->
            Map source = delegate
            _map.each {
                if(source[it.key] instanceof Map && it.value instanceof Map) {
                    source[it.key].merge it.value
                } else if(source[it.key] instanceof Collection && it.value instanceof Collection) {
                    source[it.key].addAll it.value
                } else {
                    source[it.key] = it.value
                }
            }
        }

        lmerge = { _map ->
            _map.each {
                if(!delegate.delegate.containsKey(it.key)) {
                    delegate.delegate.putAt it.key, it.value
                } else if (delegate.delegate[it.key] instanceof Map) {
                    delegate.delegate[it.key].lmerge it.value
                }
            }
        }
    }

    HashMap.metaClass.with {
        list = { _name ->
            Object paramValues = delegate[_name];
            if (paramValues == null) {
                return Collections.EMPTY_LIST;
            }
            if (paramValues.getClass().isArray()) {
                return Arrays.asList((Object[])paramValues);
            }
            if (paramValues instanceof Collection) {
                return new ArrayList((Collection)paramValues);
            }
            return Collections.singletonList(paramValues);
        }
    }

    Closure nullClosure = {
        toInteger = { Integer defaultInt = 0 ->
            return defaultInt;
        }

        toLong = { Long defaultLong = 0 ->
            return defaultLong;
        }

        toBoolean = { Boolean defaultBoolean = false ->
            return defaultBoolean;
        }

        trim = { String defaultString = null ->
            return defaultString;
        }
    }

    NullObject.metaClass.with nullClosure

    Number.metaClass.with {
        toPrice = { padZero = true ->
            return delegate.toFixed(2, padZero);
        }

        toLength = { padZero = true ->
            return delegate.toFixed(2, padZero);
        }

        toWeight = { padZero = true ->
            return delegate.toFixed(3, padZero);
        }

        toFixed = { n, padZero = true ->
            if(delegate instanceof Integer || delegate instanceof Long) {
                return delegate.toDouble().toFixed(n, padZero)
            }
            def string = String.format("%.${n}f", delegate);
            if (!padZero) {
                string = string.replaceAll(/(\.0*|0+)$/, "")
            }
            return string
        }
    }

    String.metaClass.with {
        toDate = { String format = null ->
            try {
                SimpleDateFormat dateFormat = new SimpleDateFormat(format ?: "dd-mm-yyyy hh:mm:ss");
                return dateFormat.parse(delegate)
            } catch (Throwable x) {
                return null;
            }
        }

        toInteger = { Integer defaultInt ->
            try {
                return delegate.toInteger();
            } catch (Throwable x) {
                return defaultInt;
            }
        }

        textify = {
            return delegate.replaceAll("\\<[^>]*>", "");
        }

        truncate = { Integer length ->
            if (length > 3 && delegate.size() > length) {
                return delegate.substring(0, length - 3) + "...";
            }
            return delegate;
        }

        toLong = { Long defaultLong ->
            try {
                return delegate.toLong();
            } catch (Throwable x) {
                return defaultLong;
            }
        }

        toDouble = { Double defaultDouble ->
            try {
                return delegate.toDouble();
            } catch (Throwable x) {
                return defaultDouble;
            }
        }

        toBoolean = { Boolean defaultBoolean = false ->
            if (delegate == "") {
                return defaultBoolean;
            }
            String check = delegate.toLowerCase()
            return check == "true" || check == "yes" || check == "on" || check == "1";
        }

        /**
         * It assumes the format is only a date format
         * default format is yyyy-MM-dd
         */
        getDayStart = { String format = null ->
            return (delegate + " 00:00:00").toDate(format ? format + " hh:mm:ss" : null);
        }

        /**
         * It assumes the format is only a date format
         * default format is yyyy-MM-dd
         */
        getDayEnd = { String format = null ->
            return (delegate + " 23:59:59").toDate(format ? format + " hh:mm:ss" : null);
        }

        sanitize = {
            return delegate.trim().toLowerCase().replaceAll(/[\s\.]/, "-").replaceAll("[^a-z0-9-\\._]+", "-")
        }

        removeLast = { char match ->
            int index = delegate.lastIndexOf((int) match);
            String returnable = delegate;
            if (index != -1) {
                returnable = delegate.substring(0, index) + delegate.substring(index + 1);
            }
            return returnable;
        }

        replaceLast = { char match, char replace ->
            int index = delegate.lastIndexOf((int) match);
            String returnable = delegate;
            if (index != -1) {
                returnable = delegate.substring(0, index) + replace + delegate.substring(index + 1);
            }
            return returnable;
        }

        dotCase = {
            def writer = new StringWriter();
            def reader = new StringReader(delegate);
            char data;
            while ((data = reader.read()) != -1) {
                if (data > ('@' as char) && data < ('[' as char)) {
                    writer.append(".")
                    writer.append((char) (data.charValue() + 32))
                } else {
                    writer.append(data)
                }
            }
            return writer.toString()
        }

        camelCase = { initial = true ->
            def writer = new StringWriter();
            def reader = new StringReader(delegate);
            char data;
            boolean nextUpper = initial
            while ((data = reader.read()) != -1) {
                if(data > ('`' as char) && data < ('{' as char)) {
                    if(nextUpper) {
                        writer.append((char) (data.charValue() - 32))
                        nextUpper = false
                    } else {
                        writer.append(data)
                    }
                } else if ((data > ('@' as char) && data < ('[' as char)) || (data > ('/' as char) && data < (':' as char))) {
                    nextUpper = false
                    writer.append(data)
                } else {
                    nextUpper = true
                }
            }
            return writer.toString()
        }

        toValidFileName = {
            return delegate.replaceAll(";", "")
        }

        toAdminPrice = { precision = 2 ->
            return delegate.toDouble().toFixed(precision, false)
        }
    }


    TimeZone.metaClass.with {
        getOffset = { date ->
            if(delegate.inDaylightTime(date)) {
               return delegate.rawOffset + delegate.getDSTSavings()
            } else {
               return delegate.rawOffset
            }
        }
    }

    URL.metaClass.with {
        post = { data ->
            String parameters = WebUtils.toQueryString(data).substring(1)
            HttpURLConnection connection = (HttpURLConnection) delegate.openConnection();
            connection.setDoOutput(true);
            connection.setDoInput(true);
            connection.setInstanceFollowRedirects(false);
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            connection.setRequestProperty("charset", "utf-8");
            connection.setUseCaches (false);
            DataOutputStream wr = new DataOutputStream(connection.getOutputStream());
            wr.writeBytes(parameters);
            wr.flush();
            wr.close();
            ByteArrayOutputStream out = new ByteArrayOutputStream()
            out << connection.getInputStream()
            connection.disconnect();
            out.flush()
            return out.toString()
        }
    }

    Object.metaClass.with {
        getPrivateValue = { name, clazz = null ->
            Field field = (clazz ?: delegate.class).getDeclaredField(name);
            if(!field) {
                return null;
            }
            field.setAccessible(true);
            return field.get(delegate);
        }

        setPrivateValue = { name, value, clazz = null ->
            Field field = (clazz ?: delegate.class).getDeclaredField(name);
            if(!field) {
                return;
            }
            field.setAccessible(true);
            field.set delegate, value
        }
    }
}
