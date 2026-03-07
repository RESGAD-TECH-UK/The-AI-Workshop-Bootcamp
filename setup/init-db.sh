#!/bin/bash

echo "⏳ Waiting for SQL Server to be ready..."
sleep 15

/opt/mssql-tools18/bin/sqlcmd -S sqlserver -U sa -P "Bootcamp123!" -C -Q "SELECT 1" > /dev/null 2>&1
while [ $? -ne 0 ]; do
  echo "Still waiting..."
  sleep 5
  /opt/mssql-tools18/bin/sqlcmd -S sqlserver -U sa -P "Bootcamp123!" -C -Q "SELECT 1" > /dev/null 2>&1
done

echo "✅ SQL Server is ready. Creating BootcampDB..."

/opt/mssql-tools18/bin/sqlcmd -S sqlserver -U sa -P "Bootcamp123!" -C -i /workspace/setup/seed.sql

echo "🎉 Database setup complete! Open any .sql file in /exercises to get started."
