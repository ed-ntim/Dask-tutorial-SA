cd /home/data/username
JPORT=$(shuf -i 8400-9400 -n 1)
echo ""
echo ""
echo "Step 1: Wait until this script says the Jupyter server"
echo "        has started. "
echo ""
echo "Step 2: Copy this ssh command into a terminal on your"
echo "        local computer:"
echo ""
echo "        ssh -N -L 8889:`hostname`:$JPORT $USER@lengau.chpc.ac.za"
echo ""
echo "Step 3: Browse to http://localhost:8889 on your local computer"
echo ""
echo ""
sleep 2
jupyter lab --no-browser --ip=`hostname` --port=$JPORT
