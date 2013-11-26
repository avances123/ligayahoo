#!/bin/bash
cd node_modules/cube/
node bin/collector.js 2>&1 >> /tmp/collect.log &
node bin/evaluator.js 2>&1 >> /tmp/evaluator.log &

