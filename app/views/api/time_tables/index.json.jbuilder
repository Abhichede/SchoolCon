json.Monday{
  json.array! @time_tables.where(day: 'Monday'), partial: 'api/time_tables/time_table', as: :time_table
}
json.Tuesday{
  json.array! @time_tables.where(day: 'Tuesday'), partial: 'api/time_tables/time_table', as: :time_table
}

json.Wednesday{
  json.array! @time_tables.where(day: 'Wednesday'), partial: 'api/time_tables/time_table', as: :time_table
}

json.Thursday{
  json.array! @time_tables.where(day: 'Thursday'), partial: 'api/time_tables/time_table', as: :time_table
}

json.Friday{
  json.array! @time_tables.where(day: 'Friday'), partial: 'api/time_tables/time_table', as: :time_table
}

json.Saturday{
  json.array! @time_tables.where(day: 'Saturday'), partial: 'api/time_tables/time_table', as: :time_table
}

