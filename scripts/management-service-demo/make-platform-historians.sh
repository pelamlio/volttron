. demo-vars.sh

if [ -z "$VOLTTRON_HOME" ]; then
  echo "VOLTTRON_HOME UNSET setting to v1_home: $V1_HOME";
  VOLTTRON_HOME=$V1_HOME
fi

echo 'Installing platform 1 historian'
VOLTTRON_HOME=$V1_HOME ../pack_install.sh \
../../../Agents/SQLHistorianAgent/ \
./platform-historian-config1 hist

VOLTTRON_HOME=$V1_HOME volttron-ctl start --tag hist

echo 'Installing platform 2 historian'
VOLTTRON_HOME=$V2_HOME ../pack_install.sh \
../../../Agents/SQLHistorianAgent/ \
./platform-historian-config2 hist

VOLTTRON_HOME=$V2_HOME volttron-ctl start --tag hist

echo 'Installing platform 3 historian'
VOLTTRON_HOME=$V3_HOME ../pack_install.sh \
../../../Agents/SQLHistorianAgent/ \
./platform-historian-config3 hist

VOLTTRON_HOME=$V3_HOME volttron-ctl start --tag hist