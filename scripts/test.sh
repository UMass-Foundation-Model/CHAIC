port=11000
pkill -f -9 "port $port"

python tdw-gym/experiment.py \
--output_dir results \
--experiment_name outdoor_shopping_task_test_helper \
--run_id test \
--port $port \
--agents plan_agent test_agent child_agent \
--max_frames 3000 \
--data_prefix dataset/test_dataset/outdoor_shopping \
--screen_size 512 \
--debug

ps ux | grep port\ $port | awk {'print $2'} | xargs kill

# please set the test agent to be the helper(a.k.a the second agent)