#!/usr/bin/env ruby -wKU
# encoding: utf-8

# Used as a common require to set up the environment for commands. 

SUPPORT = "#{ENV['TM_SUPPORT_PATH']}"
#BUN_SUP = File.expand_path(File.dirname(__FILE__))

$: << File.expand_path(File.dirname(__FILE__))
#$: << File.expand_path("#{ENV['TM_SUPPORT_PATH']}")

require SUPPORT + '/lib/escape'
require SUPPORT + '/lib/exit_codes'
require SUPPORT + '/lib/textmate' 
require SUPPORT + '/lib/ui'
require SUPPORT + '/lib/tm/htmloutput'

require 'fm/flex_mate'
require 'fm/log' #Only used by AutoComplete
require 'fm/sdk'
require 'fm/template_machine' #Used
require 'fm/bundle_tool'

require 'as3/completions/completions_list' #Only used by AutoComplete
require 'as3/parsers/class_parser'
require 'as3/parsers/property_inspector'
require 'as3/templates/snippet_builder'
require 'as3/templates/snippet_controller'
require 'as3/templates/snippet_provider'
require 'as3/tools/source_tools'

#Branch specific requires
require SUPPORT + '/lib/tm/process'
require 'fm/compiler'
require 'fm/mxmlc_exhaust'
