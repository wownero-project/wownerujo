/*
 * Copyright (c) 2018 m2049r
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.wownero.wownerujo.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.TimeZone;
import java.util.concurrent.TimeUnit;
import timber.log.Timber;

public class RestoreHeight {
    static private RestoreHeight Singleton = null;

    static public RestoreHeight getInstance() {
        if (Singleton == null) {
            synchronized (RestoreHeight.class) {
                if (Singleton == null) {
                    Singleton = new RestoreHeight();
                }
            }
        }
        return Singleton;
    }

    private Map<String, Long> blockheight = new HashMap<>();

    RestoreHeight() {
        blockheight.put("2018-05", 8000L);
        blockheight.put("2018-06", 17000L);
        blockheight.put("2018-07", 25000L);
        blockheight.put("2018-08", 34000L);
        blockheight.put("2018-09", 43000L);
        blockheight.put("2018-10", 52000L);
        blockheight.put("2018-11", 60000L);
        blockheight.put("2018-12", 66000L);
    }

    long latestHeight = 66000L;

    public long getHeight(final Date date) {
        Timber.d("Restore Height date %s", date);

        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        Timber.d("Restore Height cal %s", cal);

        if (cal.get(Calendar.YEAR) < 2018)
            return 0;
        // Month is 0 based
        // https://stackoverflow.com/a/7183009
        if ((cal.get(Calendar.YEAR) == 2018) && ((cal.get(Calendar.MONTH) + 1) <= 4))
            // before Apr 2018
            return 0;

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM");

        String queryDate = formatter.format(date);
        Timber.d("String query date %s", queryDate);

        long height = 0;
        if (blockheight.get(queryDate) == null) {
            height = latestHeight;
        } else {
            height = blockheight.get(queryDate);
        }

        return height;
    }
}
