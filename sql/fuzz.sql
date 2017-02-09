SELECT fuzzed as bug, trigger, extra_duas, atp,
    dbt.all_labels[1] as tr,
    dbe1.all_labels[1] as e1,
    dbe2.all_labels[1] as e2,
    attackpoint.loc_filename as file,
    attackpoint.loc_begin_line as line
    FROM run
    JOIN bug on fuzzed = bug.id
    JOIN duabytes dbt on trigger = dbt.id
    JOIN duabytes dbe1 on extra_duas[1] = dbe1.id
    JOIN duabytes dbe2 on extra_duas[2] = dbe2.id
    JOIN attackpoint on atp = attackpoint.id
    AND fuzzed IS NOT NULL
    AND exitcode < 0
    ORDER BY fuzzed;