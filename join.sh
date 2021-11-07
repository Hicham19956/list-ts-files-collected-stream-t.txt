#!/bin/bash
#/* ************************************************************************* */
#/*                   ╔══╗                        ╔══════╗                    */
#/*                   ║ ╔══╗       _____ __       ║      ║                    */
#/*                   ║ ║ ╔══╗    |_   _/__\      ║      ║                    */
#/*                   ╚═║ ║  ║      | || \/ |     ║      ║                    */
#/*                     ╚═║  ║      |_| \__/      ║      ║                    */
#/*                       ╚══╝                    ╚══════╝                    */
#/*    Creared: 31-10-2021 15:11:34                                           */
#/*    Updated: date -r join.sh "+%m-%d-%Y %H:%M:%S"                          */
#/*             Saturday 11-07-2021 14:04:00                                  */
#/* by: Hicham EL BADAOUI <elbadaoui.hicham3@gmail.com>                       */
#/*                                                                           */
#/* ************************************************************************* */

nmbts=`ls -l --time-style=full-iso *.ts | awk '{print $6,$7,$9}' | sort -n | wc -l`

if [ $nmbts = 0 ]; then
	echo "no *_*.ts files to class it."
else
	i=1
	echo "number of *_*.ts files is $nmbts."
	while [ $i -le $nmbts ]
	do
	  echo $i
	  ls -l --time-style=full-iso *.ts | awk '{print $6,$7,$9}' | sort -n | head -$i | tail -1 | awk '{print $2,$3}' | sed -e "s/\b[0-9]\{2\}:[0-9]\{2\}:[0-9]\{2\}.\b[0-9]\{9\} \b/file {path}/g" >> t.txt
	   sed -i -e "s|{path}|$PWD|g" t.txt 
	  ((i++))
	done
fi
clear -x

