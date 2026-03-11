#!/bin/bash

LOG_FILE="/var/log/messages"
REPORT="log_report.txt"

echo "Linux Log Analysis Report" > $REPORT
echo "Generated on: $(date)" >> $REPORT
echo "--------------------------" >> $REPORT

ERROR_COUNT=$(grep -i "error" $LOG_FILE | wc -l)
WARNING_COUNT=$(grep -i "warning" $LOG_FILE | wc -l)

echo "Total Errors: $ERROR_COUNT" >> $REPORT
echo "Total Warnings: $WARNING_COUNT" >> $REPORT
echo "" >> $REPORT

echo "Recent Errors:" >> $REPORT
grep -i "error" $LOG_FILE | tail -5 >> $REPORT

echo "" >> $REPORT
echo "Recent Warnings:" >> $REPORT
grep -i "warning" $LOG_FILE | tail -5 >> $REPORT

echo "" >> $REPORT
echo "Log analysis complete. Report saved to $REPORT"
