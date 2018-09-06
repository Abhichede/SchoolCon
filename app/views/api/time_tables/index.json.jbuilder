json.Monday{
  json.array! @time_tables.where(day: 'Monday').order("start_time ASC"), partial: 'api/time_tables/time_table', as: :time_table
}
json.Tuesday{
  json.array! @time_tables.where(day: 'Tuesday').order("start_time ASC"), partial: 'api/time_tables/time_table', as: :time_table
}

json.Wednesday{
  json.array! @time_tables.where(day: 'Wednesday').order("start_time ASC"), partial: 'api/time_tables/time_table', as: :time_table
}

json.Thursday{
  json.array! @time_tables.where(day: 'Thursday').order("start_time ASC"), partial: 'api/time_tables/time_table', as: :time_table
}

json.Friday{
  json.array! @time_tables.where(day: 'Friday').order("start_time ASC"), partial: 'api/time_tables/time_table', as: :time_table
}

json.Saturday{
  json.array! @time_tables.where(day: 'Saturday').order("start_time ASC"), partial: 'api/time_tables/time_table', as: :time_table
}

